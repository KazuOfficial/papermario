#ifndef BATTLE_ITEM_FRIGHT_JAR
#define BATTLE_ITEM_FRIGHT_JAR

#include "common.h"
#include "script_api/battle.h"

#undef NAMESPACE
#define NAMESPACE battle_item_fright_jar

ApiStatus N(FadeBackgroundToBlack)(Evt* script, s32 isInitialCall);
ApiStatus N(func_802A12D4_72BBE4)(Evt* script, s32 isInitialCall);

extern EvtScript N(UseItemWithEffect);
extern EvtScript N(PlayerGoHome);

#endif
