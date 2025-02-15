#!/usr/bin/python3

import argparse
import os
import re
import subprocess
import sys
from collections import OrderedDict
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from sty import fg

script_dir = Path(os.path.dirname(os.path.realpath(__file__)))
root_dir = script_dir / ".."
asm_dir = root_dir / "ver/current/asm/nonmatchings/"
build_dir = root_dir / "ver/current/build/"
map_file_path = build_dir / "papermario.map"
rom_path = root_dir / "ver/current/baserom.z64"

OBJDUMP = "mips-linux-gnu-objdump"

@dataclass
class Symbol:
    name: str
    rom_start: int
    ram: int
    current_file: Path
    prev_sym: str
    is_decompiled: bool
    rom_end: Optional[int] = None

    def size(self):
        assert self.rom_end is not None
        return self.rom_end - self.rom_start


@dataclass
class Bytes:
    offset: int
    normalized: str
    bytes: list[int]


def read_rom() -> bytes:
    with open(rom_path, "rb") as f:
        return f.read()


def get_all_unmatched_functions():
    ret = set()
    for root, dirs, files in os.walk(asm_dir):
        for f in files:
            if f.endswith(".s"):
                ret.add(f[:-2])
    return ret


def get_symbol_bytes(func: str) -> Optional[Bytes]:
    if func not in syms or syms[func].rom_end is None:
        return None
    sym = syms[func]
    bs = list(rom_bytes[sym.rom_start : sym.rom_end])

    while len(bs) > 0 and bs[-1] == 0:
        bs.pop()

    insns = bs[0::4]

    ret = []
    for ins in insns:
        ret.append(ins >> 2)

    return Bytes(0, bytes(ret).decode("utf-8"), bs)


def parse_map() -> OrderedDict[str, Symbol]:
    ram_offset = None
    cur_file = "<no file>"
    syms: OrderedDict[str, Symbol] = OrderedDict()
    prev_sym = ""
    prev_line = ""
    cur_sect = ""
    sect_re = re.compile(r"\(\..*\)")
    with open(map_file_path) as f:
        for line in f:
            sect = sect_re.search(line)
            if sect:
                sect_str = sect.group(0)
                if sect_str in ["(.text)", "(.data)", "(.rodata)", "(.bss)"]:
                    cur_sect = sect_str

            if "load address" in line:
                if "noload" in line or "noload" in prev_line:
                    ram_offset = None
                    continue
                ram = int(line[16 : 16 + 18], 0)
                rom = int(line[59 : 59 + 18], 0)
                ram_offset = ram - rom
                continue
            prev_line = line

            if (
                ram_offset is None
                or "=" in line
                or "*fill*" in line
                or " 0x" not in line
            ):
                continue
            ram = int(line[16 : 16 + 18], 0)
            rom = ram - ram_offset
            fn = line.split()[-1]
            if "0x" in fn:
                ram_offset = None
            elif "/" in fn:
                cur_file = fn
            else:
                if cur_sect != "(.text)":
                    continue
                syms[fn] = Symbol(
                    name=fn,
                    rom_start=rom,
                    ram=ram,
                    current_file=Path(cur_file),
                    prev_sym=prev_sym,
                    is_decompiled=not fn in unmatched_functions,
                )
                prev_sym = fn

    # Calc end offsets
    for sym in syms:
        prev_sym = syms[sym].prev_sym
        if prev_sym:
            syms[prev_sym].rom_end = syms[sym].rom_start

    return syms


@dataclass
class Match:
    query_offset: int
    target_offset: int
    length: int

    def __str__(self):
        return f"{self.query_offset} {self.target_offset} {self.length}"


@dataclass
class Result:
    query: str
    target: str
    query_start: int
    target_start: int
    length: int


def get_pair_matches(query_hashes: list[str], sym_hashes: list[str]) -> list[Match]:
    ret = []

    matching_hashes = set(query_hashes).intersection(sym_hashes)
    for hash in matching_hashes:
        ret.append(Match(query_hashes.index(hash), sym_hashes.index(hash), 1))
    return ret


def get_hashes(bytes: Bytes, window_size: int) -> list[str]:
    ret = []
    for i in range(0, len(bytes.normalized) - window_size):
        ret.append(bytes.normalized[i : i + window_size])
    return ret


def group_matches(query: str, target: str, matches: list[Match]) -> list[Result]:
    ret = []

    matches.sort(key=lambda m: m.query_offset)

    match_groups: List[List[Match]] = []
    last_start = matches[0].query_offset
    for match in matches:
        if match.query_offset == last_start + 1:
            match_groups[-1].append(match)
        else:
            match_groups.append([match])
        last_start = match.query_offset

    for group in match_groups:
        query_start = group[0].query_offset
        target_start = group[0].target_offset
        length = len(group)
        ret.append(Result(query, target, query_start, target_start, length))

    return ret


