.include "macro.inc"

.section .data

glabel D_80241340_883500
.word 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x00000043, 0x00000002, DisablePlayerPhysics, 0x00000001, 0x00000043, 0x00000002, DisablePartnerAI, 0x00000000, 0x00000043, 0x00000002, HidePlayerShadow, 0x00000001, 0x00000043, 0x00000002, SetPlayerAnimation, 0x00010000, 0x00000043, 0x00000002, GetCurrentPartnerID, 0xFE363C80, 0x0000000B, 0x00000002, 0xFE363C80, 0x00000000, 0x00000043, 0x00000003, EnableNpcShadow, 0xFFFFFFFC, 0x00000000, 0x00000043, 0x00000005, SetNpcPos, 0xFFFFFFFC, 0x00000000, 0xFFFFFC18, 0x00000000, 0x00000013, 0x00000000, 0x00000043, 0x00000002, GetEntryID, 0xFE363C80, 0x00000043, 0x00000001, tik_09_GetEntryPos, 0x00000028, 0x00000002, 0xFE363C82, 0x00000028, 0x00000043, 0x00000004, SetPlayerPos, 0xFE363C81, 0xFE363C82, 0xFE363C83, 0x00000043, 0x00000003, InterpPlayerYaw, 0xFE363C84, 0x00000000, 0x00000043, 0x00000002, PlaySound, 0x00000163, 0x00000043, 0x00000002, func_802D286C, 0x00000100, 0x00000043, 0x00000007, func_802D2520, 0x00010000, 0x00000005, 0x00000002, 0x00000001, 0x00000001, 0x00000000, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000005, 0x00000001, 0x00000028, 0x00000027, 0x00000002, 0xFE363C81, 0x00000001, 0x00000043, 0x00000004, SetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000008, 0x00000001, 0x00000001, 0x00000006, 0x00000000, 0x00000008, 0x00000001, 0x00000003, 0x00000043, 0x00000002, GetCurrentPartnerID, 0xFE363C80, 0x0000000B, 0x00000002, 0xFE363C80, 0x00000000, 0x00000056, 0x00000000, 0x00000043, 0x00000002, DisablePartnerAI, 0x00000000, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000028, 0x00000002, 0xFE363C82, 0x00000003, 0x00000043, 0x00000005, SetNpcPos, 0xFFFFFFFC, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000043, 0x00000004, SetNpcFlagBits, 0xFFFFFFFC, 0x00000002, 0x00000000, 0x00000043, 0x00000001, EnablePartnerAI, 0x00000043, 0x00000003, EnableNpcShadow, 0xFFFFFFFC, 0x00000001, 0x00000057, 0x00000000, 0x00000013, 0x00000000, 0x00000008, 0x00000001, 0x00000002, 0x00000043, 0x00000007, func_802D2520, 0x00010000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000001, 0x00000001, 0x00000043, 0x00000002, SetPlayerAnimation, 0x00010002, 0x00000043, 0x00000002, DisablePlayerPhysics, 0x00000000, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000000, 0x00000043, 0x00000002, HidePlayerShadow, 0x00000000, 0x00000003, 0x00000001, 0x00000000, 0x00000043, 0x00000001, tik_09_GetCurrentFloor, 0x00000008, 0x00000001, 0x00000001, 0x0000000B, 0x00000002, 0xFE363C80, 0xFFFFFFFF, 0x00000004, 0x00000001, 0x00000000, 0x00000013, 0x00000000, 0x00000044, 0x00000001, 0xFE363C8A, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x00000043, 0x00000002, DisablePlayerPhysics, 0x00000001, 0x00000043, 0x00000002, HidePlayerShadow, 0x00000001, 0x00000043, 0x00000004, ModifyColliderFlags, 0x00000000, 0xFE363C8B, 0x7FFFFE00, 0x00000043, 0x00000002, GetEntryID, 0xFE363C80, 0x00000043, 0x00000001, tik_09_GetEntryPos, 0x00000024, 0x00000002, 0xFE363C85, 0xFE363C81, 0x00000024, 0x00000002, 0xFE363C86, 0xFE363C82, 0x00000024, 0x00000002, 0xFE363C87, 0xFE363C83, 0x00000027, 0x00000002, 0xFE363C82, 0x00000002, 0x00000043, 0x00000004, SetPlayerPos, 0xFE363C81, 0xFE363C82, 0xFE363C83, 0x00000043, 0x00000003, InterpPlayerYaw, 0xFE363C84, 0x00000000, 0x0000000A, 0x00000002, 0xFE363C84, 0x0000005A, 0x00000027, 0x00000002, 0xFE363C85, 0x00000028, 0x00000012, 0x00000000, 0x00000028, 0x00000002, 0xFE363C85, 0x00000028, 0x00000013, 0x00000000, 0x00000043, 0x00000005, UseSettingsFrom, 0x00000000, 0xFE363C85, 0xFE363C86, 0xFE363C87, 0x00000043, 0x00000005, SetPanTarget, 0x00000000, 0xFE363C85, 0xFE363C86, 0xFE363C87, 0x00000043, 0x00000003, SetCamSpeed, 0x00000000, 0xF24BE280, 0x00000043, 0x00000004, PanToTarget, 0x00000000, 0x00000000, 0x00000001, 0x00000043, 0x00000002, GetCurrentPartnerID, 0xFE363C80, 0x0000000B, 0x00000002, 0xFE363C80, 0x00000000, 0x00000043, 0x00000002, DisablePartnerAI, 0x00000000, 0x00000043, 0x00000003, EnableNpcShadow, 0xFFFFFFFC, 0x00000000, 0x00000043, 0x00000005, SetNpcPos, 0xFFFFFFFC, 0x00000000, 0xFFFFFC18, 0x00000000, 0x00000043, 0x00000004, InterpNpcYaw, 0xFFFFFFFC, 0xFE363C80, 0x00000000, 0x00000013, 0x00000000, 0x00000008, 0x00000001, 0x00000001, 0x00000043, 0x00000002, PlaySound, 0x00000163, 0x00000056, 0x00000000, 0x00000008, 0x00000001, 0x00000019, 0x00000043, 0x00000002, HidePlayerShadow, 0x00000000, 0x00000057, 0x00000000, 0x00000043, 0x00000002, func_802D286C, 0x00000900, 0x00000043, 0x00000007, func_802D2520, 0x00010002, 0x00000005, 0x00000003, 0x00000001, 0x00000001, 0x00000000, 0x00000005, 0x00000001, 0x00000028, 0x00000043, 0x00000002, tik_09_SomeXYZFunc2, 0xF24A7E80, 0x00000043, 0x00000004, SetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000008, 0x00000001, 0x00000001, 0x00000006, 0x00000000, 0x00000043, 0x00000002, GetCurrentPartnerID, 0xFE363C80, 0x0000000B, 0x00000002, 0xFE363C80, 0x00000000, 0x00000056, 0x00000000, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000028, 0x00000002, 0xFE363C82, 0x00000003, 0x00000043, 0x00000005, SetNpcPos, 0xFFFFFFFC, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000043, 0x00000003, EnableNpcShadow, 0xFFFFFFFC, 0x00000001, 0x00000043, 0x00000001, EnablePartnerAI, 0x00000057, 0x00000000, 0x00000013, 0x00000000, 0x00000008, 0x00000001, 0x00000005, 0x00000043, 0x00000007, func_802D2520, 0x00010002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000043, 0x00000004, ModifyColliderFlags, 0x00000001, 0xFE363C8B, 0x7FFFFE00, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000000, 0x00000043, 0x00000002, DisablePlayerPhysics, 0x00000000, 0x00000043, 0x00000004, PanToTarget, 0x00000000, 0x00000000, 0x00000000, 0x00000044, 0x00000001, 0xFE363C8A, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000043, 0x00000001, func_80240034_8821F4, 0x0000000A, 0x00000002, 0xFE363C80, 0x00000000, 0x00000002, 0x00000000, 0x00000013, 0x00000000, 0x00000043, 0x00000002, GetCurrentPartner, 0xFE363C80, 0x0000000B, 0x00000002, 0xFE363C80, 0x00000000, 0x00000043, 0x00000002, GetCurrentPartnerID, 0xFE363C81, 0x0000000B, 0x00000002, 0xFE363C81, 0x00000006, 0x00000002, 0x00000000, 0x00000012, 0x00000000, 0x00000043, 0x00000001, func_802D2B6C, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x00000013, 0x00000000, 0x00000012, 0x00000000, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x00000013, 0x00000000, 0x00000046, 0x00000001, 0x80241B60, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000043, 0x00000001, tik_09_SetPlayerStatusAnimFlags100000, 0x0000004D, 0x00000001, 0x0000001B, 0x00000043, 0x00000002, DisablePlayerPhysics, 0x00000001, 0x00000043, 0x00000002, HidePlayerShadow, 0x00000001, 0x00000024, 0x00000002, 0xFE363C80, 0xFE363C8A, 0x00000043, 0x00000001, tik_09_GetEntryPos, 0x00000043, 0x00000004, PlayerMoveTo, 0xFE363C81, 0xFE363C83, 0x00000003, 0x00000024, 0x00000002, 0xFE363C80, 0xFE363C8A, 0x00000043, 0x00000001, tik_09_GetEntryPos, 0x00000043, 0x00000004, SetPlayerPos, 0xFE363C81, 0xFE363C82, 0xFE363C83, 0x00000043, 0x00000003, SetPlayerFlagBits, 0x00200000, 0x00000001, 0x00000043, 0x00000001, tik_09_GetCurrentCameraYawClamped180, 0x00000043, 0x00000003, InterpPlayerYaw, 0xFE363C80, 0x00000000, 0x00000008, 0x00000001, 0x00000002, 0x00000043, 0x00000003, SetPlayerFlagBits, 0x00200000, 0x00000000, 0x00000043, 0x00000002, PlaySound, 0x00000163, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000056, 0x00000000, 0x00000008, 0x00000001, 0x00000004, 0x00000005, 0x00000001, 0x00000028, 0x00000028, 0x00000002, 0xFE363C81, 0x00000001, 0x00000043, 0x00000004, SetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000008, 0x00000001, 0x00000001, 0x00000006, 0x00000000, 0x00000057, 0x00000000, 0x00000043, 0x00000002, func_802D286C, 0x00000800, 0x00000043, 0x00000007, func_802D2520, 0x00010002, 0x00000005, 0x00000002, 0x00000001, 0x00000001, 0x00000000, 0x00000008, 0x00000001, 0x00000019, 0x00000046, 0x00000001, 0xFE363C8C, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000043, 0x00000002, IsPlayerOnValidFloor, 0xFE363C80, 0x0000000A, 0x00000002, 0xFE363C80, 0x00000000, 0x00000002, 0x00000000, 0x00000013, 0x00000000, 0x00000043, 0x00000002, GetPlayerActionState, 0xFE363C80, 0x0000000A, 0x00000002, 0xFE363C80, 0x0000001A, 0x00000002, 0x00000000, 0x00000013, 0x00000000, 0x00000043, 0x00000002, GetCurrentPartner, 0xFE363C80, 0x0000000B, 0x00000002, 0xFE363C80, 0x00000000, 0x00000043, 0x00000002, GetCurrentPartnerID, 0xFE363C81, 0x0000000B, 0x00000002, 0xFE363C81, 0x00000006, 0x00000002, 0x00000000, 0x00000012, 0x00000000, 0x00000043, 0x00000001, func_802D2B6C, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x00000013, 0x00000000, 0x00000012, 0x00000000, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x00000013, 0x00000000, 0x0000004D, 0x00000001, 0x0000001B, 0x00000043, 0x00000001, tik_09_SetPlayerStatusAnimFlags100000, 0x00000043, 0x00000002, DisablePlayerPhysics, 0x00000001, 0x00000043, 0x00000004, ModifyColliderFlags, 0x00000000, 0xFE363C8B, 0x7FFFFE00, 0x00000024, 0x00000002, 0xFE363C80, 0xFE363C8A, 0x00000043, 0x00000001, tik_09_GetEntryPos, 0x00000024, 0x00000002, 0xFE363C85, 0xFE363C81, 0x00000024, 0x00000002, 0xFE363C86, 0xFE363C82, 0x00000027, 0x00000002, 0xFE363C86, 0x00000002, 0x00000024, 0x00000002, 0xFE363C87, 0xFE363C83, 0x00000024, 0x00000002, 0xFE363C88, 0xFE363C84, 0x00000027, 0x00000002, 0xFE363C88, 0x000000B4, 0x0000000F, 0x00000002, 0xFE363C84, 0x00000168, 0x00000028, 0x00000002, 0xFE363C84, 0x00000168, 0x00000013, 0x00000000, 0x00000043, 0x00000003, InterpPlayerYaw, 0xFE363C88, 0x00000001, 0x00000008, 0x00000001, 0x00000001, 0x00000043, 0x00000002, PlaySound, 0x00000163, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000043, 0x00000004, SetPlayerPos, 0xFE363C80, 0xFE363C86, 0xFE363C87, 0x00000043, 0x00000002, SetPlayerAnimation, 0x00010000, 0x00000043, 0x00000002, func_802D286C, 0x00000800, 0x00000043, 0x00000007, func_802D2520, 0x00010000, 0x00000005, 0x00000003, 0x00000001, 0x00000001, 0x00000000, 0x00000056, 0x00000000, 0x00000008, 0x00000001, 0x00000008, 0x00000043, 0x00000002, HidePlayerShadow, 0x00000001, 0x00000057, 0x00000000, 0x00000056, 0x00000000, 0x00000008, 0x00000001, 0x00000003, 0x00000005, 0x00000001, 0x00000028, 0x00000043, 0x00000002, tik_09_SomeXYZFunc2, 0xF24A7E80, 0x00000043, 0x00000004, SetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000008, 0x00000001, 0x00000001, 0x00000006, 0x00000000, 0x00000057, 0x00000000, 0x00000008, 0x00000001, 0x00000019, 0x00000046, 0x00000001, 0xFE363C8C, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x0000004D, 0x00000001, 0x00000000, 0x0000000A, 0x00000002, 0xFE363C85, 0x00000001, 0x0000000A, 0x00000002, 0xFE363C86, 0x00000001, 0x0000000A, 0x00000002, 0xFE363C87, 0x00000001, 0x0000000A, 0x00000002, 0xFE363C88, 0x00000001, 0x00000043, 0x00000001, tik_09_UnkTexturePanFunc, 0x00000002, 0x00000000, 0x00000013, 0x00000000, 0x00000013, 0x00000000, 0x00000013, 0x00000000, 0x00000013, 0x00000000, 0x00000043, 0x00000001, tik_09_UnkTexturePanFunc2, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x0000004D, 0x00000001, 0x00000000, 0x00000043, 0x00000002, func_802D5830, 0x00000001, 0x00000043, 0x00000002, PlaySound, 0x0000000A, 0x00000043, 0x00000004, PlaySoundAtCollider, 0x0000000D, 0x0000026B, 0x00000000, 0x00000043, 0x00000005, MakeLerp, 0x0000003C, 0x00000000, 0x00000019, 0x0000000A, 0x00000005, 0x00000001, 0x00000000, 0x00000043, 0x00000001, UpdateLerp, 0x00000043, 0x00000005, TranslateModel, 0x0000001D, 0x00000000, 0xFE363C80, 0x00000000, 0x00000043, 0x00000005, TranslateModel, 0x00000021, 0x00000000, 0xFE363C80, 0x00000000, 0x00000008, 0x00000001, 0x00000001, 0x0000000A, 0x00000002, 0xFE363C81, 0x00000000, 0x00000007, 0x00000000, 0x00000013, 0x00000000, 0x00000006, 0x00000000, 0x00000043, 0x00000004, PlaySoundAtCollider, 0x0000000D, 0x0000026C, 0x00000000, 0x00000043, 0x00000005, ShakeCam, 0x00000000, 0x00000000, 0x00000005, 0xF24A7E80, 0x00000043, 0x00000004, ModifyColliderFlags, 0x00000001, 0x0000000C, 0x7FFFFE00, 0x00000043, 0x00000004, ModifyColliderFlags, 0x00000001, 0x0000000D, 0x7FFFFE00, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000000, 0x00000008, 0x00000001, 0x00000001, 0x00000043, 0x00000002, func_802D5830, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x0000004D, 0x00000001, 0x0000001B, 0x00000043, 0x00000003, UseExitHeading, 0x0000003C, 0x00000000, 0x00000044, 0x00000001, ExitWalk, 0x00000043, 0x00000003, GotoMap, 0x80244180, 0x00000000, 0x00000008, 0x00000001, 0x00000064, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x0000004D, 0x00000001, 0x0000001B, 0x00000043, 0x00000003, UseExitHeading, 0x0000003C, 0x00000001, 0x00000044, 0x00000001, ExitWalk, 0x00000043, 0x00000003, GotoMap, 0x80244188, 0x00000000, 0x00000008, 0x00000001, 0x00000064, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000047, 0x00000005, 0x802422A0, 0x00080000, 0x00000009, 0x00000001, 0x00000000, 0x00000047, 0x00000005, 0x802422FC, 0x00080000, 0x00000005, 0x00000001, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x00000043, 0x00000002, GetEntryID, 0xFE363C80, 0x0000000A, 0x00000002, 0xFE363C80, 0x00000002, 0x00000024, 0x00000002, 0xFE363C8A, 0x80242358, 0x00000044, 0x00000001, D_80241340_883500, 0x00000012, 0x00000000, 0x00000024, 0x00000002, 0xFE363C80, 0x80242358, 0x00000046, 0x00000001, EnterWalk, 0x0000000A, 0x00000002, 0xF8405D30, 0x00000000, 0x00000046, 0x00000001, 0x8024210C, 0x00000013, 0x00000000, 0x00000013, 0x00000000, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000005, 0x00000001, 0x00000000, 0x00000043, 0x00000005, MakeLerp, 0x00000000, 0xFFFFFFF6, 0x00000019, 0x00000004, 0x00000005, 0x00000001, 0x00000000, 0x00000043, 0x00000001, UpdateLerp, 0x00000043, 0x00000005, TranslateGroup, 0xFE363C82, 0x00000000, 0xFE363C80, 0x00000000, 0x00000008, 0x00000001, 0x00000001, 0x0000000A, 0x00000002, 0xFE363C81, 0x00000000, 0x00000007, 0x00000000, 0x00000013, 0x00000000, 0x00000006, 0x00000000, 0x00000043, 0x00000005, MakeLerp, 0xFFFFFFF6, 0x00000000, 0x0000001E, 0x00000004, 0x00000005, 0x00000001, 0x00000000, 0x00000043, 0x00000001, UpdateLerp, 0x00000043, 0x00000005, TranslateGroup, 0xFE363C82, 0x00000000, 0xFE363C80, 0x00000000, 0x00000008, 0x00000001, 0x00000001, 0x0000000A, 0x00000002, 0xFE363C81, 0x00000000, 0x00000007, 0x00000000, 0x00000013, 0x00000000, 0x00000006, 0x00000000, 0x00000006, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000024, 0x00000002, 0xF5DE0329, 0x00000002, 0x00000043, 0x00000002, SetSpriteShading, 0x00000008, 0x00000043, 0x00000006, SetCamPerspective, 0x00000000, 0x00000003, 0x00000019, 0x00000010, 0x00001000, 0x00000043, 0x00000005, SetCamBGColor, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000043, 0x00000003, SetCamEnabled, 0x00000000, 0x00000001, 0x00000043, 0x00000003, SetCamLeadPlayer, 0x00000000, 0x00000000, 0x00000043, 0x00000003, MakeNpcs, 0x00000001, 0x80244144, 0x00000046, 0x00000001, 0x802437D0, 0x00000044, 0x00000001, 0x80241310, 0x00000043, 0x00000002, PlaySound, 0x80000035, 0x00000043, 0x00000006, PlaySoundAtF, 0x80000036, 0x00000001, 0xFFFFFF42, 0xFFFFFFEC, 0xFFFFFF88, 0x00000043, 0x00000006, PlaySoundAtF, 0x80000037, 0x00000001, 0x00000032, 0xFFFFFFEC, 0xFFFFFF88, 0x00000043, 0x00000006, PlaySoundAtF, 0x80000038, 0x00000001, 0x00000122, 0xFFFFFFEC, 0xFFFFFF88, 0x00000044, 0x00000001, 0x802434E8, 0x00000043, 0x00000003, EnableTexPanning, 0x0000000C, 0x00000001, 0x00000043, 0x00000003, EnableTexPanning, 0x0000000F, 0x00000001, 0x00000043, 0x00000003, EnableTexPanning, 0x00000013, 0x00000001, 0x00000043, 0x00000003, EnableTexPanning, 0x00000015, 0x00000001, 0x00000056, 0x00000000, 0x00000024, 0x00000002, 0xFE363C80, 0x00000001, 0x00000024, 0x00000002, 0xFE363C81, 0x00000046, 0x00000024, 0x00000002, 0xFE363C82, 0x00000064, 0x00000024, 0x00000002, 0xFE363C83, 0x00000064, 0x00000024, 0x00000002, 0xFE363C84, 0x00000082, 0x00000024, 0x00000002, 0xFE363C85, 0x00000001, 0x00000024, 0x00000002, 0xFE363C86, 0x00000001, 0x00000024, 0x00000002, 0xFE363C87, 0x00000001, 0x00000024, 0x00000002, 0xFE363C88, 0x00000001, 0x00000024, 0x00000002, 0xFE363C89, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8A, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8B, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8C, 0x00000000, 0x00000044, 0x00000001, 0x80242070, 0x00000057, 0x00000000, 0x00000043, 0x00000003, EnableTexPanning, 0x00000019, 0x00000001, 0x00000056, 0x00000000, 0x00000024, 0x00000002, 0xFE363C80, 0x00000004, 0x00000024, 0x00000002, 0xFE363C81, 0xFFFFFFCE, 0x00000024, 0x00000002, 0xFE363C82, 0xFFFFFC7C, 0x00000024, 0x00000002, 0xFE363C83, 0xFFFFFFBA, 0x00000024, 0x00000002, 0xFE363C84, 0xFFFFFB50, 0x00000024, 0x00000002, 0xFE363C85, 0x00000001, 0x00000024, 0x00000002, 0xFE363C86, 0x00000001, 0x00000024, 0x00000002, 0xFE363C87, 0x00000001, 0x00000024, 0x00000002, 0xFE363C88, 0x00000001, 0x00000024, 0x00000002, 0xFE363C89, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8A, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8B, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8C, 0x00000000, 0x00000044, 0x00000001, 0x80242070, 0x00000057, 0x00000000, 0x00000043, 0x00000003, EnableTexPanning, 0x00000017, 0x00000001, 0x00000056, 0x00000000, 0x00000024, 0x00000002, 0xFE363C80, 0x00000005, 0x00000024, 0x00000002, 0xFE363C81, 0x00000000, 0x00000024, 0x00000002, 0xFE363C82, 0xFFFFFA88, 0x00000024, 0x00000002, 0xFE363C83, 0xFFFFF5D8, 0x00000024, 0x00000002, 0xFE363C84, 0xFFFFFFC4, 0x00000024, 0x00000002, 0xFE363C85, 0x00000001, 0x00000024, 0x00000002, 0xFE363C86, 0x00000001, 0x00000024, 0x00000002, 0xFE363C87, 0x00000001, 0x00000024, 0x00000002, 0xFE363C88, 0x00000001, 0x00000024, 0x00000002, 0xFE363C89, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8A, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8B, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8C, 0x00000000, 0x00000044, 0x00000001, 0x80242070, 0x00000057, 0x00000000, 0x00000043, 0x00000003, EnableTexPanning, 0x00000016, 0x00000001, 0x00000043, 0x00000003, EnableTexPanning, 0x00000012, 0x00000001, 0x00000043, 0x00000003, EnableTexPanning, 0x00000010, 0x00000001, 0x00000043, 0x00000003, EnableTexPanning, 0x0000000D, 0x00000001, 0x00000056, 0x00000000, 0x00000024, 0x00000002, 0xFE363C80, 0x00000006, 0x00000024, 0x00000002, 0xFE363C81, 0x000000C8, 0x00000024, 0x00000002, 0xFE363C82, 0x00000190, 0x00000024, 0x00000002, 0xFE363C83, 0x000000FA, 0x00000024, 0x00000002, 0xFE363C84, 0x00000000, 0x00000024, 0x00000002, 0xFE363C85, 0x00000001, 0x00000024, 0x00000002, 0xFE363C86, 0x00000001, 0x00000024, 0x00000002, 0xFE363C87, 0x00000001, 0x00000024, 0x00000002, 0xFE363C88, 0x00000001, 0x00000024, 0x00000002, 0xFE363C89, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8A, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8B, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8C, 0x00000000, 0x00000044, 0x00000001, 0x80242070, 0x00000057, 0x00000000, 0x00000043, 0x00000003, SetRenderMode, 0x00000011, 0x00000016, 0x00000043, 0x00000003, SetRenderMode, 0x00000014, 0x00000016, 0x00000056, 0x00000000, 0x00000024, 0x00000002, 0xFE363C82, 0x0000002A, 0x00000044, 0x00000001, 0x8024245C, 0x00000008, 0x00000001, 0x00000005, 0x00000024, 0x00000002, 0xFE363C82, 0x0000002C, 0x00000044, 0x00000001, 0x8024245C, 0x00000008, 0x00000001, 0x00000005, 0x00000024, 0x00000002, 0xFE363C82, 0x0000002E, 0x00000044, 0x00000001, 0x8024245C, 0x00000057, 0x00000000, 0x00000043, 0x00000005, TranslateModel, 0x0000001D, 0x00000000, 0x0000003C, 0x00000000, 0x00000043, 0x00000005, TranslateModel, 0x00000021, 0x00000000, 0x0000003C, 0x00000000, 0x00000043, 0x00000004, ModifyColliderFlags, 0x00000000, 0x0000000C, 0x7FFFFE00, 0x00000043, 0x00000004, ModifyColliderFlags, 0x00000000, 0x0000000D, 0x7FFFFE00, 0x00000043, 0x00000002, ClearAmbientSounds, 0x000000FA, 0x00000044, 0x00000001, 0x802423A0, 0x00000008, 0x00000001, 0x00000001, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000024, 0x00000002, 0xFE363C81, 0xF4ACD485, 0x00000027, 0x00000002, 0xFE363C81, 0x00000001, 0x00000024, 0x00000002, 0xFE363C82, 0xF4ACD480, 0x00000024, 0x00000002, 0xFE363C83, 0xF4ACD481, 0x00000024, 0x00000002, 0xFE363C84, 0xF4ACD485, 0x00000027, 0x00000002, 0xFE363C84, 0x00000002, 0x00000024, 0x00000002, 0xFE363C85, 0xF4ACD480, 0x00000024, 0x00000002, 0xFE363C86, 0xF4ACD481, 0x00000024, 0x00000002, 0xFE363C87, 0xF4ACD485, 0x00000027, 0x00000002, 0xFE363C87, 0x00000003, 0x00000024, 0x00000002, 0xFE363C88, 0xF4ACD480, 0x00000024, 0x00000002, 0xFE363C89, 0xF4ACD481, 0x00000024, 0x00000002, 0xFE363C8A, 0xF4ACD485, 0x00000027, 0x00000002, 0xFE363C8A, 0x00000004, 0x00000024, 0x00000002, 0xFE363C8B, 0xF4ACD480, 0x00000024, 0x00000002, 0xFE363C8C, 0xF4ACD481, 0x00000043, 0x00000003, EnableModel, 0xFE363C81, 0x00000001, 0x00000043, 0x00000003, EnableModel, 0xFE363C84, 0x00000001, 0x00000043, 0x00000003, EnableModel, 0xFE363C87, 0x00000001, 0x00000043, 0x00000003, EnableModel, 0xFE363C8A, 0x00000001, 0x00000005, 0x00000001, 0x00000005, 0x00000027, 0x00000002, 0xFE363C80, 0x00000001, 0x00000027, 0x00000002, 0xFE363C82, 0x00000001, 0x00000027, 0x00000002, 0xFE363C83, 0x00000001, 0x00000043, 0x00000005, TranslateModel, 0xFE363C81, 0xFE363C82, 0xFE363C80, 0xFE363C83, 0x00000043, 0x00000005, ScaleModel, 0xFE363C81, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000027, 0x00000002, 0xFE363C85, 0xFFFFFFFF, 0x00000027, 0x00000002, 0xFE363C86, 0x00000001, 0x00000043, 0x00000005, TranslateModel, 0xFE363C84, 0xFE363C85, 0xFE363C80, 0xFE363C86, 0x00000043, 0x00000005, ScaleModel, 0xFE363C84, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000027, 0x00000002, 0xFE363C88, 0x00000001, 0x00000027, 0x00000002, 0xFE363C89, 0xFFFFFFFF, 0x00000043, 0x00000005, TranslateModel, 0xFE363C87, 0xFE363C88, 0xFE363C80, 0xFE363C89, 0x00000043, 0x00000005, ScaleModel, 0xFE363C87, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000027, 0x00000002, 0xFE363C8B, 0xFFFFFFFF, 0x00000027, 0x00000002, 0xFE363C8C, 0xFFFFFFFF, 0x00000043, 0x00000005, TranslateModel, 0xFE363C8A, 0xFE363C8B, 0xFE363C80, 0xFE363C8C, 0x00000043, 0x00000005, ScaleModel, 0xFE363C8A, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000008, 0x00000001, 0x00000001, 0x00000006, 0x00000000, 0x00000005, 0x00000001, 0x00000005, 0x00000027, 0x00000002, 0xFE363C80, 0xFFFFFFFF, 0x00000027, 0x00000002, 0xFE363C82, 0x00000001, 0x00000027, 0x00000002, 0xFE363C83, 0x00000001, 0x00000043, 0x00000005, TranslateModel, 0xFE363C81, 0xFE363C82, 0xFE363C80, 0xFE363C83, 0x00000043, 0x00000005, ScaleModel, 0xFE363C81, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000027, 0x00000002, 0xFE363C85, 0xFFFFFFFF, 0x00000027, 0x00000002, 0xFE363C86, 0x00000001, 0x00000043, 0x00000005, TranslateModel, 0xFE363C84, 0xFE363C85, 0xFE363C80, 0xFE363C86, 0x00000043, 0x00000005, ScaleModel, 0xFE363C84, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000027, 0x00000002, 0xFE363C88, 0x00000001, 0x00000027, 0x00000002, 0xFE363C89, 0xFFFFFFFF, 0x00000043, 0x00000005, TranslateModel, 0xFE363C87, 0xFE363C88, 0xFE363C80, 0xFE363C89, 0x00000043, 0x00000005, ScaleModel, 0xFE363C87, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000027, 0x00000002, 0xFE363C8B, 0xFFFFFFFF, 0x00000027, 0x00000002, 0xFE363C8C, 0xFFFFFFFF, 0x00000043, 0x00000005, TranslateModel, 0xFE363C8A, 0xFE363C8B, 0xFE363C80, 0xFE363C8C, 0x00000043, 0x00000005, ScaleModel, 0xFE363C8A, 0xF24A7C80, 0xF24A7C80, 0xF24A7C80, 0x00000008, 0x00000001, 0x00000001, 0x00000006, 0x00000000, 0x00000043, 0x00000003, EnableModel, 0xFE363C81, 0x00000000, 0x00000043, 0x00000003, EnableModel, 0xFE363C84, 0x00000000, 0x00000043, 0x00000003, EnableModel, 0xFE363C87, 0x00000000, 0x00000043, 0x00000003, EnableModel, 0xFE363C8A, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x0000004D, 0x00000001, 0x00000000, 0x0000003C, 0x00000001, 0xFE363C8A, 0x00000024, 0x00000002, 0xFE363C85, 0xF4ACD485, 0x00000005, 0x00000001, 0x00000005, 0x00000043, 0x00000003, CloneModel, 0x00000023, 0xFE363C85, 0x00000043, 0x00000005, TranslateModel, 0xFE363C85, 0xF4ACD480, 0xF4ACD482, 0xF4ACD481, 0x00000027, 0x00000002, 0xFE363C85, 0x00000001, 0x00000006, 0x00000000, 0x00000003, 0x00000001, 0x00000000, 0x00000043, 0x00000003, RandInt, 0x000000C8, 0xFE363C80, 0x00000027, 0x00000002, 0xFE363C80, 0x00000032, 0x00000008, 0x00000001, 0xFE363C80, 0x00000043, 0x00000003, EnableModel, 0xF4ACD485, 0x00000001, 0x00000043, 0x00000005, MakeLerp, 0xF4ACD482, 0xF4ACD483, 0xF4ACD484, 0x00000001, 0x00000003, 0x00000001, 0x00000001, 0x00000043, 0x00000001, UpdateLerp, 0x00000043, 0x00000005, TranslateModel, 0xF4ACD485, 0xF4ACD480, 0xFE363C80, 0xF4ACD481, 0x00000008, 0x00000001, 0x00000001, 0x00000043, 0x00000002, func_802405F0_8827B0, 0xF4ACD485, 0x0000000A, 0x00000002, 0xFE363C82, 0x00000001, 0x00000004, 0x00000001, 0x0000000A, 0x00000013, 0x00000000, 0x0000000A, 0x00000002, 0xFE363C81, 0x00000001, 0x00000004, 0x00000001, 0x00000001, 0x00000013, 0x00000000, 0x00000003, 0x00000001, 0x0000000A, 0x00000043, 0x00000003, EnableModel, 0xF4ACD485, 0x00000000, 0x00000043, 0x00000002, PlaySound, 0x000003F6, 0x00000046, 0x00000001, 0x80242C70, 0x00000004, 0x00000001, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000024, 0x00000002, 0xFE363C8F, 0x00002710, 0x00000030, 0x00000001, 0xFE363C80, 0x00000031, 0x00000001, 0xFE363C81, 0x00000005, 0x00000001, 0xFE363C81, 0x00000034, 0x00000004, 0xFE363C82, 0xFE363C83, 0xFE363C84, 0xFE363C85, 0x00000033, 0x00000003, 0xFE363C86, 0xFE363C87, 0xFE363C88, 0x00000031, 0x00000001, 0xFE363C89, 0x00000005, 0x00000001, 0xFE363C89, 0x0000003E, 0x00000002, 0x00000006, 0xFE363C8A, 0x0000003C, 0x00000001, 0xFE363C8A, 0x00000043, 0x00000003, RandInt, 0xFE363C84, 0xFE363C8B, 0x00000043, 0x00000003, RandInt, 0xFE363C85, 0xFE363C8C, 0x00000024, 0x00000002, 0xFE363C8D, 0xFE363C82, 0x00000024, 0x00000002, 0xFE363C8E, 0xFE363C83, 0x00000027, 0x00000002, 0xFE363C8D, 0xFE363C8B, 0x00000027, 0x00000002, 0xFE363C8E, 0xFE363C8C, 0x00000024, 0x00000002, 0xF4ACD480, 0xFE363C8D, 0x00000024, 0x00000002, 0xF4ACD481, 0xFE363C8E, 0x00000024, 0x00000002, 0xF4ACD482, 0xFE363C86, 0x00000024, 0x00000002, 0xF4ACD483, 0xFE363C87, 0x00000024, 0x00000002, 0xF4ACD484, 0xFE363C88, 0x00000024, 0x00000002, 0xF4ACD485, 0xFE363C8F, 0x00000044, 0x00000001, 0x80243140, 0x00000027, 0x00000002, 0xFE363C8F, 0x00000005, 0x00000006, 0x00000000, 0x00000006, 0x00000000, 0x00000043, 0x00000003, EnableModel, 0x00000023, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000001, 0xFFFFFF21, 0xFFFFFFE1, 0x00000226, 0x00000044, 0x000000C8, 0xFFFFFFF6, 0x0000003C, 0x00000003, 0x00000024, 0x00000002, 0xFE363C80, 0x802434C4, 0x00000044, 0x00000001, 0x80243318, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000
