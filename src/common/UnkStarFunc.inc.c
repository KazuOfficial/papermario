#include "common.h"

ApiStatus N(UnkStarFunc)(Evt* script, s32 isInitialCall) {
    PlayerData* playerData = &gPlayerData;
    Bytecode* args = script->ptrReadPos;

    set_animation(ACTOR_PARTNER, 0, D_8029C890[playerData->currentPartner][evt_get_variable(script, *args++)]);

    return ApiStatus_DONE2;
}
