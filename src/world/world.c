#include "common.h"
#include "ld_addrs.h"
#include "npc.h"
#include "camera.h"
#include "hud_element.h"
#include "sprite.h"
#include "model.h"

#ifdef SHIFT
#define ASSET_TABLE_ROM_START mapfs_ROM_START
#else
#define ASSET_TABLE_ROM_START 0x1E40000
#endif

#define ASSET_TABLE_HEADER_SIZE 0x20
#define ASSET_TABLE_FIRST_ENTRY (ASSET_TABLE_ROM_START + ASSET_TABLE_HEADER_SIZE)

s32 D_8008FF60[] = { 0, 1, 2, 3 };

// bss
MapSettings gMapSettings;
MapConfig* gMapConfig;

extern char wMapBgName[];

typedef struct {
    /* 0x00 */ char name[16];
    /* 0x10 */ u32 offset;
    /* 0x14 */ u32 compressedLength;
    /* 0x18 */ u32 decompressedLength;
} AssetHeader; // size = 0x1C

void fio_deserialize_state(void);
void load_map_hit_asset(void);

void load_map_script_lib(void) {
    dma_copy(world_script_api_ROM_START, world_script_api_ROM_END, world_script_api_VRAM);
}

void load_map_by_IDs(s16 areaID, s16 mapID, s16 loadType) {
    s32 skipLoadingAssets = 0;
    MapConfig* mapConfig;
    MapSettings* mapSettings;
    char texStr[17];
    s32 decompressedSize;

    sfx_stop_env_sounds();
    gOverrideFlags &= ~GLOBAL_OVERRIDES_40;
    gOverrideFlags &= ~GLOBAL_OVERRIDES_80;

    gGameStatusPtr->playerSpriteSet = 0;
    func_8002D160();
    func_802B2078();
    clear_render_tasks();
    clear_generic_entity_list();
    clear_script_list();

    switch (loadType) {
        case LOAD_FROM_MAP:
            clear_area_flags();
            gGameStatusPtr->loadType = LOAD_FROM_MAP;
            break;
        case LOAD_FROM_FILE_SELECT:
            fio_deserialize_state();
            areaID = gGameStatusPtr->areaID;
            mapID = gGameStatusPtr->mapID;
            gGameStatusPtr->prevArea = areaID;
            gGameStatusPtr->loadType = LOAD_FROM_FILE_SELECT;
            break;
    }

    gGameStatusPtr->mapShop = NULL;

    mapConfig = &gAreas[areaID].maps[mapID];

    sprintf(wMapShapeName, "%s_shape", mapConfig->id);
    sprintf(wMapHitName, "%s_hit", mapConfig->id);
    strcpy(texStr, mapConfig->id);
    texStr[3] = '\0';
    sprintf(wMapTexName, "%s_tex", texStr);

    gMapConfig = mapConfig;
    if (mapConfig->bgName != NULL) {
        strcpy(wMapBgName, mapConfig->bgName);
    }
    load_map_script_lib();

    if (mapConfig->dmaStart != NULL) {
        dma_copy(mapConfig->dmaStart, mapConfig->dmaEnd, mapConfig->dmaDest);
    }

    gMapSettings = *mapConfig->settings;

    mapSettings = &gMapSettings;
    if (mapConfig->init != NULL) {
        skipLoadingAssets = mapConfig->init();
    }

    if (!skipLoadingAssets) {
        ShapeFile* shapeFile = &D_80210000;
        void* yay0Asset = load_asset_by_name(wMapShapeName, &decompressedSize);

        decode_yay0(yay0Asset, shapeFile);
        general_heap_free(yay0Asset);

        mapSettings->modelTreeRoot = shapeFile->root;
        mapSettings->modelNameList = shapeFile->modelNames;
        mapSettings->colliderNameList = shapeFile->colliderNames;
        mapSettings->zoneNameList = shapeFile->zoneNames;
    }

    if (mapConfig->bgName != NULL) {
        load_map_bg(wMapBgName);
    }

    func_8002D160();
    func_802B2078();
    sfx_clear_env_sounds(0);
    clear_generic_entity_list();
    clear_script_list();
    create_cameras_a();
    spr_init_sprites(gGameStatusPtr->playerSpriteSet);
    clear_animator_list();
    clear_entity_models();
    clear_npcs();
    hud_element_clear_cache();
    clear_trigger_data();
    clear_model_data();
    clear_sprite_shading_data();
    reset_background_settings();

    if (gGameStatusPtr->creditsViewportMode == -1) {
        func_80138188();
    }

    if (!skipLoadingAssets) {
        initialize_collision();
        load_map_hit_asset();
    }

    reset_battle_status();
    clear_encounter_status();
    clear_entity_data(1);
    clear_effect_data();
    clear_player_status();
    player_reset_data();
    partner_reset_data();
    clear_printers();
    clear_item_entity_data();

    gPlayerStatus.targetYaw = gPlayerStatus.currentYaw;

    func_801497FC(D_8008FF60[mapConfig->unk_1C.word & 0x3]);
    sfx_reset_door_sounds();

    if (!skipLoadingAssets) {
        s32 thing = get_asset_offset(wMapTexName, &decompressedSize);

        if (mapSettings->modelTreeRoot != NULL) {
            load_data_for_models(mapSettings->modelTreeRoot, thing, decompressedSize);
        }
    }

    if (mapSettings->background != NULL) {
        read_background_size(mapSettings->background);
    } else {
        set_background_size(296, 200, 12, 20);
    }

    gCurrentCameraID = CAM_DEFAULT;
    gCameras[CAM_DEFAULT].flags |= CAMERA_FLAGS_ENABLED;
    gCameras[CAM_BATTLE].flags |= CAMERA_FLAGS_ENABLED;
    gCameras[CAM_TATTLE].flags |= CAMERA_FLAGS_ENABLED;
    gCameras[CAM_3].flags |= CAMERA_FLAGS_ENABLED;

    if (gGameStatusPtr->creditsViewportMode == -1) {
        set_cam_viewport(0, 12, 20, 296, 200);
    } else {
        set_cam_viewport(0, 29, 28, 262, 162);
    }

    initialize_status_menu();
    gGameStatusPtr->unk_90 = 1000;
    gGameStatusPtr->unk_92 = 1000;
    gGameStatusPtr->mainScriptID = start_script_in_group(mapSettings->main, EVT_PRIORITY_0, 0, 0)->id;
}

