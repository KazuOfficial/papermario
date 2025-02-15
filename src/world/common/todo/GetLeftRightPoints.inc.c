#include "common.h"
#include "npc.h"

ApiStatus N(GetLeftRightPoints)(Evt* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    s32 posX = evt_get_variable(script, *args++);
    s32 posZ = evt_get_variable(script, *args++);
    f32 dist = evt_get_variable(script, *args++);

    script->varTable[0] = posX + (sin_deg(gCameras[CAM_DEFAULT].currentYaw + 270.0f + dist) * 100.0f);
    script->varTable[1] = posZ - (cos_deg(gCameras[CAM_DEFAULT].currentYaw + 270.0f + dist) * 100.0f);
    script->varTable[2] = posX + (sin_deg(gCameras[CAM_DEFAULT].currentYaw + 90.0f + dist) * 100.0f);
    script->varTable[3] = posZ - (cos_deg(gCameras[CAM_DEFAULT].currentYaw + 90.0f + dist) * 100.0f);
    return ApiStatus_DONE2;
}
