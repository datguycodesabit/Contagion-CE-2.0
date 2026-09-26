#include "events.h"
#include "ticker.h"
#include "world.h"
#include "sprites/sprites.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static disease_t disease;
static counts_t counts[REGION_COUNT];
static uint32_t game_rng=UINT32_C(0x13579bdf),game_random_calls;
static unsigned notices_started,notices_ended;
static uint8_t last_notice_id,last_notice_region;
static bool last_notice_ended;

static uint16_t GameRandom(uint16_t n) {
 assert(n);game_random_calls++;game_rng=game_rng*UINT32_C(1664525)+UINT32_C(1013904223);
 return (uint16_t)((game_rng>>8)%n);
}
static void Notice(uint8_t id,uint8_t region,bool ended) {
 last_notice_id=id;last_notice_region=region;last_notice_ended=ended;
 if(ended)notices_ended++;else notices_started++;
}
static void Mark(event_state_t *s,uint8_t id) {
 assert(id<WORLD_EVENT_COUNT);s->occurred[id/8]|=(uint8_t)(1U<<(id%8));
}
static void Own(disease_t *d,uint8_t id) {
 assert(id<TRAIT_COUNT);d->owned[id/32]|=UINT32_C(1)<<(id%32);
}
static void SetupDisease(void) {
 ResetDisease(&disease);disease.started=1;disease.result=PLAYING;disease.type=BACTERIA;
}
static void SetupCounts(void) {
 unsigned i;for(i=0;i<REGION_COUNT;i++)counts[i]=(counts_t){500,500,0};
}
static uint8_t FindKind(uint8_t kind) {
 unsigned i,j;for(i=0;i<WORLD_EVENT_COUNT;i++)for(j=0;j<2;j++)
  if(event_catalog[i].effect[j].kind==kind&&event_catalog[i].effect[j].amount)return (uint8_t)i;
 assert(!"catalog lacks a required effect kind");return EVENT_NONE;
}
static uint8_t FindStandalone(void) {
 unsigned i;for(i=0;i<100;i++)if(event_catalog[i].chain==EVENT_NONE)return (uint8_t)i;
 assert(!"catalog lacks a standalone event");return EVENT_NONE;
}
static uint8_t FindChainPhase(uint8_t chain,uint8_t phase) {
 unsigned i;for(i=100;i<WORLD_EVENT_COUNT;i++)
  if(event_catalog[i].chain==chain&&(i-100)%5==phase)return (uint8_t)i;
 return EVENT_NONE;
}
static uint8_t FindAnyChainPhase0(uint8_t *chain) {
 unsigned i;for(i=100;i<WORLD_EVENT_COUNT;i++)if((i-100)%5==0&&event_catalog[i].chain!=EVENT_NONE) {
  *chain=event_catalog[i].chain;return (uint8_t)i;
 }
 assert(!"catalog lacks a storyline");return EVENT_NONE;
}
static void SetActive(event_state_t *s,uint8_t slot,uint8_t id,uint8_t region,uint8_t remaining) {
 assert(slot<WORLD_EVENT_SLOTS&&id<WORLD_EVENT_COUNT&&region<REGION_COUNT);
 s->active[slot]=(active_event_t){id,region,remaining};Mark(s,id);
}
static int ActiveSlot(const event_state_t *s) {
 unsigned i;for(i=0;i<WORLD_EVENT_SLOTS;i++)if(s->active[i].id!=EVENT_NONE)return (int)i;
 return -1;
}
static void ApplyOne(uint8_t id,const disease_t *d,const counts_t c[REGION_COUNT],effects_t *e,event_modifiers_t *m) {
 event_state_t s;EventsInit(&s,d,9);s.active[0]=(active_event_t){id,0,16};
 CalculateEffects(d,e);EventsApply(&s,d,c,e,m);
}
static uint16_t Band(int32_t n,uint16_t lo,uint16_t hi) {
 return n<lo?lo:n>hi?hi:(uint16_t)n;
}
static void ExpectedModifiers(const event_def_t *def,const disease_t *d,const counts_t c[REGION_COUNT],
                              const effects_t *base,uint8_t kind,uint8_t region,
                              uint16_t *expected,uint8_t *blocked) {
 int32_t delta=0;uint16_t land=0;unsigned i;
 for(i=0;i<REGION_COUNT;i++)land+=LandCount(c[i]);*blocked=0;
 for(i=0;i<2;i++) {
  const event_effect_t *f=&def->effect[i];int16_t amount;
  if((region!=0 && kind!=EV_DISCOVERY && kind!=EV_RESEARCH)||f->kind!=kind||!f->amount||(f->trait!=EVENT_NONE&&!Owns(d,f->trait)))continue;
  amount=EventAmount(def,f,d);
  if(kind==EV_SPREAD) {
   uint16_t contribution=f->trait==EVENT_NONE?base->spread[region]:TransmissionContribution(d,region,f->trait);
   delta+=(int32_t)contribution*amount/100;
  } else if(kind==EV_DISCOVERY||kind==EV_RESEARCH) {
   int32_t part=land?(int32_t)amount*LandCount(c[0])/land:0;
   if(!part&&amount&&LandCount(c[0]))part=amount>0?1:-1;
   delta+=part;
  } else if(kind==EV_BLOCK_AIR||kind==EV_BLOCK_SEA) { if(region==0)*blocked=1; }
  else delta+=amount;
 }
 if(kind==EV_SPREAD) *expected=ClampProbability(Band((int32_t)base->spread[region]+delta,base->spread[region]/2,(uint32_t)base->spread[region]*150/100));
 else if(kind==EV_DISCOVERY||kind==EV_RESEARCH) *expected=Band(100+delta,75,125);
 else if(kind==EV_BLOCK_AIR||kind==EV_BLOCK_SEA) *expected=*blocked;
 else *expected=Band(100+delta,50,150);
}