MapConfig* get_current_map_config(void) {
    return gMapConfig;
}

MapSettings* get_current_map_settings(void) {
    return &gMapSettings;
}

s32 get_map_IDs_by_name(const char* mapName, s16* areaID, s16* mapID) {
    s32 i;
    s32 j;
    MapConfig* maps;

    // TODO: Potentially a fake match? Difficult to not set the temp in the for conditional.
    for (i = 0; (maps = gAreas[i].maps) != NULL; i++) {
        for (j = 0; j < gAreas[i].mapCount; j++) {
            if (strcmp(maps[j].id, mapName) == 0) {
                *areaID = i;
                *mapID = j;
                return TRUE;
            }
        }
    }

    return FALSE;
}

void* load_asset_by_name(const char* assetName, u32* decompressedSize) {
    AssetHeader firstHeader;
    AssetHeader* assetTableBuffer;
    AssetHeader* curAsset;
    void* ret;

    dma_copy((u8*) ASSET_TABLE_FIRST_ENTRY, (u8*) ASSET_TABLE_FIRST_ENTRY + sizeof(AssetHeader), &firstHeader);
    assetTableBuffer = heap_malloc(firstHeader.offset);
    curAsset = &assetTableBuffer[0];
    dma_copy((u8*) ASSET_TABLE_FIRST_ENTRY, (u8*) ASSET_TABLE_FIRST_ENTRY + firstHeader.offset, assetTableBuffer);
    while (strcmp(curAsset->name, assetName) != 0) {
        curAsset++;
    }
    *decompressedSize = curAsset->decompressedLength;
    ret = general_heap_malloc(curAsset->compressedLength);
    dma_copy((u8*) ASSET_TABLE_FIRST_ENTRY + curAsset->offset,
             (u8*) ASSET_TABLE_FIRST_ENTRY + curAsset->offset + curAsset->compressedLength, ret);
    heap_free(assetTableBuffer);
    return ret;
}

s32 get_asset_offset(char* assetName, s32* compressedSize) {
    AssetHeader firstHeader;
    AssetHeader* assetTableBuffer;
    AssetHeader* curAsset;
    s32 ret;

    dma_copy((u8*) ASSET_TABLE_FIRST_ENTRY, (u8*) ASSET_TABLE_FIRST_ENTRY + sizeof(AssetHeader), &firstHeader);
    assetTableBuffer = heap_malloc(firstHeader.offset);
    curAsset = &assetTableBuffer[0];
    dma_copy((u8*) ASSET_TABLE_FIRST_ENTRY, (u8*) ASSET_TABLE_FIRST_ENTRY + firstHeader.offset, assetTableBuffer);
    while (strcmp(curAsset->name, assetName) != 0) {
        curAsset++;
    }
    *compressedSize = curAsset->compressedLength;
    ret = ASSET_TABLE_FIRST_ENTRY + curAsset->offset;
    heap_free(assetTableBuffer);
    return ret;
}

#define AREA(area, jp_name) { ARRAY_COUNT(area##_maps), area##_maps, "area_" #area, jp_name }

#define MAP(map) \
    .id = #map, \
    .settings = &map##_settings, \
    .dmaStart = map##_ROM_START, \
    .dmaEnd = map##_ROM_END, \
    .dmaDest = map##_VRAM \

#define MAP_WITH_INIT(map) \
    MAP(map), \
    .init = &map##_map_init \

