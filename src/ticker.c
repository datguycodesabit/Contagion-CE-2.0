#include "ticker.h"
#include <stdio.h>
#include <string.h>
ticker_t ticker;
static const char * const regions[]={"Africa","Asia","Europe","Greenland","North America","South America","Oceania"};
static bool Same(news_event_t a,news_event_t b) {
 return a.kind==b.kind && a.subject==b.subject && a.value==b.value;
}
uint8_t TickerPriority(news_event_t e) {
 if(e.kind<=NEWS_CLOSURE || e.kind==NEWS_DEATH) return 2;
 return e.kind<NEWS_REACHED?1:0;
}
void TickerInit(const disease_t *d) {
 memset(&ticker,0,sizeof(ticker));
 ticker.seen=d->seen_regions; ticker.affected=d->affected_rewards; ticker.deaths=d->death_rewards;
 ticker.last_report.kind=NEWS_COUNT;
}
static void Remove(uint8_t index) {
 uint8_t i;
 for(i=index;i+1<ticker.count;i++) ticker.queue[i]=ticker.queue[i+1];
 ticker.count--;
}
bool TickerPost(news_kind_t kind,uint8_t subject,uint16_t value) {
 news_event_t event={(uint8_t)kind,subject,value}; uint8_t i;
 if(kind>=NEWS_COUNT) return false;
 if((kind==NEWS_REGION || kind==NEWS_SPORE || kind==NEWS_HEALTHY || (kind==NEWS_CLOSURE && value==1)) && subject>=REGION_COUNT) return false;
 if(kind==NEWS_MUTATION && subject>=TRAIT_COUNT) return false;
 for(i=0;i<ticker.count;i++) {
  if(Same(ticker.queue[i],event)) return false;
  if(i && kind==NEWS_CURE && ticker.queue[i].kind==NEWS_CURE) {
   if(value>ticker.queue[i].value) ticker.queue[i]=event;
   return true;
  }
 }
 if(ticker.count==TICKER_SLOTS) {
  for(i=1;i<ticker.count;i++) if(TickerPriority(ticker.queue[i])<TickerPriority(event)) break;
  if(i==ticker.count) return false;
  Remove(i);
 }
 ticker.queue[ticker.count++]=event;
 return true;
}
const char *TickerText(void) {
 news_event_t e;
 if(!ticker.count) return "";
 if(ticker.prepared) return ticker.text;
 e=ticker.queue[0];
 switch(e.kind) {
 case NEWS_DISCOVERY: snprintf(ticker.text,sizeof(ticker.text),"ALERT: Outbreak discovered."); break;
 case NEWS_RESEARCH: snprintf(ticker.text,sizeof(ticker.text),"ALERT: Cure research has begun."); break;
 case NEWS_RESPONSE: snprintf(ticker.text,sizeof(ticker.text),"ALERT: Public response is escalating."); break;
 case NEWS_CURE: snprintf(ticker.text,sizeof(ticker.text),"ALERT: Cure reaches %u%%.",e.value); break;
 case NEWS_CLOSURE:
  if(e.value==1) snprintf(ticker.text,sizeof(ticker.text),"ALERT: %s restricts travel.",regions[e.subject]);
  else snprintf(ticker.text,sizeof(ticker.text),"ALERT: %u regions restrict travel.",e.value);
  break;
 case NEWS_MUTATION: snprintf(ticker.text,sizeof(ticker.text),"FIELD: Mutation: %s.",traits[e.subject].name); break;
 case NEWS_SPORE: snprintf(ticker.text,sizeof(ticker.text),"FIELD: Spore burst seeds %s.",regions[e.subject]); break;
 case NEWS_REGION: snprintf(ticker.text,sizeof(ticker.text),"FIELD: First infection reaches %s.",regions[e.subject]); break;
 case NEWS_AFFECTED:
  if(e.value==50) snprintf(ticker.text,sizeof(ticker.text),"WORLD: Half of all land affected.");
  else snprintf(ticker.text,sizeof(ticker.text),"WORLD: %u%% of all land affected.",e.value);
  break;
 case NEWS_DEATH: snprintf(ticker.text,sizeof(ticker.text),"ALERT: Deaths reach %u%% worldwide.",e.value); break;
 case NEWS_REACHED: snprintf(ticker.text,sizeof(ticker.text),"WORLD: Infection has reached %u of 7 regions.",e.value); break;
 case NEWS_HEALTHY: snprintf(ticker.text,sizeof(ticker.text),"WORLD: Most healthy land remains in %s.",regions[e.subject]); break;
 case NEWS_PROGRESS: snprintf(ticker.text,sizeof(ticker.text),"WORLD: Cure research stands at %u.%02u%%.",e.value/100,e.value%100); break;
 case NEWS_CHARGES: snprintf(ticker.text,sizeof(ticker.text),"FIELD: Fungus has %u spore charges remaining.",e.value); break;
 default: ticker.text[0]=0; break;
 }
 return ticker.text;
}
void TickerPrepare(uint16_t width) {
 if(!ticker.count || ticker.prepared) return;
 ticker.width=width; ticker.elapsed=0;
 ticker.duration=width<=TICKER_WIDTH?5*TICKER_HZ:
  2*TICKER_HZ+((uint32_t)(width-TICKER_WIDTH)*TICKER_HZ+23)/24;
 ticker.prepared=true;
}
void TickerUpdate(uint32_t elapsed) {
 uint8_t i,best=0; news_event_t next;
 if(!ticker.count || !ticker.prepared) return;
 if(elapsed<ticker.duration-ticker.elapsed) { ticker.elapsed+=elapsed; return; }
 Remove(0); ticker.prepared=false; ticker.elapsed=0;
 /* Highest priority next, FIFO within a priority. Never preempt current text. */
 for(i=1;i<ticker.count;i++) if(TickerPriority(ticker.queue[i])>TickerPriority(ticker.queue[best])) best=i;
 if(ticker.count && best) {
  next=ticker.queue[best]; for(i=best;i;i--) ticker.queue[i]=ticker.queue[i-1]; ticker.queue[0]=next;
 }
}
uint16_t TickerOffset(void) {
 uint32_t offset;
 if(!ticker.prepared || ticker.width<=TICKER_WIDTH || ticker.elapsed<=TICKER_HZ) return 0;
 offset=(ticker.elapsed-TICKER_HZ)*24/TICKER_HZ;
 return offset>ticker.width-TICKER_WIDTH?ticker.width-TICKER_WIDTH:(uint16_t)offset;
}
void TickerObserve(const disease_t *d,const counts_t counts[REGION_COUNT]) {
 static const uint8_t affected[]={1,5,10,20,35,50,70,90,100},deaths[]={1,10,25,50,75,90};
 uint8_t i,reached=0,best=0; news_event_t report;
 uint16_t changed=d->affected_rewards&~ticker.affected;
 for(i=9;i;i--) if(changed&(1U<<(i-1))) { TickerPost(NEWS_AFFECTED,0,affected[i-1]); break; }
 changed=d->death_rewards&~ticker.deaths;
 for(i=6;i;i--) if(changed&(1U<<(i-1))) { TickerPost(NEWS_DEATH,0,deaths[i-1]); break; }
 for(i=0;i<REGION_COUNT;i++) {
  if((d->seen_regions&~ticker.seen)&(1U<<i)) TickerPost(NEWS_REGION,i,0);
  if(d->seen_regions&(1U<<i)) reached++;
  if(counts[i].healthy>counts[best].healthy) best=i;
 }
 ticker.seen=d->seen_regions; ticker.affected=d->affected_rewards; ticker.deaths=d->death_rewards;
 if(ticker.count || !d->started || d->result!=PLAYING || !d->cycles || d->cycles%8) return;
 for(i=0;i<4;i++) {
  uint8_t choice=ticker.rotation; ticker.rotation=(ticker.rotation+1)%4;
  report.subject=0; report.value=0;
  if(choice==0) { if(!reached) continue; report.kind=NEWS_REACHED; report.value=reached; }
  else if(choice==1) { if(!counts[best].healthy) continue; report.kind=NEWS_HEALTHY; report.subject=best; }
  else if(choice==2) { if(d->response<RESEARCH) continue; report.kind=NEWS_PROGRESS; report.value=d->cure; }
  else { if(d->type!=FUNGUS) continue; report.kind=NEWS_CHARGES; report.value=3-d->spores_used; }
  if(!Same(report,ticker.last_report) && TickerPost((news_kind_t)report.kind,report.subject,report.value)) { ticker.last_report=report; break; }
 }
}