def get_line_numbers(obj_file: Path) -> Dict[int, int]:
    ret = {}

    objdump_out = (
        subprocess.run(
            [OBJDUMP, "-WL", obj_file],
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
        )
        .stdout.decode("utf-8")
        .split("\n")
    )

    if not objdump_out:
        return {}

    for line in objdump_out[7:]:
        if not line:
            continue
        pieces = line.split()

        if len(pieces) < 3:
            continue

        fn = pieces[0]

        if fn == OBJDUMP or fn[0] == "<":
            continue

        starting_addr = int(pieces[2], 0)
        try:
            line_num = int(pieces[1])
            ret[starting_addr] = line_num
        except ValueError:
            continue
    return ret


def get_tu_offset(obj_file: Path, symbol: str) -> Optional[int]:
    objdump = "mips-linux-gnu-objdump"

    objdump_out = (
        subprocess.run([objdump, "-t", obj_file], stdout=subprocess.PIPE)
        .stdout.decode("utf-8")
        .split("\n")
    )

    if not objdump_out:
        return None

    for line in objdump_out[4:]:
        if not line:
            continue
        pieces = line.split()

        if pieces[-1] == symbol:
            return int(pieces[0], 16)
    return None


def get_c_range(
    insn_start: int, insn_end: int, line_numbers: Dict[int, int]
) -> Tuple[Optional[int], Optional[int]]:
    start = line_numbers.get(insn_start)
    end = line_numbers.get(insn_end)
    return start, end


def get_matches(query: str, window_size: int):
    query_bytes: Optional[Bytes] = get_symbol_bytes(query)

    if query_bytes is None:
        sys.exit("Symbol '" + query + "' not found")

    query_hashes = get_hashes(query_bytes, window_size)

    ret: dict[str, float] = {}
    for symbol in syms:
        if query == symbol:
            continue

        sym_bytes: Optional[Bytes] = get_symbol_bytes(symbol)
        if not sym_bytes:
            continue

        if len(sym_bytes.bytes) < window_size:
            continue

        sym_hashes = get_hashes(sym_bytes, window_size)

        matches: list[Match] = get_pair_matches(query_hashes, sym_hashes)
        if matches:
            results = group_matches(query, symbol, matches)
            obj_file = syms[symbol].current_file

            line_numbers = {}
            tu_offset = None
            decompiled_str = ":"
            if syms[symbol].is_decompiled:
                line_numbers = get_line_numbers(obj_file)
                tu_offset = get_tu_offset(obj_file, symbol)
                decompiled_str = fg.green + " (decompiled)" + fg.rs + ":"

            print(symbol + decompiled_str)

            for result in results:
                total_len = result.length + window_size
                query_end = result.query_start + total_len
                target_end = result.target_start + total_len

                c_start: Optional[int] = None
                c_end: Optional[int] = None
                if tu_offset is not None and len(line_numbers) > 0:
                    c_start, c_end = get_c_range(
                        tu_offset + (result.target_start * 4),
                        tu_offset + (target_end * 4),
                        line_numbers,
                    )

                target_range_str = ""
                if c_start is not None or c_end is not None:
                    start_str = c_start if c_start is not None else "?"
                    end_str = c_end if c_end is not None else "?"

                    target_range_str = (
                        fg.li_cyan + f" (line {start_str}-{end_str} in {obj_file.stem})" + fg.rs
                    )

                query_str = f"{query} [{result.query_start}-{query_end}]"
                target_str = (
                    f"{symbol} [{result.target_start}-{target_end}]{target_range_str}"
                )
                print(f"\t{query_str} matches {target_str} ({total_len} total insns)")

    return OrderedDict(sorted(ret.items(), key=lambda kv: kv[1], reverse=True))


def do_query(query, window_size):
    get_matches(query, window_size)


parser = argparse.ArgumentParser(
    description="Tool to find duplicate portions of code from one function in code across the codebase"
)
parser.add_argument("query", help="function")
parser.add_argument(
    "-w",
    "--window-size",
    help="number of bytes to compare",
    type=int,
    default=20,
    required=False,
)

args = parser.parse_args()

if __name__ == "__main__":
    rom_bytes = read_rom()
    unmatched_functions = get_all_unmatched_functions()
    syms = parse_map()

    do_query(args.query, args.window_size)