// Should be removed once the data section containing .init and .settings of all maps have been disassembled
#define MAP_UNSPLIT(map, settingsVRAM) \
    .id = #map, \
    .settings = (MapSettings*)(settingsVRAM), \
    .dmaStart = map##_ROM_START, \
    .dmaEnd = map##_ROM_END, \
    .dmaDest = map##_VRAM \


// these, along with all the *_maps, almost certainly belong in the next file
s16 gEntityColliderFaces[] = { 4, 6, 5, 4, 7, 6, 0, 3, 4, 3, 7, 4, 3, 2, 7, 2, 6, 7, 2, 1, 6, 1, 5, 6, 1, 0, 5,
                                 0, 4, 5, 0, 1, 2, 0, 2, 3};

f32 gEntityColliderNormals[] = { 0.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f,
                                       0.0f, -1.0f, 0.0f, 0.0f, -1.0f, -1.0f, 0.0f, 0.0f, -1.0f, 0.0f, 0.0f, 0.0f, 0.0f,
                                       1.0f, 0.0f, 0.0f, 1.0f, 0.0f, -1.0f, 0.0f, 0.0f, -1.0f, 0.0f, 0.0f, 0.0f};

/// Toad Town
MapConfig mac_maps[] = {
    { MAP_UNSPLIT(machi,  0x802407A0), .bgName = "nok_bg" },
    { MAP_UNSPLIT(mac_00, 0x80243BE0), .bgName = "nok_bg" },
    { MAP_UNSPLIT(mac_01, 0x80246730), .bgName = "nok_bg" },
    { MAP_UNSPLIT(mac_02, 0x80243580), .bgName = "nok_bg" },
    { MAP_UNSPLIT(mac_03, 0x802428B0), .bgName = "nok_bg" },
    { MAP_UNSPLIT(mac_04, 0x80242080), .bgName = "nok_bg", .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(mac_05, 0x802441A0), .bgName = "nok_bg" },
    { MAP_UNSPLIT(mac_06, 0x802416A0), .bgName = "nok_bg" },
};

/// Toad Town Tunnels
MapConfig tik_maps[] = {
    { MAP_UNSPLIT(tik_01, 0x80240AE0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_02, 0x802409B0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_03, 0x80240B00), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_04, 0x80240CB0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_05, 0x80240A90), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_06, 0x802409A0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_07, 0x80242920), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_08, 0x80240B10), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_09, 0x802412D0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_10, 0x802413D0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_12, 0x80242260), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_14, 0x80240980), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_15, 0x80240B30), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_17, 0x80241380), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_18, 0x802406D0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_19, 0x80241340), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_20, 0x80241170), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_21, 0x80240990), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_22, 0x802409D0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_23, 0x80241160), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_24, 0x80240ED0), .init = (MapInit)0x80240000, .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(tik_25, 0x802407D0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
};

/// Inside the Whale
#include "area_kgr/kgr.h"
MapConfig kgr_maps[] = {
    { MAP(kgr_01), .unk_1C = { .bytes = { .flags = 1 } } },
    { MAP(kgr_02), .unk_1C = { .bytes = { .flags = 1 } } },
};

/// Goomba Region
#include "area_kmr/kmr.h"
MapConfig kmr_maps[] = {
    { MAP(kmr_00), .bgName = "kmr_bg", .unk_1C = { .bytes = { .flags = 1 } } },
    { MAP_UNSPLIT(kmr_02, 0x80243AF0), .bgName = "kmr_bg" },
    { MAP(kmr_03), .bgName = "kmr_bg" },
    { MAP(kmr_04), .bgName = "kmr_bg" },
    { MAP(kmr_05), .bgName = "kmr_bg" },
    { MAP(kmr_06), .bgName = "kmr_bg" },
    { MAP(kmr_07), .bgName = "kmr_bg" },
    { MAP(kmr_09), .bgName = "kmr_bg" },
    { MAP(kmr_10), .bgName = "kmr_bg" },
    { MAP_UNSPLIT(kmr_11, 0x80241180), .bgName = "kmr_bg" },
    { MAP(kmr_12), .bgName = "kmr_bg" },
    { MAP_UNSPLIT(kmr_20, 0x80242C00), .bgName = "kmr_bg" }, // Mario's House
    { MAP_WITH_INIT(kmr_21) },
    { MAP_UNSPLIT(kmr_22, 0x80240DA0), .init = (MapInit)0x80240000 },
    { MAP_WITH_INIT(kmr_23) },
    { MAP_WITH_INIT(kmr_24) },
    { MAP(kmr_30) },
};

/// Mt. Rugged
#include "area_iwa/iwa.h"
MapConfig iwa_maps[] = {
    { MAP(iwa_00), .bgName = "iwa_bg" },
    { MAP(iwa_01), .bgName = "iwa_bg" },
    { MAP(iwa_02), .bgName = "iwa_bg" },
    { MAP(iwa_03), .bgName = "iwa_bg" },
    { MAP(iwa_04), .bgName = "iwa_bg" },
    { MAP(iwa_10), .bgName = "iwa_bg" },
    { MAP(iwa_11), .bgName = "iwa_bg" },
};

