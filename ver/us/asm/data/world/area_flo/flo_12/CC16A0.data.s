.include "macro.inc"

.section .data

glabel D_80240870_CC16A0
.word 0x0000004D, 0x00000001, 0x0000000B, 0x00000024, 0x00000002, 0xFE363C8A, 0xFE363C80, 0x00000024, 0x00000002, 0xFE363C8B, 0xFE363C81, 0x00000024, 0x00000002, 0xFE363C8C, 0xFE363C82, 0x00000024, 0x00000002, 0xFE363C8D, 0xFE363C83, 0x00000024, 0x00000002, 0xFE363C8E, 0xFE363C84, 0x00000028, 0x00000002, 0xFE363C8C, 0xFE363C80, 0x00000028, 0x00000002, 0xFE363C8D, 0xFE363C81, 0x00000026, 0x00000002, 0xFE363C80, 0xFE363C8C, 0x0000002F, 0x00000002, 0xFE363C80, 0xF24C0A80, 0x00000026, 0x00000002, 0xFE363C8F, 0xF24C0A80, 0x0000002F, 0x00000002, 0xFE363C8F, 0xFE363C80, 0x00000027, 0x00000002, 0xFE363C8F, 0x0000000B, 0x00000024, 0x00000002, 0xFE363C85, 0x000000C8, 0x0000002A, 0x00000002, 0xFE363C85, 0xFE363C8F, 0x00000027, 0x00000002, 0xFE363C85, 0x00000001, 0x00000005, 0x00000001, 0xFE363C85, 0x00000043, 0x00000003, RandInt, 0xFE363C8C, 0xFE363C80, 0x00000043, 0x00000003, RandInt, 0xFE363C8D, 0xFE363C81, 0x00000043, 0x00000003, RandInt, 0x000000C7, 0xFE363C82, 0x00000024, 0x00000002, 0xFE363C83, 0x000000D2, 0x00000028, 0x00000002, 0xFE363C83, 0xFE363C82, 0x00000027, 0x00000002, 0xFE363C80, 0xFE363C8A, 0x00000027, 0x00000002, 0xFE363C81, 0xFE363C8B, 0x00000027, 0x00000002, 0xFE363C82, 0xFE363C8E, 0x00000043, 0x0000000F, PlayEffect, 0x0000000D, 0xFE363C80, 0xFE363C82, 0xFE363C81, 0xFE363C83, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000006, 0x00000000, 0x00000008, 0x00000001, 0xFE363C8F, 0x00000003, 0x00000001, 0x00000000, 0x00000043, 0x00000003, RandInt, 0xFE363C8C, 0xFE363C80, 0x00000043, 0x00000003, RandInt, 0xFE363C8D, 0xFE363C81, 0x00000027, 0x00000002, 0xFE363C80, 0xFE363C8A, 0x00000027, 0x00000002, 0xFE363C81, 0xFE363C8B, 0x00000043, 0x0000000F, PlayEffect, 0x0000000D, 0xFE363C80, 0xFE363C8E, 0xFE363C81, 0x000000C8, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000001, 0xFE363C8F, 0x00000004, 0x00000001, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x0000004D, 0x00000001, 0x0000001B, 0x00000043, 0x00000003, UseExitHeading, 0x0000003C, 0x00000000, 0x00000044, 0x00000001, ExitWalk, 0x00000043, 0x00000003, GotoMap, 0x802429D0, 0x00000001, 0x00000008, 0x00000001, 0x00000064, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000047, 0x00000005, 0x80240B1C, 0x00080000, 0x00000000, 0x00000001, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000024, 0x00000002, 0xF5DE0329, 0x00000026, 0x00000043, 0x00000002, SetSpriteShading, 0xFFFFFFFF, 0x00000043, 0x00000003, SetCamLeadPlayer, 0x00000000, 0x00000000, 0x00000043, 0x00000006, SetCamPerspective, 0x00000000, 0x00000003, 0x00000019, 0x00000010, 0x00001000, 0x00000043, 0x00000005, SetCamBGColor, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000043, 0x00000003, SetCamEnabled, 0x00000000, 0x00000001, 0x00000024, 0x00000002, 0xF9718896, 0x00000000, 0x00000043, 0x00000003, MakeNpcs, 0x00000000, 0x802429B8, 0x00000043, 0x00000004, ModifyColliderFlags, 0x00000003, 0x0000000B, 0x00000006, 0x00000024, 0x00000002, 0xFE363C80, 0xFFFFFFBF, 0x00000024, 0x00000002, 0xFE363C81, 0xFFFFFF2E, 0x00000024, 0x00000002, 0xFE363C82, 0x0000005A, 0x00000024, 0x00000002, 0xFE363C83, 0xFFFFFF92, 0x00000024, 0x00000002, 0xFE363C84, 0x00000000, 0x00000044, 0x00000001, D_80240870_CC16A0, 0x00000024, 0x00000002, 0xFE363C80, 0xFFFFFF38, 0x00000024, 0x00000002, 0xFE363C81, 0x00000082, 0x00000024, 0x00000002, 0xFE363C82, 0xFFFFFFB0, 0x00000024, 0x00000002, 0xFE363C83, 0x000000AA, 0x00000024, 0x00000002, 0xFE363C84, 0x00000000, 0x00000044, 0x00000001, D_80240870_CC16A0, 0x00000024, 0x00000002, 0xFE363C80, 0xFFFFFEF2, 0x00000024, 0x00000002, 0xFE363C81, 0xFFFFFFB0, 0x00000024, 0x00000002, 0xFE363C82, 0xFFFFFF1F, 0x00000024, 0x00000002, 0xFE363C83, 0x0000007D, 0x00000024, 0x00000002, 0xFE363C84, 0x00000000, 0x00000044, 0x00000001, D_80240870_CC16A0, 0x00000043, 0x00000002, GetEntryID, 0xFE363C80, 0x0000000A, 0x00000002, 0xFE363C80, 0x00000001, 0x00000044, 0x00000001, 0x802419F4, 0x00000012, 0x00000000, 0x00000043, 0x00000004, ModifyColliderFlags, 0x00000000, 0x00000001, 0x7FFFFE00, 0x00000024, 0x00000002, 0xFE363C80, 0x80240B78, 0x00000044, 0x00000001, EnterWalk, 0x00000013, 0x00000000, 0x00000046, 0x00000001, 0x80240750, 0x0000000F, 0x00000002, 0xF5DE0180, 0x00000035, 0x00000043, 0x00000001, func_80240000_CC0E30, 0x00000013, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000
