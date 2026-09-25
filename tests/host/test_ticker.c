#include "ticker.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>
static disease_t d;
static counts_t counts[REGION_COUNT];
static void fresh(void) { memset(&d,0,sizeof(d)); TickerInit(&d); }
static void advance(void) { (void)TickerText(); TickerPrepare(100); TickerUpdate(5*TICKER_HZ); }
int main(void) {
 unsigned i,j;
 fresh();assert(TickerPost(NEWS_SPORE,0,0));assert(!TickerPost(NEWS_SPORE,0,0));
 for(i=1;i<8;i++)assert(TickerPost(NEWS_REACHED,0,i));
 assert(!TickerPost(NEWS_REACHED,0,8));assert(TickerPost(NEWS_DISCOVERY,0,0));
 assert(ticker.count==8 && ticker.queue[0].kind==NEWS_SPORE && ticker.queue[1].value==2);
 advance();assert(ticker.queue[0].kind==NEWS_DISCOVERY);advance();assert(ticker.queue[0].value==2);
 fresh();for(i=0;i<8;i++)assert(TickerPost(NEWS_CLOSURE,0,i+2));
 assert(!TickerPost(NEWS_DISCOVERY,0,0));assert(!TickerPost(NEWS_SPORE,0,0));
 fresh();TickerPost(NEWS_REGION,0,0);TickerPost(NEWS_CURE,0,25);TickerPost(NEWS_CURE,0,75);
 TickerPost(NEWS_CURE,0,50);assert(ticker.count==2 && ticker.queue[1].value==75);
 advance();assert(ticker.queue[0].value==75);TickerPost(NEWS_CURE,0,90);
 assert(ticker.count==2 && ticker.queue[0].value==75); /* Current text is immutable. */
 fresh();TickerPost(NEWS_DISCOVERY,0,0);(void)TickerText();TickerPrepare(312);
 TickerUpdate(5*TICKER_HZ-1);assert(ticker.count==1 && TickerOffset()==0);
 TickerUpdate(1);assert(ticker.count==0);
 TickerPost(NEWS_HEALTHY,4,0);(void)TickerText();TickerPrepare(360);
 TickerUpdate(TICKER_HZ);assert(TickerOffset()==0);
 TickerUpdate(TICKER_HZ);assert(TickerOffset()==24);
 TickerUpdate(TICKER_HZ);assert(TickerOffset()==48 && ticker.count==1);
 TickerUpdate(TICKER_HZ-1);assert(ticker.count==1);TickerUpdate(1);assert(!ticker.count);
 TickerPost(NEWS_DISCOVERY,0,0);(void)TickerText();TickerPrepare(100);TickerUpdate(UINT32_MAX);assert(!ticker.count);
 for(i=0;i<NEWS_COUNT;i++)for(j=0;j<TRAIT_COUNT;j++) {
  fresh();if(TickerPost((news_kind_t)i,j,100)) {
   assert(strlen(TickerText())<sizeof(ticker.text));
   assert(strchr(ticker.text,':'));TickerPrepare(400);assert(TickerText()==ticker.text);
  }
 }
 fresh();d.started=1;d.cycles=1;d.seen_regions=5;d.affected_rewards=63;d.death_rewards=7;
 TickerObserve(&d,counts);assert(ticker.count==4);
 assert(ticker.queue[0].kind==NEWS_AFFECTED && ticker.queue[0].value==50);
 assert(ticker.queue[1].kind==NEWS_DEATH && ticker.queue[1].value==25);
 TickerObserve(&d,counts);assert(ticker.count==4);
 TickerInit(&d);TickerObserve(&d,counts);assert(!ticker.count); /* Load never replays milestones. */
 counts[4].healthy=100;d.type=FUNGUS;d.cycles=8;d.response=RESEARCH;d.cure=1234;
 for(i=0;i<4;i++) {
  TickerObserve(&d,counts);assert(ticker.count==1 && ticker.queue[0].kind==NEWS_REACHED+i);
  advance();d.cycles+=8;
 }
 fresh();memset(counts,0,sizeof(counts));d.started=1;d.seen_regions=1;d.cycles=8;TickerInit(&d);
 TickerObserve(&d,counts);assert(ticker.count==1);advance();d.cycles+=8;
 TickerObserve(&d,counts);assert(!ticker.count); /* Only eligible report cannot repeat. */
 d.cycles=17;TickerObserve(&d,counts);assert(!ticker.count);
 fresh();assert(!ticker.count && !ticker.elapsed && !ticker.prepared);
 puts("PASS: ticker priority/overflow, duplicates, cure coalescing, timing/scroll, bounded text, milestones, quiet rotation, reset/load");
 return 0;
}