/// Dry Dry Outpost
#include "area_dro/dro.h"
MapConfig dro_maps[] = {
    { MAP(dro_01), .bgName = "sbk_bg" },
    { MAP(dro_02), .bgName = "sbk_bg" },
};

/// Dry Dry Desert
#include "area_sbk/sbk.h"
MapConfig sbk_maps[] = {
    { MAP(sbk_00), .bgName = "sbk_bg" },
    { MAP(sbk_01), .bgName = "sbk_bg" },
    { MAP(sbk_02), .bgName = "sbk_bg" },
    { MAP(sbk_03), .bgName = "sbk_bg" },
    { MAP(sbk_04), .bgName = "sbk_bg" },
    { MAP(sbk_05), .bgName = "sbk_bg" },
    { MAP(sbk_06), .bgName = "sbk_bg" },
    { MAP(sbk_10), .bgName = "sbk_bg" },
    { MAP(sbk_11), .bgName = "sbk_bg" },
    { MAP(sbk_12), .bgName = "sbk_bg" },
    { MAP(sbk_13), .bgName = "sbk_bg" },
    { MAP(sbk_14), .bgName = "sbk_bg" },
    { MAP(sbk_15), .bgName = "sbk_bg" },
    { MAP(sbk_16), .bgName = "sbk_bg" },
    { MAP(sbk_20), .bgName = "sbk_bg" },
    { MAP(sbk_21), .bgName = "sbk_bg" },
    { MAP(sbk_22), .bgName = "sbk_bg" },
    { MAP(sbk_23), .bgName = "sbk_bg" },
    { MAP(sbk_24), .bgName = "sbk_bg" },
    { MAP(sbk_25), .bgName = "sbk_bg" },
    { MAP(sbk_26), .bgName = "sbk_bg" },
    { MAP(sbk_30), .bgName = "sbk_bg" },
    { MAP(sbk_31), .bgName = "sbk_bg" },
    { MAP(sbk_32), .bgName = "sbk_bg" },
    { MAP(sbk_33), .bgName = "sbk_bg" },
    { MAP(sbk_34), .bgName = "sbk_bg" },
    { MAP(sbk_35), .bgName = "sbk_bg" },
    { MAP(sbk_36), .bgName = "sbk_bg" },
    { MAP(sbk_40), .bgName = "sbk_bg" },
    { MAP(sbk_41), .bgName = "sbk_bg" },
    { MAP(sbk_42), .bgName = "sbk_bg" },
    { MAP(sbk_43), .bgName = "sbk_bg" },
    { MAP(sbk_44), .bgName = "sbk_bg" },
    { MAP(sbk_45), .bgName = "sbk_bg" },
    { MAP(sbk_46), .bgName = "sbk_bg" },
    { MAP(sbk_50), .bgName = "sbk_bg" },
    { MAP(sbk_51), .bgName = "sbk_bg" },
    { MAP(sbk_52), .bgName = "sbk_bg" },
    { MAP(sbk_53), .bgName = "sbk_bg" },
    { MAP(sbk_54), .bgName = "sbk_bg" },
    { MAP(sbk_55), .bgName = "sbk_bg" },
    { MAP(sbk_56), .bgName = "sbk_bg" },
    { MAP(sbk_60), .bgName = "sbk_bg" },
    { MAP(sbk_61), .bgName = "sbk_bg" },
    { MAP(sbk_62), .bgName = "sbk_bg" },
    { MAP(sbk_63), .bgName = "sbk_bg" },
    { MAP(sbk_64), .bgName = "sbk_bg" },
    { MAP(sbk_65), .bgName = "sbk_bg" },
    { MAP(sbk_66), .bgName = "sbk_bg" },
    { MAP(sbk_99), .bgName = "sbk_bg" },
};

/// Dry Dry Ruins
MapConfig isk_maps[] = {
    { MAP_UNSPLIT(isk_01, 0x80240020), .bgName = "sbk3_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_02, 0x80240140), .bgName = "sbk3_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_03, 0x80240030), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_04, 0x80240AD0), .bgName = "sbk3_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_05, 0x80241ED0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_06, 0x80240020), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_07, 0x80240130), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_08, 0x80240930), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_09, 0x80240340), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_10, 0x80240DE0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_11, 0x802401A0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_12, 0x80240040), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_13, 0x80242080), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_14, 0x80241D70), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_16, 0x80240B20), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_18, 0x80240910), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(isk_19, 0x80240020), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
};

