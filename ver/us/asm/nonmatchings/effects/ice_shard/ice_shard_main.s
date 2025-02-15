.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

.section .rodata

dlabel D_E01108C0
.double 0.1

.section .text

glabel ice_shard_main
/* 3F83F0 E0110000 27BDFFA8 */  addiu     $sp, $sp, -0x58
/* 3F83F4 E0110004 F7B40040 */  sdc1      $f20, 0x40($sp)
/* 3F83F8 E0110008 4485A000 */  mtc1      $a1, $f20
/* 3F83FC E011000C F7B60048 */  sdc1      $f22, 0x48($sp)
/* 3F8400 E0110010 4486B000 */  mtc1      $a2, $f22
/* 3F8404 E0110014 AFB30034 */  sw        $s3, 0x34($sp)
/* 3F8408 E0110018 0080982D */  daddu     $s3, $a0, $zero
/* 3F840C E011001C F7B80050 */  sdc1      $f24, 0x50($sp)
/* 3F8410 E0110020 4487C000 */  mtc1      $a3, $f24
/* 3F8414 E0110024 27A40010 */  addiu     $a0, $sp, 0x10
/* 3F8418 E0110028 AFB00028 */  sw        $s0, 0x28($sp)
/* 3F841C E011002C 8FB0006C */  lw        $s0, 0x6c($sp)
/* 3F8420 E0110030 3C02E011 */  lui       $v0, %hi(ice_shard_init)
/* 3F8424 E0110034 24420224 */  addiu     $v0, $v0, %lo(ice_shard_init)
/* 3F8428 E0110038 AFA20018 */  sw        $v0, 0x18($sp)
/* 3F842C E011003C 3C02E011 */  lui       $v0, %hi(ice_shard_update)
/* 3F8430 E0110040 2442022C */  addiu     $v0, $v0, %lo(ice_shard_update)
/* 3F8434 E0110044 AFA2001C */  sw        $v0, 0x1c($sp)
/* 3F8438 E0110048 3C02E011 */  lui       $v0, %hi(ice_shard_render)
/* 3F843C E011004C 244203A4 */  addiu     $v0, $v0, %lo(ice_shard_render)
/* 3F8440 E0110050 AFA20020 */  sw        $v0, 0x20($sp)
/* 3F8444 E0110054 2402007A */  addiu     $v0, $zero, 0x7a
/* 3F8448 E0110058 AFBF0038 */  sw        $ra, 0x38($sp)
/* 3F844C E011005C AFB20030 */  sw        $s2, 0x30($sp)
/* 3F8450 E0110060 AFB1002C */  sw        $s1, 0x2c($sp)
/* 3F8454 E0110064 AFA00010 */  sw        $zero, 0x10($sp)
/* 3F8458 E0110068 AFA00024 */  sw        $zero, 0x24($sp)
/* 3F845C E011006C 0C080124 */  jal       shim_create_effect_instance
/* 3F8460 E0110070 AFA20014 */   sw       $v0, 0x14($sp)
/* 3F8464 E0110074 2404005C */  addiu     $a0, $zero, 0x5c
/* 3F8468 E0110078 24030001 */  addiu     $v1, $zero, 1
/* 3F846C E011007C 0040902D */  daddu     $s2, $v0, $zero
/* 3F8470 E0110080 0C08012C */  jal       shim_general_heap_malloc
/* 3F8474 E0110084 AE430008 */   sw       $v1, 8($s2)
/* 3F8478 E0110088 0040882D */  daddu     $s1, $v0, $zero
/* 3F847C E011008C 16200003 */  bnez      $s1, .LE011009C
/* 3F8480 E0110090 AE42000C */   sw       $v0, 0xc($s2)
.LE0110094:
/* 3F8484 E0110094 08044025 */  j         .LE0110094
/* 3F8488 E0110098 00000000 */   nop
.LE011009C:
/* 3F848C E011009C AE330000 */  sw        $s3, ($s1)
/* 3F8490 E01100A0 1E000004 */  bgtz      $s0, .LE01100B4
/* 3F8494 E01100A4 AE200014 */   sw       $zero, 0x14($s1)
/* 3F8498 E01100A8 240203E8 */  addiu     $v0, $zero, 0x3e8
/* 3F849C E01100AC 0804402E */  j         .LE01100B8
/* 3F84A0 E01100B0 AE220010 */   sw       $v0, 0x10($s1)
.LE01100B4:
/* 3F84A4 E01100B4 AE300010 */  sw        $s0, 0x10($s1)
.LE01100B8:
/* 3F84A8 E01100B8 240200FF */  addiu     $v0, $zero, 0xff
/* 3F84AC E01100BC AE220024 */  sw        $v0, 0x24($s1)
/* 3F84B0 E01100C0 E6340004 */  swc1      $f20, 4($s1)
/* 3F84B4 E01100C4 E6360008 */  swc1      $f22, 8($s1)
/* 3F84B8 E01100C8 E638000C */  swc1      $f24, 0xc($s1)
/* 3F84BC E01100CC C7A00068 */  lwc1      $f0, 0x68($sp)
/* 3F84C0 E01100D0 24040001 */  addiu     $a0, $zero, 1
/* 3F84C4 E01100D4 AE220018 */  sw        $v0, 0x18($s1)
/* 3F84C8 E01100D8 AE22001C */  sw        $v0, 0x1c($s1)
/* 3F84CC E01100DC AE220020 */  sw        $v0, 0x20($s1)
/* 3F84D0 E01100E0 AE220028 */  sw        $v0, 0x28($s1)
/* 3F84D4 E01100E4 AE22002C */  sw        $v0, 0x2c($s1)
/* 3F84D8 E01100E8 AE220030 */  sw        $v0, 0x30($s1)
/* 3F84DC E01100EC AE220034 */  sw        $v0, 0x34($s1)
/* 3F84E0 E01100F0 AE200044 */  sw        $zero, 0x44($s1)
/* 3F84E4 E01100F4 0C080138 */  jal       shim_rand_int
/* 3F84E8 E01100F8 E6200038 */   swc1     $f0, 0x38($s1)
/* 3F84EC E01100FC 24040004 */  addiu     $a0, $zero, 4
/* 3F84F0 E0110100 0C080138 */  jal       shim_rand_int
/* 3F84F4 E0110104 0040802D */   daddu    $s0, $v0, $zero
/* 3F84F8 E0110108 3C01E011 */  lui       $at, %hi(D_E01108C0)
/* 3F84FC E011010C D42608C0 */  ldc1      $f6, %lo(D_E01108C0)($at)
/* 3F8500 E0110110 44821000 */  mtc1      $v0, $f2
/* 3F8504 E0110114 00000000 */  nop
/* 3F8508 E0110118 468010A1 */  cvt.d.w   $f2, $f2
/* 3F850C E011011C 46261082 */  mul.d     $f2, $f2, $f6
/* 3F8510 E0110120 00000000 */  nop
/* 3F8514 E0110124 00108040 */  sll       $s0, $s0, 1
/* 3F8518 E0110128 2610FFFF */  addiu     $s0, $s0, -1
/* 3F851C E011012C 3C013FD0 */  lui       $at, 0x3fd0
/* 3F8520 E0110130 44812800 */  mtc1      $at, $f5
/* 3F8524 E0110134 44802000 */  mtc1      $zero, $f4
/* 3F8528 E0110138 44900000 */  mtc1      $s0, $f0
/* 3F852C E011013C 00000000 */  nop
/* 3F8530 E0110140 46800021 */  cvt.d.w   $f0, $f0
/* 3F8534 E0110144 46240002 */  mul.d     $f0, $f0, $f4
/* 3F8538 E0110148 00000000 */  nop
/* 3F853C E011014C 46261080 */  add.d     $f2, $f2, $f6
/* 3F8540 E0110150 46220002 */  mul.d     $f0, $f0, $f2
/* 3F8544 E0110154 00000000 */  nop
/* 3F8548 E0110158 24040167 */  addiu     $a0, $zero, 0x167
/* 3F854C E011015C 46200020 */  cvt.s.d   $f0, $f0
/* 3F8550 E0110160 0C080138 */  jal       shim_rand_int
/* 3F8554 E0110164 E6200048 */   swc1     $f0, 0x48($s1)
/* 3F8558 E0110168 2404000A */  addiu     $a0, $zero, 0xa
/* 3F855C E011016C 44820000 */  mtc1      $v0, $f0
/* 3F8560 E0110170 00000000 */  nop
/* 3F8564 E0110174 46800020 */  cvt.s.w   $f0, $f0
/* 3F8568 E0110178 0C080138 */  jal       shim_rand_int
/* 3F856C E011017C E620003C */   swc1     $f0, 0x3c($s1)
/* 3F8570 E0110180 2404000A */  addiu     $a0, $zero, 0xa
/* 3F8574 E0110184 2442FFFB */  addiu     $v0, $v0, -5
/* 3F8578 E0110188 44820000 */  mtc1      $v0, $f0
/* 3F857C E011018C 00000000 */  nop
/* 3F8580 E0110190 46800020 */  cvt.s.w   $f0, $f0
/* 3F8584 E0110194 0C080138 */  jal       shim_rand_int
/* 3F8588 E0110198 E620004C */   swc1     $f0, 0x4c($s1)
/* 3F858C E011019C 2404000A */  addiu     $a0, $zero, 0xa
/* 3F8590 E01101A0 2442FFFB */  addiu     $v0, $v0, -5
/* 3F8594 E01101A4 44820000 */  mtc1      $v0, $f0
/* 3F8598 E01101A8 00000000 */  nop
/* 3F859C E01101AC 46800020 */  cvt.s.w   $f0, $f0
/* 3F85A0 E01101B0 0C080138 */  jal       shim_rand_int
/* 3F85A4 E01101B4 E6200050 */   swc1     $f0, 0x50($s1)
/* 3F85A8 E01101B8 24040028 */  addiu     $a0, $zero, 0x28
/* 3F85AC E01101BC 2442FFFB */  addiu     $v0, $v0, -5
/* 3F85B0 E01101C0 44820000 */  mtc1      $v0, $f0
/* 3F85B4 E01101C4 00000000 */  nop
/* 3F85B8 E01101C8 46800020 */  cvt.s.w   $f0, $f0
/* 3F85BC E01101CC 0C080138 */  jal       shim_rand_int
/* 3F85C0 E01101D0 E6200054 */   swc1     $f0, 0x54($s1)
/* 3F85C4 E01101D4 2443FFEC */  addiu     $v1, $v0, -0x14
/* 3F85C8 E01101D8 0240102D */  daddu     $v0, $s2, $zero
/* 3F85CC E01101DC 3C01BDCC */  lui       $at, 0xbdcc
/* 3F85D0 E01101E0 3421CCCD */  ori       $at, $at, 0xcccd
/* 3F85D4 E01101E4 44811000 */  mtc1      $at, $f2
/* 3F85D8 E01101E8 44830000 */  mtc1      $v1, $f0
/* 3F85DC E01101EC 00000000 */  nop
/* 3F85E0 E01101F0 46800020 */  cvt.s.w   $f0, $f0
/* 3F85E4 E01101F4 E6200040 */  swc1      $f0, 0x40($s1)
/* 3F85E8 E01101F8 E6220058 */  swc1      $f2, 0x58($s1)
/* 3F85EC E01101FC 8FBF0038 */  lw        $ra, 0x38($sp)
/* 3F85F0 E0110200 8FB30034 */  lw        $s3, 0x34($sp)
/* 3F85F4 E0110204 8FB20030 */  lw        $s2, 0x30($sp)
/* 3F85F8 E0110208 8FB1002C */  lw        $s1, 0x2c($sp)
/* 3F85FC E011020C 8FB00028 */  lw        $s0, 0x28($sp)
/* 3F8600 E0110210 D7B80050 */  ldc1      $f24, 0x50($sp)
/* 3F8604 E0110214 D7B60048 */  ldc1      $f22, 0x48($sp)
/* 3F8608 E0110218 D7B40040 */  ldc1      $f20, 0x40($sp)
/* 3F860C E011021C 03E00008 */  jr        $ra
/* 3F8610 E0110220 27BD0058 */   addiu    $sp, $sp, 0x58