static void CheckDeterministicSchedulerAndPrivateRng(void) {
 event_state_t a,b;disease_t d;counts_t c[REGION_COUNT];uint32_t seed;bool found=false;
 SetupDisease();disease.response=ESCALATING;SetupCounts();
 for(unsigned t=0;t<TRAIT_COUNT;t++)Own(&disease,(uint8_t)t);
 d=disease;d.cycles=24;memcpy(c,counts,sizeof(c));
 for(seed=1;seed<5000&&!found;seed++) {
  EventsInit(&a,&disease,seed);EventsInit(&b,&disease,seed);game_rng=UINT32_C(0x13579bdf);game_random_calls=0;
  (void)GameRandom(31);
  { uint32_t before=game_rng,calls=game_random_calls;EventsAdvance(&a,&d,c,Notice);assert(game_rng==before&&game_random_calls==calls); }
  EventsAdvance(&b,&d,c,NULL);assert(!memcmp(&a,&b,sizeof(a)));
  if(ActiveSlot(&a)>=0) {
   int slot=ActiveSlot(&a);assert(EventsOccurred(&a,a.active[slot].id));
   assert(a.next_start==d.cycles+16);found=true;
  }
 }
 assert(found);
 puts("PASS: event scheduling is deterministic and leaves the simulation RNG untouched");
}