/// Koopa Bros. Fortress
#include "area_trd/trd.h"
MapConfig trd_maps[] = {
    { MAP(trd_00), .bgName = "nok_bg" },
    { MAP(trd_01), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP(trd_02), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP(trd_03), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP(trd_04), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP(trd_05), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP(trd_06), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP(trd_07), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP(trd_08), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP(trd_09), .bgName = "nok_bg" },
    { MAP(trd_10), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
};

/// Koopa Region
MapConfig nok_maps[] = {
    { MAP_UNSPLIT(nok_01, 0x80242B90), .bgName = "nok_bg" },
    { MAP_UNSPLIT(nok_02, 0x802445F0), .bgName = "nok_bg" },
    { MAP_UNSPLIT(nok_03, 0x80240E40), .bgName = "nok_bg" },
    { MAP_UNSPLIT(nok_04, 0x80240F40), .bgName = "nok_bg" },
    { MAP_UNSPLIT(nok_11, 0x80241F70), .bgName = "nok_bg" },
    { MAP_UNSPLIT(nok_12, 0x80242100), .bgName = "nok_bg" },
    { MAP_UNSPLIT(nok_13, 0x802414C0), .bgName = "nok_bg" },
    { MAP_UNSPLIT(nok_14, 0x80242440), .bgName = "nok_bg" },
    { MAP_UNSPLIT(nok_15, 0x802427D0), .bgName = "nok_bg" },
};

/// Star Region
MapConfig hos_maps[] = {
    { MAP_UNSPLIT(hos_00, 0x80240D50), .bgName = "nok_bg", .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(hos_01, 0x80240E40), .bgName = "hos_bg" },
    { MAP_UNSPLIT(hos_02, 0x80242B90), .bgName = "hos_bg" },
    { MAP_UNSPLIT(hos_03, 0x802435F0), .bgName = "hos_bg" },
    { MAP_UNSPLIT(hos_04, 0x80240EE0), .bgName = "hos_bg" },
    { MAP_UNSPLIT(hos_05, 0x80245910), .bgName = "hos_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(hos_06, 0x80242570), .bgName = "hos_bg" },
    { MAP_UNSPLIT(hos_10, 0x80240CE0), .bgName = "hos_bg", .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(hos_20, 0x80240390), .bgName = "hos_bg" },
};

/// Bowser's Castle
MapConfig kpa_maps[] = {
    { MAP_UNSPLIT(kpa_01,  0x80240A70), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_03,  0x80241EE0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_04,  0x80240190), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_08,  0x802414C0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_09,  0x80241310), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_10,  0x80240360), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_11,  0x80240B40), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_12,  0x802404A0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_13,  0x802404A0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_14,  0x802408A0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_15,  0x802405E0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_16,  0x802403B0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_17,  0x80240020), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_32,  0x80240350), .bgName = "kpa_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_33,  0x80240350), .bgName = "kpa_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_40,  0x80240040), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_41,  0x80240040), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_50,  0x80241A40), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_51,  0x80241C40), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(kpa_52,  0x80241360), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_53,  0x80240190), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(kpa_60,  0x80240450), .bgName = "kpa_bg" },
    { MAP_UNSPLIT(kpa_61,  0x80242360), .bgName = "kpa_bg" },
    { MAP_UNSPLIT(kpa_62,  0x80240430), .bgName = "kpa_bg" },
    { MAP_UNSPLIT(kpa_63,  0x802401B0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_70,  0x80240B10), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_81,  0x80240480), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(kpa_82,  0x80240460), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(kpa_83,  0x80240090), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(kpa_90,  0x80240020), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_91,  0x80241920), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_94,  0x80240020), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_95,  0x80241920), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_96,  0x80240040), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(kpa_100, 0x80240060), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(kpa_101, 0x80240060), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(kpa_102, 0x802435B0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_111, 0x802413E0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_112, 0x80240020), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_113, 0x80240AD0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_114, 0x80240070), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(kpa_115, 0x802413F0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_116, 0x80240020), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_117, 0x80240010), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(kpa_118, 0x80240020), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_119, 0x80240010), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(kpa_121, 0x80240020), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kpa_130, 0x80240760), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_133, 0x802404B0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kpa_134, 0x80240740), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
};

/// Peach's Castle Grounds
MapConfig osr_maps[] = {
    { MAP_UNSPLIT(osr_00, 0x802407E0), .bgName = "nok_bg" },
    { MAP_UNSPLIT(osr_01, 0x80240B00), .bgName = "nok_bg", .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(osr_02, 0x80240170), .bgName = "kpa_bg", .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(osr_03, 0x802403F0), .bgName = "kpa_bg", .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(osr_04, 0x802400D0), .bgName = "nok_bg", .init = (MapInit)0x80240000 },
};

