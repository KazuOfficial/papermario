#include "common.h"
#include "effects_internal.h"

void music_note_appendGfx(void* effect);
void music_note_init(EffectInstance* effect);
void music_note_update(EffectInstance* effect);
void music_note_render(EffectInstance* effect);

extern Gfx D_09001038_35B618[];
extern Gfx D_090010C0_35B6A0[];
extern Gfx D_09001148_35B728[];
extern Gfx D_090011D0_35B7B0[];
extern Gfx D_09001258_35B838[];
extern Gfx D_090012E0_35B8C0[];
extern Gfx D_09001368_35B948[];

Gfx* D_E004C660[] = { D_09001038_35B618, D_090010C0_35B6A0, D_09001148_35B728, D_090011D0_35B7B0,
                      D_09001258_35B838, D_090012E0_35B8C0, D_09001368_35B948 };

s8 D_E004C67C[] = { 0xFE, 0xAC, 0xAC, 0xFE, 0xAC, 0xD5, 0xFE, 0xB4, 0x9A, 0xD5, 0xB4, 0xFE, 0xB4, 0xB4, 0xFE, 0xB4, 0xDD, 0xFE, 0xB4, 0xFE, 0xFE, 0xB4, 0xFE, 0xD5, 0xB4, 0xFE, 0xB4, 0xD5, 0xFE, 0xB4, 0xFE, 0xFE, 0xB4, 0xFE, 0xD5, 0xAC, };

void music_note_main(s32 arg0, f32 arg1, f32 arg2, f32 arg3) {
    EffectBlueprint bp;
    EffectBlueprint* bpPtr = &bp;
    EffectInstance* effect;
    MusicNoteFXData* part;
    s32 numParts = 1;
    s32 randInt;

    bp.unk_00 = 0;
    bp.init = music_note_init;
    bp.update = music_note_update;
    bp.renderWorld = music_note_render;
    bp.unk_14 = 0;
    bp.effectID = EFFECT_MUSIC_NOTE;

    effect = shim_create_effect_instance(bpPtr);
    effect->numParts = numParts;

    part = effect->data.musicNote = shim_general_heap_malloc(numParts * sizeof(*part));

    ASSERT(effect->data.musicNote != NULL);

    part->unk_00 = arg0;
    part->pos.x = arg1;
    part->pos.y = arg2;
    part->pos.z = arg3;
    part->unk_10 = 0;
    part->timeLeft = 0x40;
    part->unk_14 = 0;
    part->unk_1C = 0;
    part->unk_20 = shim_rand_int(6);
    switch (arg0) {
        case 0:
            part->unk_24 = 0.0f;
            part->unk_28 = 1.0f;
            part->unk_2C = 0;
            part->unk_30 = 1.0f;
            break;
        case 1:
            randInt = shim_rand_int(10);
            part->unk_24 = (randInt * 0.1) + -5.0;
            part->unk_28 = (shim_rand_int(10) * 0.1) + 0.5;
            part->unk_2C = 0;
            part->unk_30 = 0.0f;
            break;
        default:
            randInt = shim_rand_int(10);
            part->unk_24 = 5.0 - (randInt * 0.1);
            part->unk_28 = (shim_rand_int(10) * 0.1) + 1.0;
            part->unk_2C = 0;
            part->unk_30 = 0.0f;
            break;
    }
}

void music_note_init(EffectInstance* effect) {
}

void music_note_update(EffectInstance* effect) {
    MusicNoteFXData* part = effect->data.musicNote;
    s32 timeLeft;

    part->timeLeft--;
    part->unk_1C++;
    timeLeft = part->timeLeft;
    if (timeLeft < 0) {
        shim_remove_effect(effect);
        return;
    }
    if (timeLeft >= 6) {
        part->unk_14 += (255 - part->unk_14) * 0.3;
        part->unk_10 += (1.0f - part->unk_10) * 0.3;
    }
    if (timeLeft < 10) {
        part->unk_14 = timeLeft * 25;
    }
    part->pos.x += part->unk_24;
    part->pos.y += part->unk_28;
    part->unk_24 += (part->unk_2C - part->unk_24) * 0.04;
    part->unk_28 += (part->unk_30 - part->unk_28) * 0.04;
}

void music_note_render(EffectInstance* effect) {
    RenderTask renderTask;
    RenderTask* retTask;

    renderTask.appendGfx = music_note_appendGfx;
    renderTask.appendGfxArg = effect;
    renderTask.distance = 0;
    renderTask.renderMode = RENDER_MODE_2D;

    retTask = shim_queue_render_task(&renderTask);
    retTask->renderMode |= RENDER_TASK_FLAG_2;
}

INCLUDE_ASM(s32, "effects/music_note", music_note_appendGfx);