static void CheckCatalogEntry(uint8_t id,bool own_effect_traits) {
 const event_def_t *def=&event_catalog[id];event_state_t s;effects_t base,e;event_modifiers_t m;
 uint16_t expected;uint8_t blocked;unsigned i,r;
 SetupDisease();disease.response=ESCALATING;SetupCounts();
 if(own_effect_traits)for(i=0;i<2;i++)if(def->effect[i].trait!=EVENT_NONE)Own(&disease,def->effect[i].trait);
 if(own_effect_traits&&def->mitigate!=EVENT_NONE)Own(&disease,def->mitigate);
 EventsInit(&s,&disease,17);s.active[0]=(active_event_t){id,0,16};CalculateEffects(&disease,&base);e=base;
 EventsApply(&s,&disease,counts,&e,&m);
 for(r=0;r<REGION_COUNT;r++) {
  ExpectedModifiers(def,&disease,counts,&base,EV_SPREAD,(uint8_t)r,&expected,&blocked);
  if(e.spread[r]!=expected) { fprintf(stderr,"spread mismatch id=%u region=%u own=%u actual=%u expected=%u base=%u traitowned=%u contrib=%u amount=%d\n",id,r,own_effect_traits,e.spread[r],expected,base.spread[r],Owns(&disease,def->effect[0].trait),TransmissionContribution(&disease,(uint8_t)r,def->effect[0].trait),EventAmount(def,&def->effect[0],&disease));abort(); }
  ExpectedModifiers(def,&disease,counts,&base,EV_AIR,(uint8_t)r,&expected,&blocked);assert(m.air[r]==expected);
  ExpectedModifiers(def,&disease,counts,&base,EV_SEA,(uint8_t)r,&expected,&blocked);assert(m.sea[r]==expected);
  ExpectedModifiers(def,&disease,counts,&base,EV_MIGRATION,(uint8_t)r,&expected,&blocked);assert(m.migration[r]==expected);
  ExpectedModifiers(def,&disease,counts,&base,EV_BLOCK_AIR,(uint8_t)r,&expected,&blocked);assert(((m.blocked_air>>r)&1)==blocked);
  ExpectedModifiers(def,&disease,counts,&base,EV_BLOCK_SEA,(uint8_t)r,&expected,&blocked);assert(((m.blocked_sea>>r)&1)==blocked);
  assert(m.air[r]>=50&&m.air[r]<=150&&m.sea[r]>=50&&m.sea[r]<=150&&m.migration[r]>=50&&m.migration[r]<=150);
 }
 ExpectedModifiers(def,&disease,counts,&base,EV_DISCOVERY,0,&expected,&blocked);assert(m.discovery==expected);
 ExpectedModifiers(def,&disease,counts,&base,EV_RESEARCH,0,&expected,&blocked);assert(m.research==expected);
 assert(m.discovery>=75&&m.discovery<=125&&m.research>=75&&m.research<=125);
}
static void CheckEveryCatalogEffectAndTraitContribution(void) {
 unsigned id,j,r;bool saw_spread=false;
 SetupCounts();
 for(id=0;id<WORLD_EVENT_COUNT;id++) {
  CheckCatalogEntry((uint8_t)id,false);CheckCatalogEntry((uint8_t)id,true);
  for(j=0;j<2;j++) {
   const event_def_t *def=&event_catalog[id];const event_effect_t *f=&def->effect[j];
   if(f->kind==EV_NONE||!f->amount)continue;
   SetupDisease();assert(EventAmount(def,f,&disease)==f->amount);
   if(def->mitigate!=EVENT_NONE) { Own(&disease,def->mitigate);assert(EventAmount(def,f,&disease)==f->amount/2); }
   if(f->kind==EV_SPREAD&&f->trait!=EVENT_NONE) {
    Own(&disease,f->trait);
    for(r=0;r<REGION_COUNT;r++)if(TransmissionContribution(&disease,(uint8_t)r,f->trait))saw_spread=true;
   }
  }
 }
 assert(saw_spread);
 /* A zero ordinary baseline remains zero even with a trait-specific bonus. */
 for(id=0;id<WORLD_EVENT_COUNT;id++)for(j=0;j<2;j++)if(event_catalog[id].effect[j].kind==EV_SPREAD&&event_catalog[id].effect[j].amount) {
  event_state_t s;effects_t e={0};event_modifiers_t m;SetupDisease();SetupCounts();
  for(unsigned t=0;t<TRAIT_COUNT;t++)Own(&disease,(uint8_t)t);
  EventsInit(&s,&disease,23);s.active[0]=(active_event_t){(uint8_t)id,0,16};EventsApply(&s,&disease,counts,&e,&m);
  for(r=0;r<REGION_COUNT;r++)assert(e.spread[r]==0);
  puts("PASS: all 200 catalog effects, trait gating/contributions, mitigation, and zero transmission");return;
 }
 assert(!"catalog lacks a spread event");
}

