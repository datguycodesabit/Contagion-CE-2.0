/* Development-only rendering fixture, never shipped. Uses production UI/timing. */
#define main contagion_game_main
#include "../../src/main.c"
#undef main
volatile uint16_t ticker_test_kind,ticker_test_offset,ticker_test_width;
volatile uint32_t ticker_test_elapsed;
int main(void) {
 uint8_t kind,subject; uint16_t longest=0; news_event_t longest_event={NEWS_HEALTHY,4,0};
 gfx_Begin();gfx_SetDrawBuffer();InitializeMap();ResetGameState();
 gfx_SetTransparentColor(0);gfx_SetTextTransparentColor(0);gfx_SetTextBGColor(0);
 disease.type=FUNGUS;disease.started=1;SeedRegion(region,&disease,0,GameRandom);
 /* Find the widest supported factual headline using the actual GraphX font. */
 for(kind=0;kind<NEWS_COUNT;kind++) for(subject=0;subject<TRAIT_COUNT;subject++) {
  uint16_t width;TickerInit(&disease);
  if(!TickerPost((news_kind_t)kind,subject,kind==NEWS_CLOSURE?1:100))continue;
  width=gfx_GetStringWidth(TickerText());
  if(width>longest) { longest=width;longest_event=ticker.queue[0]; }
 }
 TickerInit(&disease);TickerPost(NEWS_DISCOVERY,0,0);
 TickerPost((news_kind_t)longest_event.kind,longest_event.subject,longest_event.value);
 TickerPost(NEWS_RESEARCH,0,0); /* Must precede the waiting non-urgent headline. */
 ReleaseKeys();timer_Control=TIMER1_ENABLE|TIMER1_32K|TIMER1_UP;timer_1_Counter=0;
 for(;;) {
  uint8_t key=ReadKey();
  if(key==KEY_ENTER) ActionsMenu();
  DrawMap();RenderHUD();gfx_SwapDraw();
  ticker_test_kind=ticker.count?ticker.queue[0].kind:255;
  ticker_test_elapsed=ticker.elapsed;ticker_test_offset=TickerOffset();ticker_test_width=ticker.width;
  TickerUpdate(timer_1_Counter);timer_1_Counter=0;
 }
}