/// Peach's Castle
/// @bug There are two entries for kkj_26; the latter is unreachable.
MapConfig kkj_maps[] = {
    { MAP_UNSPLIT(kkj_00, 0x80241030), .bgName = "nok_bg", .init = (MapInit)0x80240000, .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kkj_01, 0x80240F10), .bgName = "nok_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kkj_02, 0x80240030), .bgName = "nok_bg", .unk_1C = { .bytes = { .flags = 2 } } },
    { MAP_UNSPLIT(kkj_03, 0x80240360), .bgName = "nok_bg", .unk_1C = { .bytes = { .flags = 3 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(kkj_10, 0x80241120), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kkj_11, 0x80241160), .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } } },
    { MAP_UNSPLIT(kkj_12, 0x802408D0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kkj_13, 0x802407A0), .bgName = "kpa_bg",  .unk_1C = { .bytes = { .songVariation = 1, .flags = 3 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(kkj_14, 0x80240580), .bgName = "kpa_bg", .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(kkj_15, 0x80240640) },
    { MAP_UNSPLIT(kkj_16, 0x80241090), .unk_1C = { .bytes = { .flags = 1 } } },
    { MAP_UNSPLIT(kkj_17, 0x802405B0) },
    { MAP_UNSPLIT(kkj_18, 0x80240830), .bgName = "kpa_bg" },
    { MAP_UNSPLIT(kkj_19, 0x80240D20) },
    { MAP_UNSPLIT(kkj_20, 0x80240600) },
    { MAP_UNSPLIT(kkj_21, 0x80240010), .unk_1C = { .bytes = { .flags = 1 } } },
    { MAP_UNSPLIT(kkj_22, 0x80240020), .bgName = "kpa_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kkj_23, 0x802409F0), .bgName = "kpa_bg", .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(kkj_24, 0x80240040), .bgName = "kpa_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(kkj_25, 0x80240F50), .bgName = "kpa_bg", .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(kkj_26, 0x80240070), .bgName = "kpa_bg" },
    { MAP_UNSPLIT(kkj_26, 0x80240070), .unk_1C = { .bytes = { .flags = 2 } } },
    { MAP_UNSPLIT(kkj_27, 0x802404C0), .unk_1C = { .bytes = { .flags = 1 } } },
    { MAP_UNSPLIT(kkj_28, 0x80240010), .unk_1C = { .bytes = { .flags = 1 } } },
    { MAP_UNSPLIT(kkj_29, 0x80240080), .unk_1C = { .bytes = { .flags = 1 } } },
};

/// Jade Jungle
MapConfig jan_maps[] = {
    { MAP_UNSPLIT(jan_00, 0x80241BD0), .bgName = "yos_bg" },
    { MAP_UNSPLIT(jan_01, 0x802413F0), .bgName = "yos_bg" },
    { MAP_UNSPLIT(jan_02, 0x80242940), .bgName = "yos_bg" },
    { MAP_UNSPLIT(jan_03, 0x802432D0), .bgName = "yos_bg" },
    { MAP_UNSPLIT(jan_04, 0x80241140), .bgName = "yos_bg" },
    { MAP_UNSPLIT(jan_05, 0x80242710), .bgName = "yos_bg" },
    { MAP_UNSPLIT(jan_06, 0x80242620), .bgName = "jan_bg" },
    { MAP_UNSPLIT(jan_07, 0x80241230), .bgName = "yos_bg" },
    { MAP_UNSPLIT(jan_08, 0x80242460), .bgName = "yos_bg" },
    { MAP_UNSPLIT(jan_09, 0x80241960), .bgName = "yos_bg" },
    { MAP_UNSPLIT(jan_10, 0x80241750), .bgName = "yos_bg" },
    { MAP_UNSPLIT(jan_11, 0x80240810), .bgName = "jan_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(jan_12, 0x80241280), .bgName = "jan_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(jan_13, 0x802405F0), .bgName = "jan_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(jan_14, 0x80241300), .bgName = "jan_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(jan_15, 0x80240320), .bgName = "jan_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(jan_16, 0x80240590), .bgName = "jan_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(jan_17, 0x80240040), .bgName = "jan_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(jan_18, 0x80240020), .bgName = "yos_bg" },
    { MAP_UNSPLIT(jan_19, 0x80240040), .bgName = "jan_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(jan_22, 0x802419A0), .bgName = "jan_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(jan_23, 0x80240010), .bgName = "yos_bg" },
};

/// Forever Forest
#include "area_mim/mim.h"
MapConfig mim_maps[] = {
    { MAP(mim_01), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(mim_02), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(mim_03), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(mim_04), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(mim_05), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(mim_06), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(mim_07), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(mim_08), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(mim_09), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(mim_10), .bgName = "nok_bg" },
    { MAP(mim_11), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(mim_12), .bgName = "arn_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
};

/// Boo's Mansion
MapConfig obk_maps[] = {
    { MAP_UNSPLIT(obk_01, 0x802411B0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(obk_02, 0x802402E0), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(obk_03, 0x80241020), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(obk_04, 0x80240E90), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(obk_05, 0x802409F0), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(obk_06, 0x80240020), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(obk_07, 0x80241BA0), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(obk_08, 0x802417B0), .bgName = "obk_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(obk_09, 0x80240460), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
};

/// Gusty Gulch
#include "area_arn/arn.h"
MapConfig arn_maps[] = {
    { MAP(arn_02), .bgName = "arn_bg" },
    { MAP(arn_03), .bgName = "arn_bg" },
    { MAP(arn_04), .bgName = "arn_bg" },
    { MAP(arn_05), .bgName = "arn_bg" },
    { MAP(arn_07), .bgName = "arn_bg" },
    { MAP(arn_08), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP(arn_09), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP(arn_10), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP(arn_11), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP(arn_12), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP(arn_13), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
};

/// Tubba Blubba's Castle
MapConfig dgb_maps[] = {
    { MAP_UNSPLIT(dgb_00, 0x802400D0), .bgName = "arn_bg", .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(dgb_01, 0x80243460), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_02, 0x80241470), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_03, 0x80242830), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_04, 0x80243130), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_05, 0x802414A0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_06, 0x802402E0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_07, 0x80241450), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_08, 0x80243CB0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_09, 0x80243840), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_10, 0x80240210), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_11, 0x80240090), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_12, 0x802402D0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_13, 0x80240010), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_14, 0x80240020), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_15, 0x802418A0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_16, 0x80241440), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_17, 0x80240020), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(dgb_18, 0x80241280), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
};

