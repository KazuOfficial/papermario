.include "macro.inc"

.section .data

glabel D_802410C0_86D800
.word 0x00000000, 0x0000004D, 0x00000001, 0x00000000, 0x00000043, 0x00000002, func_802D5830, 0x00000002, 0x00000008, 0x00000001, 0x00000028, 0x00000043, 0x00000004, ShowGotItem, 0xFE363C80, 0x00000000, 0x00000000, 0x00000043, 0x00000002, func_802D5830, 0x00000000, 0x00000002, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x00000024, 0x00000002, 0xFE363C80, 0xFE363C8A, 0x0000000B, 0x00000002, 0xFE363C8A, 0x00000000, 0x00000046, 0x00000001, 0x802410C4, 0x00000013, 0x00000000, 0x00000014, 0x00000001, 0xFE363C8B, 0x00000016, 0x00000001, 0x00000000, 0x00000043, 0x00000003, AddItem, 0xFE363C8A, 0xFE363C80, 0x00000016, 0x00000001, 0x00000001, 0x00000043, 0x00000002, AddKeyItem, 0xFE363C8A, 0x00000016, 0x00000001, 0x00000002, 0x00000043, 0x00000003, AddBadge, 0xFE363C8A, 0xFE363C80, 0x00000023, 0x00000000, 0x00000008, 0x00000001, 0x0000000F, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8A, 0x0000012F, 0x00000024, 0x00000002, 0xFE363C8B, 0x00000002, 0x00000024, 0x00000002, 0xF8405D0F, 0x00000001, 0x00000046, 0x00000001, 0x8024112C, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000043, 0x00000008, MakeEntity, 0x802EAE30, 0x00000118, 0xFFFFFFF6, 0x00000000, 0x00000000, 0x00000000, D_80000000, 0x00000043, 0x00000002, AssignFlag, 0xF8405D0F, 0x00000043, 0x00000002, AssignScript, 0x8024120C, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000024, 0x00000002, 0xFE363C81, 0xF4ACD485, 0x00000027, 0x00000002, 0xFE363C81, 0x00000001, 0x00000024, 0x00000002, 0xFE363C82, 0xF4ACD480, 0x00000024, 0x00000002, 0xFE363C83, 0xF4ACD481, 0x00000024, 0x00000002, 0xFE363C84, 0xF4ACD485, 0x00000027, 0x00000002, 0xFE363C84, 0x00000002, 0x00000024, 0x00000002, 0xFE363C85, 0xF4ACD480, 0x00000024, 0x00000002, 0xFE363C86, 0xF4ACD481, 0x00000024, 0x00000002, 0xFE363C87, 0xF4ACD485, 0x00000027, 0x00000002, 0xFE363C87, 0x00000003, 0x00000024, 0x00000002, 0xFE363C88, 0xF4ACD480, 0x00000024, 0x00000002, 0xFE363C89, 0xF4ACD481, 0x00000024, 0x00000002, 0xFE363C8A, 0xF4ACD485, 0x00000027, 0x00000002, 0xFE363C8A, 0x00000004, 0x00000024, 0x00000002, 0xFE363C8B, 0xF4ACD480, 0x00000024, 0x00000002, 0xFE363C8C, 0xF4ACD481, 0x00000043, 0x00000003, EnableModel, 0xFE363C81, 0x00000001, 0x00000043, 0x00000003, EnableModel, 0xFE363C84, 0x00000001, 0x00000043, 0x00000003, EnableModel, 0xFE363C87, 0x00000001, 0x00000043, 0x00000003, EnableModel, 0xFE363C8A, 0x00000001, 0x00000005, 0x00000001, 0x00000005, 0x00000027, 0x00000002, 0xFE363C80, 0x00000001, 0x00000027, 0x00000002, 0xFE363C82, 0x00000001, 0x00000027, 0x00000002, 0xFE363C83, 0x00000001, 0x00000043, 0x00000005, TranslateModel, 0xFE363C81, 0xFE363C82, 0xFE363C80, 0xFE363C83, 0x00000043, 0x00000005, ScaleModel, 0xFE363C81, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000027, 0x00000002, 0xFE363C85, 0xFFFFFFFF, 0x00000027, 0x00000002, 0xFE363C86, 0x00000001, 0x00000043, 0x00000005, TranslateModel, 0xFE363C84, 0xFE363C85, 0xFE363C80, 0xFE363C86, 0x00000043, 0x00000005, ScaleModel, 0xFE363C84, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000027, 0x00000002, 0xFE363C88, 0x00000001, 0x00000027, 0x00000002, 0xFE363C89, 0xFFFFFFFF, 0x00000043, 0x00000005, TranslateModel, 0xFE363C87, 0xFE363C88, 0xFE363C80, 0xFE363C89, 0x00000043, 0x00000005, ScaleModel, 0xFE363C87, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000027, 0x00000002, 0xFE363C8B, 0xFFFFFFFF, 0x00000027, 0x00000002, 0xFE363C8C, 0xFFFFFFFF, 0x00000043, 0x00000005, TranslateModel, 0xFE363C8A, 0xFE363C8B, 0xFE363C80, 0xFE363C8C, 0x00000043, 0x00000005, ScaleModel, 0xFE363C8A, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000008, 0x00000001, 0x00000001, 0x00000006, 0x00000000, 0x00000005, 0x00000001, 0x00000005, 0x00000027, 0x00000002, 0xFE363C80, 0xFFFFFFFF, 0x00000027, 0x00000002, 0xFE363C82, 0x00000001, 0x00000027, 0x00000002, 0xFE363C83, 0x00000001, 0x00000043, 0x00000005, TranslateModel, 0xFE363C81, 0xFE363C82, 0xFE363C80, 0xFE363C83, 0x00000043, 0x00000005, ScaleModel, 0xFE363C81, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000027, 0x00000002, 0xFE363C85, 0xFFFFFFFF, 0x00000027, 0x00000002, 0xFE363C86, 0x00000001, 0x00000043, 0x00000005, TranslateModel, 0xFE363C84, 0xFE363C85, 0xFE363C80, 0xFE363C86, 0x00000043, 0x00000005, ScaleModel, 0xFE363C84, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000027, 0x00000002, 0xFE363C88, 0x00000001, 0x00000027, 0x00000002, 0xFE363C89, 0xFFFFFFFF, 0x00000043, 0x00000005, TranslateModel, 0xFE363C87, 0xFE363C88, 0xFE363C80, 0xFE363C89, 0x00000043, 0x00000005, ScaleModel, 0xFE363C87, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000027, 0x00000002, 0xFE363C8B, 0xFFFFFFFF, 0x00000027, 0x00000002, 0xFE363C8C, 0xFFFFFFFF, 0x00000043, 0x00000005, TranslateModel, 0xFE363C8A, 0xFE363C8B, 0xFE363C80, 0xFE363C8C, 0x00000043, 0x00000005, ScaleModel, 0xFE363C8A, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000008, 0x00000001, 0x00000001, 0x00000006, 0x00000000, 0x00000043, 0x00000003, EnableModel, 0xFE363C81, 0x00000000, 0x00000043, 0x00000003, EnableModel, 0xFE363C84, 0x00000000, 0x00000043, 0x00000003, EnableModel, 0xFE363C87, 0x00000000, 0x00000043, 0x00000003, EnableModel, 0xFE363C8A, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x0000004D, 0x00000001, 0x00000000, 0x0000003C, 0x00000001, 0xFE363C8A, 0x00000024, 0x00000002, 0xFE363C85, 0xF4ACD485, 0x00000005, 0x00000001, 0x00000005, 0x00000043, 0x00000003, CloneModel, 0x00000011, 0xFE363C85, 0x00000043, 0x00000005, TranslateModel, 0xFE363C85, 0xF4ACD480, 0xF4ACD482, 0xF4ACD481, 0x00000027, 0x00000002, 0xFE363C85, 0x00000001, 0x00000006, 0x00000000, 0x00000003, 0x00000001, 0x00000000, 0x00000043, 0x00000003, RandInt, 0x000000C8, 0xFE363C80, 0x00000027, 0x00000002, 0xFE363C80, 0x00000032, 0x00000008, 0x00000001, 0xFE363C80, 0x00000043, 0x00000003, EnableModel, 0xF4ACD485, 0x00000001, 0x00000043, 0x00000005, MakeLerp, 0xF4ACD482, 0xF4ACD483, 0xF4ACD484, 0x00000001, 0x00000003, 0x00000001, 0x00000001, 0x00000043, 0x00000001, UpdateLerp, 0x00000043, 0x00000005, TranslateModel, 0xF4ACD485, 0xF4ACD480, 0xFE363C80, 0xF4ACD481, 0x00000008, 0x00000001, 0x00000001, 0x00000043, 0x00000002, func_802405D0_86CD10, 0xF4ACD485, 0x0000000A, 0x00000002, 0xFE363C82, 0x00000001, 0x00000004, 0x00000001, 0x0000000A, 0x00000013, 0x00000000, 0x0000000A, 0x00000002, 0xFE363C81, 0x00000001, 0x00000004, 0x00000001, 0x00000001, 0x00000013, 0x00000000, 0x00000003, 0x00000001, 0x0000000A, 0x00000043, 0x00000003, EnableModel, 0xF4ACD485, 0x00000000, 0x00000043, 0x00000002, PlaySound, 0x000003F6, 0x00000046, 0x00000001, 0x802412B0, 0x00000004, 0x00000001, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8F, 0x00002710, 0x00000030, 0x00000001, 0xFE363C80, 0x00000031, 0x00000001, 0xFE363C81, 0x00000005, 0x00000001, 0xFE363C81, 0x00000034, 0x00000004, 0xFE363C82, 0xFE363C83, 0xFE363C84, 0xFE363C85, 0x00000033, 0x00000003, 0xFE363C86, 0xFE363C87, 0xFE363C88, 0x00000031, 0x00000001, 0xFE363C89, 0x00000005, 0x00000001, 0xFE363C89, 0x0000003E, 0x00000002, 0x00000006, 0xFE363C8A, 0x0000003C, 0x00000001, 0xFE363C8A, 0x00000043, 0x00000003, RandInt, 0xFE363C84, 0xFE363C8B, 0x00000043, 0x00000003, RandInt, 0xFE363C85, 0xFE363C8C, 0x00000024, 0x00000002, 0xFE363C8D, 0xFE363C82, 0x00000024, 0x00000002, 0xFE363C8E, 0xFE363C83, 0x00000027, 0x00000002, 0xFE363C8D, 0xFE363C8B, 0x00000027, 0x00000002, 0xFE363C8E, 0xFE363C8C, 0x00000024, 0x00000002, 0xF4ACD480, 0xFE363C8D, 0x00000024, 0x00000002, 0xF4ACD481, 0xFE363C8E, 0x00000024, 0x00000002, 0xF4ACD482, 0xFE363C86, 0x00000024, 0x00000002, 0xF4ACD483, 0xFE363C87, 0x00000024, 0x00000002, 0xF4ACD484, 0xFE363C88, 0x00000024, 0x00000002, 0xF4ACD485, 0xFE363C8F, 0x00000044, 0x00000001, 0x80241780, 0x00000027, 0x00000002, 0xFE363C8F, 0x00000005, 0x00000006, 0x00000000, 0x00000006, 0x00000000, 0x00000043, 0x00000003, EnableModel, 0x00000011, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000002, 0xFFFFFE8A, 0xFFFFFF9E, 0x00000066, 0x0000009E, 0x000000C8, 0xFFFFFFF6, 0x0000003C, 0x00000002, 0x00000042, 0xFFFFFF96, 0x000000B6, 0x00000098, 0x000000C8, 0xFFFFFFF6, 0x0000003C, 0x00000002, 0x00000024, 0x00000002, 0xFE363C80, 0x80241B04, 0x00000044, 0x00000001, 0x80241958, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