static void CheckStackBounds(void) {
 uint8_t id=FindKind(EV_AIR);event_state_t s;effects_t e={0};event_modifiers_t m;int32_t amount=0;
 SetupDisease();SetupCounts();
 for(unsigned j=0;j<2;j++)if(event_catalog[id].effect[j].kind==EV_AIR)amount+=EventAmount(&event_catalog[id],&event_catalog[id].effect[j],&disease);
 EventsInit(&s,&disease,27);for(unsigned i=0;i<WORLD_EVENT_SLOTS;i++)s.active[i]=(active_event_t){id,0,16};
 for(unsigned i=0;i<REGION_COUNT;i++)e.spread[i]=5000;
 EventsApply(&s,&disease,counts,&e,&m);assert(m.air[0]==Band(100+4*amount,50,150));
 puts("PASS: four simultaneous modifier contributions stack within their clamp");
}

static void CheckExpirationCancellationAndBranches(void) {
 event_state_t s;uint8_t id=FindStandalone(),chain,root=FindAnyChainPhase0(&chain);SetupDisease();SetupCounts();
 disease.cycles=40;EventsInit(&s,&disease,19);s.last_cycle=40;s.next_start=56;SetActive(&s,0,id,0,1);
 disease.cycles++;notices_started=notices_ended=0;EventsAdvance(&s,&disease,counts,Notice);
 assert(s.active[0].id==EVENT_NONE&&EventsOccurred(&s,id));assert(notices_ended==1&&last_notice_id==id&&last_notice_ended);
 assert(EventsValidate(&s,&disease));
 /* A region with no living population cancels the chain without marking its next stage. */
 SetupDisease();SetupCounts();disease.cycles=80;counts[0]=(counts_t){0,0,1000};
 EventsInit(&s,&disease,21);s.last_cycle=80;s.next_start=96;SetActive(&s,0,root,0,event_catalog[root].duration);
 disease.cycles++;EventsAdvance(&s,&disease,counts,Notice);
 assert(s.active[0].id==EVENT_NONE&&EventsOccurred(&s,root)&&!EventsOccurred(&s,(uint8_t)(root+1)));
 assert(last_notice_id==root&&last_notice_region==0&&last_notice_ended&&EventsValidate(&s,&disease));
 /* Drive every authored conditional branch down both sides using its own condition. */
 for(unsigned event=100;event<WORLD_EVENT_COUNT;event++) {
  const event_def_t *def=&event_catalog[event];
  if(def->next_true==def->next_false||def->branch==BR_ALWAYS)continue;
  for(unsigned side=0;side<2;side++) {
   uint8_t expected;SetupDisease();SetupCounts();disease.cycles=49;
   switch(def->branch) {
   case BR_OWNS:if(side)Own(&disease,def->branch_trait);assert(Owns(&disease,def->branch_trait)==(side!=0));break;
   case BR_SEVERITY:
    if(side)for(unsigned t=0;t<TRAIT_COUNT;t++)if(traits[t].severity)Own(&disease,(uint8_t)t);
    { effects_t e;CalculateEffects(&disease,&e);assert((e.severity>=20)==(side!=0)); }break;
   case BR_DEAD:counts[0]=side?(counts_t){100,600,300}:(counts_t){500,500,0};assert((Percentage(counts[0].dead,LandCount(counts[0]))>=25)==(side!=0));break;
   case BR_ACTIVE:counts[0]=side?(counts_t){100,900,0}:(counts_t){1000,0,0};assert((Percentage(counts[0].active,LandCount(counts[0]))>=50)==(side!=0));break;
   case BR_CURE:disease.cure=side?5000:0;assert((disease.cure>=5000)==(side!=0));break;
   case BR_RESPONSE:disease.response=side?ESCALATING:UNDETECTED;assert((disease.response>=ESCALATING)==(side!=0));break;
   default:assert(!"unexpected conditional branch");
   }
   EventsInit(&s,&disease,29);s.last_cycle=48;s.next_start=64;
   for(unsigned p=event-((event-100)%5);p<event;p++)Mark(&s,(uint8_t)p);
   SetActive(&s,0,(uint8_t)event,0,1);expected=side?def->next_true:def->next_false;
   EventsAdvance(&s,&disease,counts,NULL);
   if(expected==EVENT_NONE)assert(s.active[0].id==EVENT_NONE);
   else assert(s.active[0].id==expected&&EventsOccurred(&s,expected));
   assert(EventsValidate(&s,&disease));
  }
 }
 printf("PASS: expiration, cancellation, and storyline %u branches\n",chain);
}

