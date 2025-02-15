.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_802452C4_A2F504
/* A2F504 802452C4 27BDFFD8 */  addiu     $sp, $sp, -0x28
/* A2F508 802452C8 AFB1001C */  sw        $s1, 0x1c($sp)
/* A2F50C 802452CC 0080882D */  daddu     $s1, $a0, $zero
/* A2F510 802452D0 AFBF0020 */  sw        $ra, 0x20($sp)
/* A2F514 802452D4 AFB00018 */  sw        $s0, 0x18($sp)
/* A2F518 802452D8 10A0003B */  beqz      $a1, .L802453C8
/* A2F51C 802452DC 8E30000C */   lw       $s0, 0xc($s1)
/* A2F520 802452E0 3C048025 */  lui       $a0, %hi(D_8024F580_hos_05)
/* A2F524 802452E4 2484F580 */  addiu     $a0, $a0, %lo(D_8024F580_hos_05)
/* A2F528 802452E8 3C058025 */  lui       $a1, %hi(D_8024F581)
/* A2F52C 802452EC 24A5F581 */  addiu     $a1, $a1, %lo(D_8024F581)
/* A2F530 802452F0 3C068025 */  lui       $a2, %hi(D_8024F582)
/* A2F534 802452F4 24C6F582 */  addiu     $a2, $a2, %lo(D_8024F582)
/* A2F538 802452F8 3C078025 */  lui       $a3, %hi(D_8024F583)
/* A2F53C 802452FC 24E7F583 */  addiu     $a3, $a3, %lo(D_8024F583)
/* A2F540 80245300 3C028025 */  lui       $v0, %hi(D_8024F584)
/* A2F544 80245304 2442F584 */  addiu     $v0, $v0, %lo(D_8024F584)
/* A2F548 80245308 AFA20010 */  sw        $v0, 0x10($sp)
/* A2F54C 8024530C 3C028025 */  lui       $v0, %hi(D_8024F585)
/* A2F550 80245310 2442F585 */  addiu     $v0, $v0, %lo(D_8024F585)
/* A2F554 80245314 0C046FF5 */  jal       get_model_env_color_parameters
/* A2F558 80245318 AFA20014 */   sw       $v0, 0x14($sp)
/* A2F55C 8024531C 8E050000 */  lw        $a1, ($s0)
/* A2F560 80245320 26100004 */  addiu     $s0, $s0, 4
/* A2F564 80245324 0C0B1EAF */  jal       evt_get_variable
/* A2F568 80245328 0220202D */   daddu    $a0, $s1, $zero
/* A2F56C 8024532C 3C018025 */  lui       $at, %hi(D_8024F588)
/* A2F570 80245330 AC22F588 */  sw        $v0, %lo(D_8024F588)($at)
/* A2F574 80245334 8E050000 */  lw        $a1, ($s0)
/* A2F578 80245338 26100004 */  addiu     $s0, $s0, 4
/* A2F57C 8024533C 0C0B1EAF */  jal       evt_get_variable
/* A2F580 80245340 0220202D */   daddu    $a0, $s1, $zero
/* A2F584 80245344 3C018025 */  lui       $at, %hi(D_8024F58C)
/* A2F588 80245348 AC22F58C */  sw        $v0, %lo(D_8024F58C)($at)
/* A2F58C 8024534C 8E050000 */  lw        $a1, ($s0)
/* A2F590 80245350 26100004 */  addiu     $s0, $s0, 4
/* A2F594 80245354 0C0B1EAF */  jal       evt_get_variable
/* A2F598 80245358 0220202D */   daddu    $a0, $s1, $zero
/* A2F59C 8024535C 3C018025 */  lui       $at, %hi(D_8024F590)
/* A2F5A0 80245360 AC22F590 */  sw        $v0, %lo(D_8024F590)($at)
/* A2F5A4 80245364 8E050000 */  lw        $a1, ($s0)
/* A2F5A8 80245368 26100004 */  addiu     $s0, $s0, 4
/* A2F5AC 8024536C 0C0B1EAF */  jal       evt_get_variable
/* A2F5B0 80245370 0220202D */   daddu    $a0, $s1, $zero
/* A2F5B4 80245374 3C018025 */  lui       $at, %hi(D_8024F594)
/* A2F5B8 80245378 AC22F594 */  sw        $v0, %lo(D_8024F594)($at)
/* A2F5BC 8024537C 8E050000 */  lw        $a1, ($s0)
/* A2F5C0 80245380 26100004 */  addiu     $s0, $s0, 4
/* A2F5C4 80245384 0C0B1EAF */  jal       evt_get_variable
/* A2F5C8 80245388 0220202D */   daddu    $a0, $s1, $zero
/* A2F5CC 8024538C 3C018025 */  lui       $at, %hi(D_8024F598)
/* A2F5D0 80245390 AC22F598 */  sw        $v0, %lo(D_8024F598)($at)
/* A2F5D4 80245394 8E050000 */  lw        $a1, ($s0)
/* A2F5D8 80245398 26100004 */  addiu     $s0, $s0, 4
/* A2F5DC 8024539C 0C0B1EAF */  jal       evt_get_variable
/* A2F5E0 802453A0 0220202D */   daddu    $a0, $s1, $zero
/* A2F5E4 802453A4 3C018025 */  lui       $at, %hi(D_8024F59C)
/* A2F5E8 802453A8 AC22F59C */  sw        $v0, %lo(D_8024F59C)($at)
/* A2F5EC 802453AC 8E050000 */  lw        $a1, ($s0)
/* A2F5F0 802453B0 0C0B1EAF */  jal       evt_get_variable
/* A2F5F4 802453B4 0220202D */   daddu    $a0, $s1, $zero
/* A2F5F8 802453B8 3C018025 */  lui       $at, %hi(mac_04_Quizmo_Worker)
/* A2F5FC 802453BC AC22F5A0 */  sw        $v0, %lo(mac_04_Quizmo_Worker)($at)
/* A2F600 802453C0 3C018025 */  lui       $at, %hi(D_8024F5A4)
/* A2F604 802453C4 AC20F5A4 */  sw        $zero, %lo(D_8024F5A4)($at)
.L802453C8:
/* A2F608 802453C8 3C118025 */  lui       $s1, %hi(mac_04_Quizmo_Worker)
/* A2F60C 802453CC 2631F5A0 */  addiu     $s1, $s1, %lo(mac_04_Quizmo_Worker)
/* A2F610 802453D0 8E2F0000 */  lw        $t7, ($s1)
/* A2F614 802453D4 19E00088 */  blez      $t7, .L802455F8
/* A2F618 802453D8 00000000 */   nop
/* A2F61C 802453DC 3C108025 */  lui       $s0, %hi(D_8024F5A4)
/* A2F620 802453E0 2610F5A4 */  addiu     $s0, $s0, %lo(D_8024F5A4)
/* A2F624 802453E4 8E030000 */  lw        $v1, ($s0)
/* A2F628 802453E8 3C048025 */  lui       $a0, %hi(D_8024F580_hos_05)
/* A2F62C 802453EC 9084F580 */  lbu       $a0, %lo(D_8024F580_hos_05)($a0)
/* A2F630 802453F0 3C028025 */  lui       $v0, %hi(D_8024F588)
/* A2F634 802453F4 8C42F588 */  lw        $v0, %lo(D_8024F588)($v0)
/* A2F638 802453F8 24630001 */  addiu     $v1, $v1, 1
/* A2F63C 802453FC 00441023 */  subu      $v0, $v0, $a0
/* A2F640 80245400 00430018 */  mult      $v0, $v1
/* A2F644 80245404 00004012 */  mflo      $t0
/* A2F648 80245408 00000000 */  nop
/* A2F64C 8024540C 15E00002 */  bnez      $t7, .L80245418
/* A2F650 80245410 010F001A */   div      $zero, $t0, $t7
/* A2F654 80245414 0007000D */  break     7
.L80245418:
/* A2F658 80245418 2401FFFF */   addiu    $at, $zero, -1
/* A2F65C 8024541C 15E10004 */  bne       $t7, $at, .L80245430
/* A2F660 80245420 3C018000 */   lui      $at, 0x8000
/* A2F664 80245424 15010002 */  bne       $t0, $at, .L80245430
/* A2F668 80245428 00000000 */   nop
/* A2F66C 8024542C 0006000D */  break     6
.L80245430:
/* A2F670 80245430 00007012 */   mflo     $t6
/* A2F674 80245434 3C058025 */  lui       $a1, %hi(D_8024F581)
/* A2F678 80245438 90A5F581 */  lbu       $a1, %lo(D_8024F581)($a1)
/* A2F67C 8024543C 3C028025 */  lui       $v0, %hi(D_8024F58C)
/* A2F680 80245440 8C42F58C */  lw        $v0, %lo(D_8024F58C)($v0)
/* A2F684 80245444 00451023 */  subu      $v0, $v0, $a1
/* A2F688 80245448 00430018 */  mult      $v0, $v1
/* A2F68C 8024544C 00004012 */  mflo      $t0
/* A2F690 80245450 00000000 */  nop
/* A2F694 80245454 15E00002 */  bnez      $t7, .L80245460
/* A2F698 80245458 010F001A */   div      $zero, $t0, $t7
/* A2F69C 8024545C 0007000D */  break     7
.L80245460:
/* A2F6A0 80245460 2401FFFF */   addiu    $at, $zero, -1
/* A2F6A4 80245464 15E10004 */  bne       $t7, $at, .L80245478
/* A2F6A8 80245468 3C018000 */   lui      $at, 0x8000
/* A2F6AC 8024546C 15010002 */  bne       $t0, $at, .L80245478
/* A2F6B0 80245470 00000000 */   nop
/* A2F6B4 80245474 0006000D */  break     6
.L80245478:
/* A2F6B8 80245478 00006812 */   mflo     $t5
/* A2F6BC 8024547C 3C068025 */  lui       $a2, %hi(D_8024F582)
/* A2F6C0 80245480 90C6F582 */  lbu       $a2, %lo(D_8024F582)($a2)
/* A2F6C4 80245484 3C028025 */  lui       $v0, %hi(D_8024F590)
/* A2F6C8 80245488 8C42F590 */  lw        $v0, %lo(D_8024F590)($v0)
/* A2F6CC 8024548C 00461023 */  subu      $v0, $v0, $a2
/* A2F6D0 80245490 00430018 */  mult      $v0, $v1
/* A2F6D4 80245494 00004012 */  mflo      $t0
/* A2F6D8 80245498 00000000 */  nop
/* A2F6DC 8024549C 15E00002 */  bnez      $t7, .L802454A8
/* A2F6E0 802454A0 010F001A */   div      $zero, $t0, $t7
/* A2F6E4 802454A4 0007000D */  break     7
.L802454A8:
/* A2F6E8 802454A8 2401FFFF */   addiu    $at, $zero, -1
/* A2F6EC 802454AC 15E10004 */  bne       $t7, $at, .L802454C0
/* A2F6F0 802454B0 3C018000 */   lui      $at, 0x8000
/* A2F6F4 802454B4 15010002 */  bne       $t0, $at, .L802454C0
/* A2F6F8 802454B8 00000000 */   nop
/* A2F6FC 802454BC 0006000D */  break     6
.L802454C0:
/* A2F700 802454C0 00006012 */   mflo     $t4
/* A2F704 802454C4 3C078025 */  lui       $a3, %hi(D_8024F583)
/* A2F708 802454C8 90E7F583 */  lbu       $a3, %lo(D_8024F583)($a3)
/* A2F70C 802454CC 3C028025 */  lui       $v0, %hi(D_8024F594)
/* A2F710 802454D0 8C42F594 */  lw        $v0, %lo(D_8024F594)($v0)
/* A2F714 802454D4 00471023 */  subu      $v0, $v0, $a3
/* A2F718 802454D8 00430018 */  mult      $v0, $v1
/* A2F71C 802454DC 00004012 */  mflo      $t0
/* A2F720 802454E0 00000000 */  nop
/* A2F724 802454E4 15E00002 */  bnez      $t7, .L802454F0
/* A2F728 802454E8 010F001A */   div      $zero, $t0, $t7
/* A2F72C 802454EC 0007000D */  break     7
.L802454F0:
/* A2F730 802454F0 2401FFFF */   addiu    $at, $zero, -1
/* A2F734 802454F4 15E10004 */  bne       $t7, $at, .L80245508
/* A2F738 802454F8 3C018000 */   lui      $at, 0x8000
/* A2F73C 802454FC 15010002 */  bne       $t0, $at, .L80245508
/* A2F740 80245500 00000000 */   nop
/* A2F744 80245504 0006000D */  break     6
.L80245508:
/* A2F748 80245508 00005812 */   mflo     $t3
/* A2F74C 8024550C 3C098025 */  lui       $t1, %hi(D_8024F584)
/* A2F750 80245510 9129F584 */  lbu       $t1, %lo(D_8024F584)($t1)
/* A2F754 80245514 3C028025 */  lui       $v0, %hi(D_8024F598)
/* A2F758 80245518 8C42F598 */  lw        $v0, %lo(D_8024F598)($v0)
/* A2F75C 8024551C 00491023 */  subu      $v0, $v0, $t1
/* A2F760 80245520 00430018 */  mult      $v0, $v1
/* A2F764 80245524 00004012 */  mflo      $t0
/* A2F768 80245528 00000000 */  nop
/* A2F76C 8024552C 15E00002 */  bnez      $t7, .L80245538
/* A2F770 80245530 010F001A */   div      $zero, $t0, $t7
/* A2F774 80245534 0007000D */  break     7
.L80245538:
/* A2F778 80245538 2401FFFF */   addiu    $at, $zero, -1
/* A2F77C 8024553C 15E10004 */  bne       $t7, $at, .L80245550
/* A2F780 80245540 3C018000 */   lui      $at, 0x8000
/* A2F784 80245544 15010002 */  bne       $t0, $at, .L80245550
/* A2F788 80245548 00000000 */   nop
/* A2F78C 8024554C 0006000D */  break     6
.L80245550:
/* A2F790 80245550 00005012 */   mflo     $t2
/* A2F794 80245554 3C088025 */  lui       $t0, %hi(D_8024F585)
/* A2F798 80245558 9108F585 */  lbu       $t0, %lo(D_8024F585)($t0)
/* A2F79C 8024555C 3C028025 */  lui       $v0, %hi(D_8024F59C)
/* A2F7A0 80245560 8C42F59C */  lw        $v0, %lo(D_8024F59C)($v0)
/* A2F7A4 80245564 00481023 */  subu      $v0, $v0, $t0
/* A2F7A8 80245568 00430018 */  mult      $v0, $v1
/* A2F7AC 8024556C 0000C812 */  mflo      $t9
/* A2F7B0 80245570 00000000 */  nop
/* A2F7B4 80245574 15E00002 */  bnez      $t7, .L80245580
/* A2F7B8 80245578 032F001A */   div      $zero, $t9, $t7
/* A2F7BC 8024557C 0007000D */  break     7
.L80245580:
/* A2F7C0 80245580 2401FFFF */   addiu    $at, $zero, -1
/* A2F7C4 80245584 15E10004 */  bne       $t7, $at, .L80245598
/* A2F7C8 80245588 3C018000 */   lui      $at, 0x8000
/* A2F7CC 8024558C 17210002 */  bne       $t9, $at, .L80245598
/* A2F7D0 80245590 00000000 */   nop
/* A2F7D4 80245594 0006000D */  break     6
.L80245598:
/* A2F7D8 80245598 00001012 */   mflo     $v0
/* A2F7DC 8024559C AE030000 */  sw        $v1, ($s0)
/* A2F7E0 802455A0 008E2021 */  addu      $a0, $a0, $t6
/* A2F7E4 802455A4 308400FF */  andi      $a0, $a0, 0xff
/* A2F7E8 802455A8 00AD2821 */  addu      $a1, $a1, $t5
/* A2F7EC 802455AC 30A500FF */  andi      $a1, $a1, 0xff
/* A2F7F0 802455B0 00CC3021 */  addu      $a2, $a2, $t4
/* A2F7F4 802455B4 30C600FF */  andi      $a2, $a2, 0xff
/* A2F7F8 802455B8 00EB3821 */  addu      $a3, $a3, $t3
/* A2F7FC 802455BC 30E700FF */  andi      $a3, $a3, 0xff
/* A2F800 802455C0 012A4821 */  addu      $t1, $t1, $t2
/* A2F804 802455C4 312900FF */  andi      $t1, $t1, 0xff
/* A2F808 802455C8 AFA90010 */  sw        $t1, 0x10($sp)
/* A2F80C 802455CC 01024021 */  addu      $t0, $t0, $v0
/* A2F810 802455D0 310800FF */  andi      $t0, $t0, 0xff
/* A2F814 802455D4 0C046FE6 */  jal       set_model_env_color_parameters
/* A2F818 802455D8 AFA80014 */   sw       $t0, 0x14($sp)
/* A2F81C 802455DC 8E020000 */  lw        $v0, ($s0)
/* A2F820 802455E0 8E230000 */  lw        $v1, ($s1)
/* A2F824 802455E4 0043102A */  slt       $v0, $v0, $v1
/* A2F828 802455E8 14400013 */  bnez      $v0, .L80245638
/* A2F82C 802455EC 0000102D */   daddu    $v0, $zero, $zero
/* A2F830 802455F0 0809158E */  j         .L80245638
/* A2F834 802455F4 24020002 */   addiu    $v0, $zero, 2
.L802455F8:
/* A2F838 802455F8 3C028025 */  lui       $v0, %hi(D_8024F59B)
/* A2F83C 802455FC 9042F59B */  lbu       $v0, %lo(D_8024F59B)($v0)
/* A2F840 80245600 3C048025 */  lui       $a0, %hi(D_8024F58B)
/* A2F844 80245604 9084F58B */  lbu       $a0, %lo(D_8024F58B)($a0)
/* A2F848 80245608 3C058025 */  lui       $a1, %hi(D_8024F58F)
/* A2F84C 8024560C 90A5F58F */  lbu       $a1, %lo(D_8024F58F)($a1)
/* A2F850 80245610 3C068025 */  lui       $a2, %hi(D_8024F593)
/* A2F854 80245614 90C6F593 */  lbu       $a2, %lo(D_8024F593)($a2)
/* A2F858 80245618 3C078025 */  lui       $a3, %hi(D_8024F597)
/* A2F85C 8024561C 90E7F597 */  lbu       $a3, %lo(D_8024F597)($a3)
/* A2F860 80245620 3C038025 */  lui       $v1, %hi(D_8024F59F)
/* A2F864 80245624 9063F59F */  lbu       $v1, %lo(D_8024F59F)($v1)
/* A2F868 80245628 AFA20010 */  sw        $v0, 0x10($sp)
/* A2F86C 8024562C 0C046FE6 */  jal       set_model_env_color_parameters
/* A2F870 80245630 AFA30014 */   sw       $v1, 0x14($sp)
/* A2F874 80245634 24020002 */  addiu     $v0, $zero, 2
.L80245638:
/* A2F878 80245638 8FBF0020 */  lw        $ra, 0x20($sp)
/* A2F87C 8024563C 8FB1001C */  lw        $s1, 0x1c($sp)
/* A2F880 80245640 8FB00018 */  lw        $s0, 0x18($sp)
/* A2F884 80245644 03E00008 */  jr        $ra
/* A2F888 80245648 27BD0028 */   addiu    $sp, $sp, 0x28
