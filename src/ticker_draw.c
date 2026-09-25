#include "ticker.h"
#include <graphx.h>
void TickerRender(void) {
 const char *text=TickerText();
 if(!ticker.count) return;
 if(!ticker.prepared) TickerPrepare(gfx_GetStringWidth(text));
 gfx_SetClipRegion(4,20,316,29); gfx_SetTextConfig(gfx_text_clip);
 gfx_SetTextFGColor(TickerPriority(ticker.queue[0])==2?224:255);
 gfx_PrintStringXY(text,4-(int)TickerOffset(),20);
 gfx_SetTextConfig(gfx_text_noclip); gfx_SetClipRegion(0,0,320,240);
 gfx_SetTextFGColor(255);
}