#define MAX_MAP_PIXELS 20000
static uint8_t world_data[REGION_COUNT][MAX_MAP_PIXELS];
static region_t world[REGION_COUNT];
static const uint8_t * const map_data[]={africa_data,asia_data,europe_data,greenland_data,northamerica_data,southamerica_data,oceania_data};
static const uint8_t map_x[]={58,84,63,45,0,24,126},map_y[]={41,18,23,17,21,57,65};
static uint16_t AirRandom(uint16_t n) { assert(n);return n==2?1:0; }
static void InitActualMap(void) {
 unsigned r;size_t j;
 for(r=0;r<REGION_COUNT;r++) {
  size_t n=(size_t)map_data[r][0]*map_data[r][1];assert(n<=MAX_MAP_PIXELS);
  memcpy(world_data[r],map_data[r]+2,n);world[r]=(region_t){"Fixture",world_data[r],map_data[r][0],map_data[r][1],map_x[r],map_y[r],{0,0,0}};
  for(j=0;j<n;j++)if(world_data[r][j])world_data[r][j]=CELL_HEALTHY;
  RecountRegion(&world[r]);
 }
}
static void CheckTemporaryAndPermanentClosures(void) {
 port_t ports[PORT_COUNT];effects_t effects={0};event_modifiers_t mods;uint8_t source=EVENT_NONE,target=EVENT_NONE;
 uint8_t block=FindKind(EV_BLOCK_AIR);SetupDisease();InitActualMap();memcpy(ports,port_definitions,sizeof(ports));
 for(unsigned i=0;i<PORT_COUNT;i++) {
  if(source==EVENT_NONE&&ports[i].region==0&&(ports[i].modes&PORT_AIR)&&ValidPort(world,&ports[i]))source=(uint8_t)i;
  if(target==EVENT_NONE&&ports[i].region!=0&&(ports[i].modes&PORT_AIR)&&ValidPort(world,&ports[i]))target=(uint8_t)i;
  ports[i].closed=true;
 }
 assert(source!=EVENT_NONE&&target!=EVENT_NONE);ports[source].closed=ports[target].closed=false;
 for(size_t i=0;i<(size_t)world[0].width*world[0].height;i++)if(world[0].data[i])world[0].data[i]=CELL_INFECTED;
 RecountRegion(&world[0]);effects.air=PROB_SCALE;
 for(unsigned i=0;i<REGION_COUNT;i++)counts[i]=world[i].counts;
 for(unsigned j=0;j<2;j++)if(event_catalog[block].effect[j].trait!=EVENT_NONE)Own(&disease,event_catalog[block].effect[j].trait);
 ApplyOne(block,&disease,counts,&effects,&mods);assert(mods.blocked_air&(1U<<0));
 { uint8_t from,to;assert(!TransportEvents(world,ports,&disease,&effects,AirRandom,&from,&to,&mods)); }
 /* Expiring the event clears its overlay; the open permanent endpoints still route. */
 { event_state_t empty;EventsInit(&empty,&disease,31);EventsApply(&empty,&disease,counts,&effects,&mods);uint8_t from,to;
  assert(!(mods.blocked_air&(1U<<0)));assert(TransportEvents(world,ports,&disease,&effects,AirRandom,&from,&to,&mods)); }
 InitActualMap();memcpy(ports,port_definitions,sizeof(ports));
 for(unsigned i=0;i<PORT_COUNT;i++)if(i!=source&&i!=target)ports[i].closed=true;
 ports[source].closed=true;ports[target].closed=false;
 for(size_t i=0;i<(size_t)world[0].width*world[0].height;i++)if(world[0].data[i])world[0].data[i]=CELL_INFECTED;
 RecountRegion(&world[0]);for(unsigned i=0;i<REGION_COUNT;i++)counts[i]=world[i].counts;
 memset(&mods,0,sizeof(mods));for(unsigned i=0;i<REGION_COUNT;i++)mods.air[i]=100;
 { uint8_t from,to;assert(!TransportEvents(world,ports,&disease,&effects,AirRandom,&from,&to,&mods));assert(ports[source].closed); }
 puts("PASS: temporary air restrictions expire while permanent port closures remain in force");
}

