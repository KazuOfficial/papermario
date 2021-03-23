.include "macro.inc"

.section .data

glabel D_80242010_CB7010
.word 0x0000004D, 0x00000001, 0x0000000B, 0x00000024, 0x00000002, 0xFE363C8A, 0xFE363C80, 0x00000024, 0x00000002, 0xFE363C8B, 0xFE363C81, 0x00000024, 0x00000002, 0xFE363C8C, 0xFE363C82, 0x00000024, 0x00000002, 0xFE363C8D, 0xFE363C83, 0x00000024, 0x00000002, 0xFE363C8E, 0xFE363C84, 0x00000028, 0x00000002, 0xFE363C8C, 0xFE363C80, 0x00000028, 0x00000002, 0xFE363C8D, 0xFE363C81, 0x00000026, 0x00000002, 0xFE363C80, 0xFE363C8C, 0x0000002F, 0x00000002, 0xFE363C80, 0xF24C0A80, 0x00000026, 0x00000002, 0xFE363C8F, 0xF24C0A80, 0x0000002F, 0x00000002, 0xFE363C8F, 0xFE363C80, 0x00000027, 0x00000002, 0xFE363C8F, 0x0000000B, 0x00000024, 0x00000002, 0xFE363C85, 0x000000C8, 0x0000002A, 0x00000002, 0xFE363C85, 0xFE363C8F, 0x00000027, 0x00000002, 0xFE363C85, 0x00000001, 0x00000005, 0x00000001, 0xFE363C85, 0x00000043, 0x00000003, RandInt, 0xFE363C8C, 0xFE363C80, 0x00000043, 0x00000003, RandInt, 0xFE363C8D, 0xFE363C81, 0x00000043, 0x00000003, RandInt, 0x000000C7, 0xFE363C82, 0x00000024, 0x00000002, 0xFE363C83, 0x000000D2, 0x00000028, 0x00000002, 0xFE363C83, 0xFE363C82, 0x00000027, 0x00000002, 0xFE363C80, 0xFE363C8A, 0x00000027, 0x00000002, 0xFE363C81, 0xFE363C8B, 0x00000027, 0x00000002, 0xFE363C82, 0xFE363C8E, 0x00000043, 0x0000000F, PlayEffect, 0x0000000D, 0xFE363C80, 0xFE363C82, 0xFE363C81, 0xFE363C83, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000006, 0x00000000, 0x00000008, 0x00000001, 0xFE363C8F, 0x00000003, 0x00000001, 0x00000000, 0x00000043, 0x00000003, RandInt, 0xFE363C8C, 0xFE363C80, 0x00000043, 0x00000003, RandInt, 0xFE363C8D, 0xFE363C81, 0x00000027, 0x00000002, 0xFE363C80, 0xFE363C8A, 0x00000027, 0x00000002, 0xFE363C81, 0xFE363C8B, 0x00000043, 0x0000000F, PlayEffect, 0x0000000D, 0xFE363C80, 0xFE363C8E, 0xFE363C81, 0x000000C8, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000001, 0xFE363C8F, 0x00000004, 0x00000001, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000024, 0x00000002, 0xFE363C89, 0xFE363C86, 0x00000024, 0x00000002, 0xFE363C88, 0xFE363C85, 0x00000024, 0x00000002, 0xFE363C87, 0xFE363C84, 0x00000024, 0x00000002, 0xFE363C86, 0xFE363C83, 0x00000024, 0x00000002, 0xFE363C85, 0xFE363C82, 0x00000024, 0x00000002, 0xFE363C84, 0xFE363C81, 0x00000024, 0x00000002, 0xFE363C83, 0xFE363C80, 0x00000043, 0x00000003, EnableModel, 0xFE363C86, 0x00000000, 0x00000003, 0x00000001, 0x00000000, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000043, 0x00000001, func_80240040_CB5040, 0x0000000A, 0x00000002, 0xFE363C80, 0x00000000, 0x00000008, 0x00000001, 0x00000001, 0x00000004, 0x00000001, 0x00000000, 0x00000013, 0x00000000, 0x00000056, 0x00000000, 0x00000008, 0x00000001, 0x00000005, 0x00000043, 0x00000003, EnableModel, 0xFE363C86, 0x00000001, 0x00000057, 0x00000000, 0x0000000B, 0x00000002, 0xFE363C8A, 0x00000000, 0x00000056, 0x00000000, 0x00000008, 0x00000001, 0x00000005, 0x00000024, 0x00000002, 0xFE363C80, 0xFE363C83, 0x00000024, 0x00000002, 0xFE363C81, 0xFE363C84, 0x00000024, 0x00000002, 0xFE363C82, 0xFE363C85, 0x00000027, 0x00000002, 0xFE363C81, 0x0000000A, 0x00000027, 0x00000002, 0xFE363C82, 0x00000008, 0x00000043, 0x0000000F, PlayEffect, 0x00000011, 0x00000004, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x0000000F, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000001, 0x0000000F, 0x00000028, 0x00000002, 0xFE363C81, 0x0000000A, 0x00000043, 0x00000007, MakeItemEntity, 0xFE363C8A, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x0000000E, 0x00000000, 0x00000057, 0x00000000, 0x00000013, 0x00000000, 0x00000056, 0x00000000, 0x00000008, 0x00000001, 0x0000000A, 0x00000043, 0x00000006, PlaySoundAt, 0x000000F8, 0x00000000, 0xFE363C83, 0xFE363C84, 0xFE363C85, 0x00000057, 0x00000000, 0x00000043, 0x00000005, MakeLerp, 0x00000000, 0x000000B4, 0x00000014, 0x00000002, 0x00000003, 0x00000001, 0x00000001, 0x00000043, 0x00000001, UpdateLerp, 0x00000043, 0x00000006, RotateModel, 0xFE363C88, 0xFE363C80, 0x00000001, 0x00000000, 0x00000000, 0x00000043, 0x00000006, RotateModel, 0xFE363C89, 0xFE363C80, 0x00000001, 0x00000000, 0x00000000, 0x0000000A, 0x00000002, 0xFE363C81, 0x00000001, 0x00000008, 0x00000001, 0x00000001, 0x00000004, 0x00000001, 0x00000001, 0x00000013, 0x00000000, 0x00000043, 0x00000003, EnableModel, 0xFE363C87, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000043, 0x00000002, GetModelCenter, 0x00000045, 0x00000024, 0x00000002, 0xFE363C83, 0x00000045, 0x00000024, 0x00000002, 0xFE363C84, 0x00000046, 0x00000024, 0x00000002, 0xFE363C85, 0x00000047, 0x00000024, 0x00000002, 0xFE363C86, 0x00000048, 0x00000024, 0x00000002, 0xFE363C8A, 0x00000000, 0x00000044, 0x00000001, 0x802422BC, 0x00000043, 0x00000002, GetModelCenter, 0x0000004B, 0x00000024, 0x00000002, 0xFE363C83, 0x0000004B, 0x00000024, 0x00000002, 0xFE363C84, 0x0000004C, 0x00000024, 0x00000002, 0xFE363C85, 0x0000004D, 0x00000024, 0x00000002, 0xFE363C86, 0x0000004E, 0x00000024, 0x00000002, 0xFE363C8A, 0x000000AE, 0x00000044, 0x00000001, 0x802422BC, 0x00000043, 0x00000002, GetModelCenter, 0x00000053, 0x00000024, 0x00000002, 0xFE363C83, 0x00000053, 0x00000024, 0x00000002, 0xFE363C84, 0x00000054, 0x00000024, 0x00000002, 0xFE363C85, 0x00000055, 0x00000024, 0x00000002, 0xFE363C86, 0x00000056, 0x00000024, 0x00000002, 0xFE363C8A, 0x00000000, 0x00000044, 0x00000001, 0x802422BC, 0x00000043, 0x00000002, GetModelCenter, 0x00000059, 0x00000024, 0x00000002, 0xFE363C83, 0x00000059, 0x00000024, 0x00000002, 0xFE363C84, 0x0000005A, 0x00000024, 0x00000002, 0xFE363C85, 0x0000005B, 0x00000024, 0x00000002, 0xFE363C86, 0x0000005C, 0x00000024, 0x00000002, 0xFE363C8A, 0x00000000, 0x00000044, 0x00000001, 0x802422BC, 0x00000043, 0x00000002, GetModelCenter, 0x00000061, 0x00000024, 0x00000002, 0xFE363C83, 0x00000061, 0x00000024, 0x00000002, 0xFE363C84, 0x00000062, 0x00000024, 0x00000002, 0xFE363C85, 0x00000063, 0x00000024, 0x00000002, 0xFE363C86, 0x00000064, 0x00000024, 0x00000002, 0xFE363C8A, 0x00000000, 0x00000044, 0x00000001, 0x802422BC, 0x00000043, 0x00000002, GetModelCenter, 0x00000067, 0x00000024, 0x00000002, 0xFE363C83, 0x00000067, 0x00000024, 0x00000002, 0xFE363C84, 0x00000068, 0x00000024, 0x00000002, 0xFE363C85, 0x00000069, 0x00000024, 0x00000002, 0xFE363C86, 0x0000006A, 0x00000024, 0x00000002, 0xFE363C8A, 0x00000000, 0x00000044, 0x00000001, 0x802422BC, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