/// Mt. Lavalava
#include "area_kzn/kzn.h"
MapConfig kzn_maps[] = {
    { MAP(kzn_01), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_02), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_03), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_04), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_05), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_06), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_07), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_08), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_09), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_10), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_11), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_17), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_18), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_19), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_20), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_22), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP(kzn_23), .bgName = "yos_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
};

/// Flower Fields
MapConfig flo_maps[] = {
    { MAP_UNSPLIT(flo_00, 0x80241490), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_03, 0x80240660), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_07, 0x80240760), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_08, 0x80241F00), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_09, 0x80241840), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_10, 0x802414A0), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_11, 0x802403A0), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_12, 0x80240710), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_13, 0x80243690), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_14, 0x802423B0), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_15, 0x80240020), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_16, 0x80242990), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_17, 0x80243240), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_18, 0x802407F0), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_19, 0x80240980), .bgName = "sra_bg" },
    { MAP_UNSPLIT(flo_21, 0x80240D00), .bgName = "sra_bg" },
    { MAP_UNSPLIT(flo_22, 0x802402A0), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_23, 0x80240CF0), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_24, 0x802405C0), .bgName = "fla_bg" },
    { MAP_UNSPLIT(flo_25, 0x802422F0), .bgName = "fla_bg" },
};

/// Shiver Region
MapConfig sam_maps[] = {
    { MAP_UNSPLIT(sam_01, 0x80241F70), .bgName = "yki_bg" },
    { MAP_UNSPLIT(sam_02, 0x80241C00), .bgName = "yki_bg" },
    { MAP_UNSPLIT(sam_03, 0x80240940), .bgName = "yki_bg" },
    { MAP_UNSPLIT(sam_04, 0x80240740), .bgName = "yki_bg" },
    { MAP_UNSPLIT(sam_05, 0x80241D60), .bgName = "sam_bg" },
    { MAP_UNSPLIT(sam_06, 0x80242630), .bgName = "sam_bg" },
    { MAP_UNSPLIT(sam_07, 0x80242020), .bgName = "yki_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(sam_08, 0x802417D0), .bgName = "yki_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(sam_09, 0x80240420), .bgName = "yki_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(sam_10, 0x80240CE0), .bgName = "yki_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(sam_11, 0x802421A0), .bgName = "yki_bg" },
    { MAP_UNSPLIT(sam_12, 0x802403B0), .bgName = "yki_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
};

/// Crystal Palace
MapConfig pra_maps[] = {
    { MAP_UNSPLIT(pra_01, 0x80241400), .bgName = "yki_bg", .unk_1C = { .bytes = { .flags = 1 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_02, 0x802416C0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_03, 0x802401E0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_04, 0x80240970), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_05, 0x802411F0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_06, 0x80240F60), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_09, 0x80241670), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_10, 0x802416D0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_11, 0x802411F0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_12, 0x80241220), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_13, 0x80241620), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_14, 0x80241200), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_15, 0x80240050), .bgName = "yki_bg", .init = (MapInit)0x80240000, .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(pra_16, 0x80240F60), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_18, 0x80240F50), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_19, 0x802419D0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_20, 0x80240F70), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_21, 0x80240140), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_22, 0x802402F0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_27, 0x80241220), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_28, 0x80241220), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_29, 0x802412C0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_31, 0x802410E0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_32, 0x80240850), .bgName = "sam_bg", .init = (MapInit)0x80240000, .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } } },
    { MAP_UNSPLIT(pra_33, 0x802410C0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_34, 0x80241040), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_35, 0x80242C40), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_36, 0x80240F70), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_37, 0x80241840), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_38, 0x80241700), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_39, 0x80241700), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } }, .init = (MapInit)0x80240000 },
    { MAP_UNSPLIT(pra_40, 0x80240F40), .unk_1C = { .bytes = { .songVariation = 1, .flags = 1 } }, .init = (MapInit)0x80240000 },
};