static void CheckPatientZeroReshuffleResetAndValidation(void) {
 event_state_t s,clean;uint8_t p0=FindChainPhase(3,0),p1=FindChainPhase(3,1),p2=FindChainPhase(3,2);
 assert(p0!=EVENT_NONE&&p1!=EVENT_NONE&&p2!=EVENT_NONE);
 for(unsigned phase=0;phase<3;phase++) {
  uint8_t id=phase==0?p0:phase==1?p1:p2,duration=event_catalog[id].duration;
  SetupDisease();disease.cycles=120;EventsInit(&s,&disease,43);
  for(unsigned p=(unsigned)(id-((id-100)%5));p<id;p++)Mark(&s,(uint8_t)p);
  SetActive(&s,0,id,0,duration);Own(&disease,RESHUFFLE1);EventsRefreshTraits(&s,&disease);
  assert(s.active[0].remaining==duration+(phase<2?16:0));assert(EventsValidate(&s,&disease));
 }
 SetupDisease();disease.cycles=160;EventsInit(&s,&disease,47);
 SetActive(&s,0,p0,0,event_catalog[p0].duration);
 Own(&disease,RESHUFFLE1);EventsRefreshTraits(&s,&disease);
 assert(s.active[0].remaining==event_catalog[p0].duration+16);
 Own(&disease,RESHUFFLE2);EventsRefreshTraits(&s,&disease);
 assert(s.active[0].remaining==event_catalog[p0].duration+32&&EventsValidate(&s,&disease));
 EventsInit(&s,&disease,77);EventsInit(&clean,&disease,77);assert(!memcmp(&s,&clean,sizeof(s))&&EventsValidate(&s,&disease));
 EventsInit(&s,&disease,0);assert(s.rng&&s.next_start==disease.cycles+24);
 for(unsigned i=0;i<WORLD_EVENT_SLOTS;i++)assert(s.active[i].id==EVENT_NONE&&!s.active[i].region&&!s.active[i].remaining);
 s.rng=0;assert(!EventsValidate(&s,&disease));EventsInit(&s,&disease,77);s.next_start=UINT32_MAX;assert(!EventsValidate(&s,&disease));
 EventsInit(&s,&disease,77);Mark(&s,101);assert(!EventsValidate(&s,&disease));
 puts("PASS: Patient Zero phases 0/1 alone gain reshuffle time; reset and state validation");
}

static void CheckTickerMessages(void) {
 SetupDisease();
 for(unsigned id=0;id<WORLD_EVENT_COUNT;id++) {
  TickerInit(&disease);assert(TickerPost(NEWS_EVENT,(uint8_t)id,(uint16_t)(id%REGION_COUNT)));
  assert(strlen(TickerText())<sizeof(ticker.text)&&strncmp(TickerText(),"WORLD:",6)==0);
  TickerInit(&disease);assert(TickerPost(NEWS_EVENT_END,(uint8_t)id,0));
  assert(strlen(TickerText())<sizeof(ticker.text)&&strncmp(TickerText(),"WORLD: Ended:",13)==0);
 }
 assert(TickerPriority((news_event_t){NEWS_EVENT,0,0})==2&&TickerPriority((news_event_t){NEWS_EVENT_END,0,0})==1);
 puts("PASS: all event headlines fit the ticker and starts outrank endings");
}
int main(void) {
 CheckDeterministicSchedulerAndPrivateRng();CheckEveryCatalogEffectAndTraitContribution();
 CheckStackBounds();CheckExpirationCancellationAndBranches();CheckTemporaryAndPermanentClosures();
 CheckPatientZeroReshuffleResetAndValidation();CheckTickerMessages();
 puts("All event-engine checks passed.");return 0;
}
