.include "macro.inc"

.section .data

glabel D_80240D40_A79200
.word 0x00000000, 0x001E0018, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00630000, 0x00000000, 0x00170013, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00630000

glabel D_80240D98_A79258
.word 0x00000000

glabel D_80240D9C_A7925C
.word 0x00000000, 0x00000024, 0x00000002, 0xFE363C89, 0xFE363C81, 0x00000043, 0x00000001, func_802D6420, 0x00000024, 0x00000002, 0xFE363C8A, 0xFE363C80, 0x00000014, 0x00000001, 0xFE363C80, 0x00000016, 0x00000001, 0x00000000, 0x00000016, 0x00000001, 0xFFFFFFFF, 0x0000001C, 0x00000000, 0x00000043, 0x00000002, RemoveKeyItemAt, 0xFE363C81, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C83, 0xFE363C84, 0xFE363C85, 0x00000043, 0x00000004, kpa_81_SomeXYZFuncTodoRename, 0xFE363C83, 0xFE363C84, 0xFE363C85, 0x00000042, 0x00000002, 0xFE363C80, 0x00050000, 0x00000043, 0x00000007, MakeItemEntity, 0xFE363C80, 0xFE363C83, 0xFE363C84, 0xFE363C85, 0x00000001, 0x00000000, 0x00000043, 0x00000002, SetPlayerAnimation, 0x00060005, 0x00000008, 0x00000001, 0x0000001E, 0x00000043, 0x00000002, SetPlayerAnimation, 0x00010002, 0x00000043, 0x00000002, RemoveItemEntity, 0xFE363C80, 0x00000023, 0x00000000, 0x00000043, 0x00000002, func_802402D0_A78790, 0xFE363C8A, 0x00000043, 0x00000001, func_802D6954, 0x00000048, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000043, 0x00000002, func_80240308_A787C8, 0xFE363C80, 0x0000004E, 0x00000006, 0x80240DA0, 0x00000010, 0x00000000, func_80242040_8B20B0, 0x00000000, 0x00000001, 0x00000043, 0x00000002, func_8024027C_A7873C, 0xFE363C80, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000024, 0x00000002, 0xFE363C89, 0xFE363C81, 0x00000043, 0x00000001, func_802D663C, 0x00000024, 0x00000002, 0xFE363C8A, 0xFE363C80, 0x00000014, 0x00000001, 0xFE363C80, 0x00000016, 0x00000001, 0x00000000, 0x00000016, 0x00000001, 0xFFFFFFFF, 0x0000001C, 0x00000000, 0x00000043, 0x00000002, RemoveItemAt, 0xFE363C81, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C83, 0xFE363C84, 0xFE363C85, 0x00000043, 0x00000004, kpa_81_SomeXYZFuncTodoRename, 0xFE363C83, 0xFE363C84, 0xFE363C85, 0x00000043, 0x00000007, MakeItemEntity, 0xFE363C80, 0xFE363C83, 0xFE363C84, 0xFE363C85, 0x00000001, 0x00000000, 0x00000043, 0x00000002, SetPlayerAnimation, 0x00060005, 0x00000008, 0x00000001, 0x0000001E, 0x00000043, 0x00000002, SetPlayerAnimation, 0x00010002, 0x00000043, 0x00000002, RemoveItemEntity, 0xFE363C80, 0x00000023, 0x00000000, 0x00000043, 0x00000002, func_802402D0_A78790, 0xFE363C8A, 0x00000043, 0x00000001, func_802D6954, 0x00000048, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000043, 0x00000002, func_802403A4_A78864, 0xFE363C80, 0x0000004E, 0x00000006, 0x80240F34, 0x00000010, 0x00000000, D_80242208, 0x00000000, 0x00000001, 0x00000043, 0x00000002, func_8024027C_A7873C, 0xFE363C80, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000043, 0x00000002, GetCurrentPartner, 0xFE363C80, 0x0000000B, 0x00000002, 0xFE363C80, 0x00000000, 0x0000000A, 0x00000002, 0xFE363C80, 0x00000003, 0x00000005, 0x00000001, 0x00000000, 0x00000043, 0x00000002, GetCurrentPartner, 0xFE363C80, 0x00000008, 0x00000001, 0x00000001, 0x0000000A, 0x00000002, 0xFE363C80, 0x00000000, 0x00000007, 0x00000000, 0x00000013, 0x00000000, 0x00000006, 0x00000000, 0x00000012, 0x00000000, 0x00000043, 0x00000001, func_802D2B6C, 0x00000008, 0x00000001, 0x00000014, 0x00000013, 0x00000000, 0x00000013, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x0000000A, 0x00000002, 0xF5DE02AA, 0x00000002, 0x00000002, 0x00000000, 0x00000013, 0x00000000, 0x0000000A, 0x00000002, 0xF5DE02AA, 0x00000001, 0x00000024, 0x00000002, 0xF5DE02AA, 0x00000002, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x00000008, 0x00000001, 0x00000023, 0x00000043, 0x00000004, SetCamType, 0x00000000, 0x00000006, 0x00000000, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000043, 0x00000005, UseSettingsFrom, 0x00000000, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000043, 0x00000005, SetPanTarget, 0x00000000, 0x0000006D, 0x00000000, 0x000000CA, 0x00000043, 0x00000003, SetCamSpeed, 0x00000000, 0xF24A8680, 0x00000043, 0x00000004, SetCamPitch, 0x00000000, 0xF24AB680, 0xF24A5280, 0x00000043, 0x00000003, SetCamDistance, 0x00000000, 0xF2524A80, 0x00000043, 0x00000004, SetCamPosA, 0x00000000, 0xF24C8E80, 0xF24C0A80, 0x00000043, 0x00000004, SetCamPosB, 0x00000000, 0xF24DDA80, 0xF24E1280, 0x00000043, 0x00000004, PanToTarget, 0x00000000, 0x00000000, 0x00000001, 0x00000043, 0x00000003, WaitForCam, 0x00000000, 0xF24A7E80, 0x00000056, 0x00000000, 0x00000043, 0x00000005, SetMusicTrack, 0x00000000, 0x00000005, 0x00000001, 0x00000008, 0x00000008, 0x00000001, 0x00000096, 0x00000043, 0x00000003, FadeOutMusic, 0x00000000, 0x000000FA, 0x00000008, 0x00000001, 0x0000000F, 0x00000044, 0x00000001, 0x802404C0, 0x00000057, 0x00000000, 0x00000043, 0x00000006, SpeakToPlayer, 0xFFFFFFFF, 0x00830001, 0x00830001, 0x00000000, 0x00130008, 0x00000044, 0x00000001, 0x802404C0, 0x00000043, 0x00000003, ResetCam, 0x00000000, 0xF24BE280, 0x00000043, 0x00000004, PanToTarget, 0x00000000, 0x00000000, 0x00000000, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000000, 0x00000002, 0x00000000, 0x00000013, 0x00000000, 0x00000008, 0x00000001, 0x0000000A, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000043, 0x00000002, SetPlayerSpeed, 0xF24A8280, 0x00000043, 0x00000004, PlayerMoveTo, 0xFFFFFF8D, 0xFE363C82, 0x00000000, 0x00000043, 0x00000004, SetCamType, 0x00000000, 0x00000006, 0x00000000, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000043, 0x00000005, UseSettingsFrom, 0x00000000, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000043, 0x00000005, SetPanTarget, 0x00000000, 0x0000006D, 0x00000000, 0x000000CA, 0x00000043, 0x00000003, SetCamSpeed, 0x00000000, 0xF24A8680, 0x00000043, 0x00000004, SetCamPitch, 0x00000000, 0xF24AB680, 0xF24A5280, 0x00000043, 0x00000003, SetCamDistance, 0x00000000, 0xF2524A80, 0x00000043, 0x00000004, SetCamPosA, 0x00000000, 0xF24C8E80, 0xF24C0A80, 0x00000043, 0x00000004, SetCamPosB, 0x00000000, 0xF24DDA80, 0xF24E1280, 0x00000043, 0x00000004, PanToTarget, 0x00000000, 0x00000000, 0x00000001, 0x00000043, 0x00000003, WaitForCam, 0x00000000, 0xF24A7E80, 0x00000056, 0x00000000, 0x00000043, 0x00000005, SetMusicTrack, 0x00000000, 0x00000005, 0x00000001, 0x00000008, 0x00000008, 0x00000001, 0x00000096, 0x00000043, 0x00000003, FadeOutMusic, 0x00000000, 0x000000FA, 0x00000008, 0x00000001, 0x0000000F, 0x00000044, 0x00000001, 0x802404C0, 0x00000057, 0x00000000, 0x00000043, 0x00000006, SpeakToPlayer, 0xFFFFFFFF, 0x00830001, 0x00830001, 0x00000000, 0x00130000, 0x00000043, 0x00000002, ShowChoice, 0x001E0013, 0x0000000A, 0x00000002, 0xFE363C80, 0x00000000, 0x00000043, 0x00000006, ContinueSpeech, 0xFFFFFFFF, 0x00830001, 0x00830001, 0x00000000, 0x00130003, 0x00000043, 0x00000003, ResetCam, 0x00000000, 0xF24BE280, 0x00000043, 0x00000004, PanToTarget, 0x00000000, 0x00000000, 0x00000000, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000000, 0x00000003, 0x00000001, 0x00000064, 0x00000008, 0x00000001, 0x00000001, 0x00000043, 0x00000005, IsPlayerWithin, 0x00000078, 0x00000096, 0x0000001E, 0xFE363C80, 0x0000000A, 0x00000002, 0xFE363C80, 0x00000001, 0x00000004, 0x00000001, 0x00000003, 0x00000013, 0x00000000, 0x00000027, 0x00000002, 0xFE363C81, 0x00000001, 0x0000000E, 0x00000002, 0xFE363C81, 0x0000012C, 0x00000004, 0x00000001, 0x00000064, 0x00000013, 0x00000000, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x00000046, 0x00000001, 0x802410B8, 0x00000043, 0x00000006, SpeakToPlayer, 0xFFFFFFFF, 0x00830001, 0x00830001, 0x00000000, 0x00130004, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000000, 0x00000043, 0x00000004, AwaitPlayerApproach, 0x00000078, 0x00000096, 0x0000001E, 0x00000004, 0x00000001, 0x00000002, 0x00000012, 0x00000000, 0x00000043, 0x00000006, ContinueSpeech, 0xFFFFFFFF, 0x00830001, 0x00830001, 0x00000000, 0x00130002, 0x00000043, 0x00000003, ResetCam, 0x00000000, 0xF24BE280, 0x00000043, 0x00000004, PanToTarget, 0x00000000, 0x00000000, 0x00000000, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000000, 0x00000043, 0x00000004, AwaitPlayerApproach, 0x00000078, 0x00000096, 0x0000001E, 0x00000013, 0x00000000, 0x00000003, 0x00000001, 0x00000002, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x00000046, 0x00000001, 0x802410B8, 0x00000043, 0x00000006, SpeakToPlayer, 0xFFFFFFFF, 0x00830001, 0x00830001, 0x00000000, 0x00130001, 0x00000043, 0x00000002, ShowChoice, 0x001E0013, 0x0000000A, 0x00000002, 0xFE363C80, 0x00000000, 0x00000004, 0x00000001, 0x00000004, 0x00000012, 0x00000000, 0x00000043, 0x00000006, ContinueSpeech, 0xFFFFFFFF, 0x00830001, 0x00830001, 0x00000000, 0x00130002, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000000, 0x00000043, 0x00000004, AwaitPlayerLeave, 0x00000078, 0x00000096, 0x0000001E, 0x00000043, 0x00000004, AwaitPlayerApproach, 0x00000078, 0x00000096, 0x0000001E, 0x00000004, 0x00000001, 0x00000002, 0x00000013, 0x00000000, 0x00000003, 0x00000001, 0x00000003, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000001, 0x00000046, 0x00000001, 0x802410B8, 0x00000056, 0x00000000, 0x00000043, 0x00000002, DisablePartnerAI, 0x00000000, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000043, 0x00000005, NpcMoveTo, 0xFFFFFFFC, 0xFE363C80, 0xFE363C82, 0x0000000A, 0x00000043, 0x00000001, EnablePartnerAI, 0x00000057, 0x00000000, 0x00000043, 0x00000006, SpeakToPlayer, 0xFFFFFFFF, 0x00830001, 0x00830001, 0x00000000, 0x00130005, 0x00000004, 0x00000001, 0x00000005, 0x00000003, 0x00000001, 0x00000004, 0x00000046, 0x00000001, 0x802410B8, 0x00000056, 0x00000000, 0x00000043, 0x00000002, DisablePartnerAI, 0x00000000, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000043, 0x00000005, NpcMoveTo, 0xFFFFFFFC, 0xFE363C80, 0xFE363C82, 0x0000000A, 0x00000043, 0x00000001, EnablePartnerAI, 0x00000057, 0x00000000, 0x00000043, 0x00000006, ContinueSpeech, 0xFFFFFFFF, 0x00830001, 0x00830001, 0x00000000, 0x00130006, 0x00000003, 0x00000001, 0x00000005, 0x00000043, 0x00000004, SetCamType, 0x00000000, 0x00000006, 0x00000000, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000043, 0x00000005, UseSettingsFrom, 0x00000000, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000043, 0x00000005, SetPanTarget, 0x00000000, 0x000000A3, 0xFFFFFFB9, 0x0000006C, 0x00000043, 0x00000003, SetCamSpeed, 0x00000000, 0xF24A8680, 0x00000043, 0x00000004, SetCamPitch, 0x00000000, 0xF24ACA80, 0xF24A3A80, 0x00000043, 0x00000003, SetCamDistance, 0x00000000, 0xF2524A80, 0x00000043, 0x00000004, SetCamPosA, 0x00000000, 0xF24C8E80, 0xF24C0A80, 0x00000043, 0x00000004, SetCamPosB, 0x00000000, 0xF24DDA80, 0xF24E1280, 0x00000043, 0x00000004, PanToTarget, 0x00000000, 0x00000000, 0x00000001, 0x00000043, 0x00000003, WaitForCam, 0x00000000, 0xF24A7E80, 0x00000043, 0x00000003, EnableModel, 0x0000000C, 0x00000001, 0x00000056, 0x00000000, 0x00000008, 0x00000001, 0x00000019, 0x00000043, 0x00000003, EnableModel, 0x00000046, 0x00000000, 0x00000057, 0x00000000, 0x00000043, 0x00000004, PlaySoundAtCollider, 0x0000001A, 0x00002091, 0x00000000, 0x00000043, 0x00000005, MakeLerp, 0x00000000, 0x0000005A, 0x0000001E, 0x00000007, 0x00000003, 0x00000001, 0x0000000A, 0x00000043, 0x00000001, UpdateLerp, 0x00000043, 0x00000006, RotateModel, 0x00000046, 0xFE363C80, 0x00000000, 0x00000000, 0xFFFFFFFF, 0x00000043, 0x00000006, RotateModel, 0x00000048, 0xFE363C80, 0x00000000, 0x00000000, 0x00000001, 0x00000008, 0x00000001, 0x00000001, 0x0000000A, 0x00000002, 0xFE363C81, 0x00000001, 0x00000004, 0x00000001, 0x0000000A, 0x00000013, 0x00000000, 0x00000043, 0x00000002, SetPlayerAnimation, 0x00080017, 0x00000008, 0x00000001, 0x0000001E, 0x00000043, 0x00000002, DisablePlayerPhysics, 0x00000001, 0x00000043, 0x00000002, DisablePartnerAI, 0x00000000, 0x00000043, 0x00000002, SetPlayerAnimation, 0x00080018, 0x00000008, 0x00000001, 0x0000000A, 0x00000043, 0x00000003, PlaySoundAtPlayer, 0x00000161, 0x00000000, 0x00000056, 0x00000000, 0x00000043, 0x00000004, GetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000005, 0x00000001, 0x00000041, 0x00000028, 0x00000002, 0xFE363C81, 0x00000010, 0x00000043, 0x00000004, SetPlayerPos, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000008, 0x00000001, 0x00000001, 0x00000006, 0x00000000, 0x00000057, 0x00000000, 0x00000056, 0x00000000, 0x00000043, 0x00000005, GetNpcPos, 0xFFFFFFFC, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000005, 0x00000001, 0x00000041, 0x00000028, 0x00000002, 0xFE363C81, 0x00000010, 0x00000043, 0x00000005, SetNpcPos, 0xFFFFFFFC, 0xFE363C80, 0xFE363C81, 0xFE363C82, 0x00000008, 0x00000001, 0x00000001, 0x00000006, 0x00000000, 0x00000057, 0x00000000, 0x00000008, 0x00000001, 0x00000041, 0x00000043, 0x00000002, DisablePlayerInput, 0x00000000, 0x00000024, 0x00000002, 0xF5DE02AA, 0x00000001, 0x00000043, 0x00000003, GotoMap, 0x80242034, 0x00000000, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000043, 0x00000003, BindNpcIdle, 0xFFFFFFFF, 0x80241178, 0x00000043, 0x00000004, SetNpcFlagBits, 0xFFFFFFFF, 0x10000102, 0x00000001, 0x00000043, 0x00000003, EnableNpcShadow, 0xFFFFFFFF, 0x00000000, 0x00000043, 0x00000005, SetNpcPos, 0xFFFFFFFF, 0x000000B8, 0x00000014, 0x00000096, 0x00000002, 0x00000000, 0x00000001, 0x00000000, 0x00000000, D_80240D40_A79200, 0x00000000, 0xC47A0000, 0x00000000, 0x03504D08, 0x80241D84, 0x00000000, 0x00000000, 0x00000000, D_80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00007FFF, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00007FFF, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00830001, 0x00830002, 0x00830003, 0x00830003, 0x00830001, 0x00830001, 0x00830006, 0x00830006, 0x00830003, 0x00830003, 0x00830003, 0x00830003, 0x00830003, 0x00830003, 0x00830003, 0x00830003, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000001, 0x80241DF0, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