/// Shy Guy's Toy Box
MapConfig omo_maps[] = {
    { MAP_UNSPLIT(omo_01, 0x80240C40), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_02, 0x80242BD0), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_03, 0x80240900), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_04, 0x80241F30), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_05, 0x80242440), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_06, 0x80240B80), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_07, 0x80243310), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_08, 0x80240E10), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_09, 0x80243700), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_10, 0x802408B0), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_11, 0x802414F0), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_12, 0x802404D0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_13, 0x80241510), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_14, 0x802405E0), .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_15, 0x80240810), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_16, 0x80240620), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
    { MAP_UNSPLIT(omo_17, 0x80243770), .bgName = "omo_bg", .unk_1C = { .bytes = { .songVariation = 1, .flags = 2 } } },
};

/// Debug
#include "area_tst/tst.h"
MapConfig tst_maps[] = {
    { MAP(tst_01), .bgName = "nok_bg" },
    { MAP(tst_02), .bgName = "nok_bg" },
    { MAP(tst_03), .bgName = "nok_bg" },
    { MAP(tst_04), .bgName = "nok_bg" },
    { MAP(tst_10), .bgName = "nok_bg" },
    { MAP(tst_11), .bgName = "nok_bg" },
    { MAP(tst_12), .bgName = "nok_bg" },
    { MAP(tst_13), .bgName = "nok_bg" },
    { MAP(tst_20), .bgName = "nok_bg" },
};

/// Credits
#include "area_end/end.h"
MapConfig end_maps[] = {
    { MAP_WITH_INIT(end_00) },
    { MAP_WITH_INIT(end_01) },
};

/// Toad Town Playroom
#include "area_mgm/mgm.h"
MapConfig mgm_maps[] = {
    { MAP(mgm_00) },
    { MAP(mgm_01) },
    { MAP(mgm_02) },
    { MAP(mgm_03) },
};

/// Game Over
#include "area_gv/gv.h"
MapConfig gv_maps[] = {
    { MAP(gv_01) },
};

AreaConfig gAreas[] = {
    AREA(kmr, "クリむら"),  // kuri mura [kuribou village, Goomba Village]
    AREA(mac, "まち"),  // machi [town, Toad Town]
    AREA(tik, "まちのちか"),  // machi no chika [under the town, Toad Town Tunnels]
    AREA(kgr, "くじらのなか"),  // kujira no naka [inside the whale]
    AREA(kkj, "きのこ城"),  // kinoko shiro [mushroom castle, Princess Peach's Castle]
    AREA(hos, "星ふる丘"),  // hoshi furu oka [star fall hill, Shooting Star Summit]
    AREA(nok, "ノコノコむら"),  // nokonoko mura [nokonoko village, Koopa Village]
    AREA(trd, "とりで"),  // toride [fortress, Koopa Bros. Fortress]
    AREA(iwa, "岩山"),  // iwayama [rock mountain, Mt. Rugged]
    AREA(dro, "カラカラタウン"),  // karakara taun [dried up town, Dry Dry Outpost]
    AREA(sbk, "カラカラ砂漠"),  // karakara sabaku [dried up desert, Dry Dry Desert]
    AREA(isk, "カラカラいせき"),  // karakara iseki [dried up ruins, Dry Dry Ruins]
    AREA(mim, "迷いの森"),  // mayoi no mori [lost forest, Forever Forest]
    AREA(obk, "テレサハウス"),  // teresa hausu [teresa house, Boo's Mansion]
    AREA(arn, "あれの"),  // areno [wasteland, Gusty Gulch]
    AREA(dgb, "ドガボンの城"),  // dogabon no shiro [dogabon's castle, Tubba Blubba's Castle]
    AREA(omo, "ヘイホーのおもちゃばこ"),  // heiho no omochabako [heiho's toy box, Shy Guy's Toy Box]
    AREA(jan, "ジャングル"),  // janguru [jungle, Jade Jungle]
    AREA(kzn, "火山"),  // kazan [volcano, Mt. Lavalava]
    AREA(flo, "フラワーランド"),  // furawaa rando [flower land, Flower Fields]
    AREA(sam, "さむいさむい村"),  // samui samui mura [cold cold village, Shiver City]
    AREA(pra, "パラレルきゅうでん"),  // parareru kyuuden [parallel palace, Crystal Palace]
    AREA(kpa, "クッパ城"),  // kuppa shiro [koopa's castle, Bowser's Castle]
    AREA(osr, "きのこ城そと"),  // kinoko shiro soto [outside mushroom castle, Outside Peach's Castle]
    AREA(end, "エンディング"),  // endingu [Ending]
    AREA(mgm, "ミニゲーム"),  // minige-mu [Minigames]
    AREA(gv, "ゲームオーバー"),  // ge-mu o-ba- [Game Over]
    AREA(tst, "テストマップ"),  // tesuto mappu [Test map]
    {},
};

const f32 world_rodata_alignment = 0.0f;
