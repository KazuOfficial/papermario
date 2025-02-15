#include "common.h"
#include "effects_internal.h"

void shattering_stones_appendGfx(void* effect);

INCLUDE_ASM(s32, "effects/shattering_stones", shattering_stones_main);

void shattering_stones_init(void) {
}

INCLUDE_ASM(s32, "effects/shattering_stones", shattering_stones_update);

void shattering_stones_render(EffectInstance* effect) {
    RenderTask renderTask;
    RenderTask* retTask;

    renderTask.appendGfx = shattering_stones_appendGfx;
    renderTask.appendGfxArg = effect;
    renderTask.distance = 0;
    renderTask.renderMode = RENDER_MODE_2D;

    retTask = shim_queue_render_task(&renderTask);
    retTask->renderMode |= RENDER_TASK_FLAG_2;
}

INCLUDE_ASM(s32, "effects/shattering_stones", shattering_stones_appendGfx);
