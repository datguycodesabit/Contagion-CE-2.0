/* Headless diagnostic using production rules and original sprites. No UI or fake CE runtime. */
#include "world.h"
#include "sprites/sprites.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static region_t r[REGION_COUNT];
static port_t ports[PORT_COUNT];
static disease_t d;
static effects_t e;
static uint32_t rng;
static unsigned enabled,starts;
static event_state_t events;
static event_modifiers_t mods;
static void Notice(uint8_t id,uint8_t region,bool ended) { (void)region;if(!ended&&(id<100||(id-100)%5==0))starts++; }
static void Refresh(void) {
 counts_t counts[REGION_COUNT];unsigned i;
 CalculateEffects(&d,&e);
 if(enabled) { for(i=0;i<REGION_COUNT;i++)counts[i]=r[i].counts;EventsRefreshTraits(&events,&d);EventsApply(&events,&d,counts,&e,&mods); }
}
static uint16_t Random(uint16_t n) { rng=rng*UINT32_C(1664525)+UINT32_C(1013904223); return (rng>>8)%n; }
static void Init(uint8_t type) {
 uint8_t * const data[]={africa_data,asia_data,europe_data,greenland_data,northamerica_data,southamerica_data,oceania_data};
 const uint8_t x[]={58,84,63,45,0,24,126},y[]={41,18,23,17,21,57,65}; unsigned i,j;
 for(i=0;i<REGION_COUNT;i++) {
  r[i].data=data[i]+2; r[i].width=data[i][0];r[i].height=data[i][1];r[i].x=x[i];r[i].y=y[i];
  for(j=0;j<(unsigned)r[i].width*r[i].height;j++) if(r[i].data[j]) r[i].data[j]=CELL_HEALTHY;
  RecountRegion(&r[i]);
 }
 memcpy(ports,port_definitions,sizeof(ports));ResetDisease(&d);d.type=type;d.started=1;SeedRegion(r,&d,0,Random); CalculateEffects(&d,&e);
}
int main(int argc, char **argv) {
 unsigned type,seed,runs=argc>1?(unsigned)atoi(argv[1]):2;
 for(enabled=0;enabled<2;enabled++)
 for(type=0;type<3;type++) for(seed=1;seed<=runs;seed++) {
  uint8_t next=0,s,t,i; unsigned purchases=0; unsigned deaths_trigger=argc>2?(unsigned)atoi(argv[2]):0;
  const uint8_t openings[3][9]={
   {WATER1,AIR1,LIVESTOCK1,INSECTS1,WATER2,AIR2,COLD1,HARDEN1,HARDEN2},
   {LIVESTOCK1,INSECTS1,WATER1,AIR1,WATER2,AIR2,COLD1,HARDEN1,HARDEN2},
   {RODENTS1,BLOOD1,WATER1,AIR1,WATER2,AIR2,COLD1,HARDEN1,HARDEN2}};
  const uint8_t *opening=openings[argc>3?(unsigned)atoi(argv[3])%3:0]; unsigned order=0;
  rng=seed; Init(type); EventsInit(&events,&d,seed*7919);starts=0;
  while(d.result==PLAYING && d.cycles<600) {
   counts_t total=CountWorld(r); counts_t counts[REGION_COUNT];
   if(d.type==VIRUS && total.healthy>deaths_trigger) for(i=ORGAN;i>=COUGH;i--) if(CanDevolve(&d,i) && traits[i].lethality) Devolve(&d,i);
   if(type==FUNGUS && d.spores_used<3 && d.cycles>50 && d.dna>=spore_costs[d.spores_used]+6) {
    uint8_t target=3;
    for(i=0;i<REGION_COUNT;i++) if(r[i].counts.healthy && !r[i].counts.active) target=i;
    if(!r[target].counts.active) SporeBurst(r,&d,target,Random);
   }
   if(order<9 && Purchase(&d,opening[order])) { order++;purchases++; }
   if(total.healthy<=deaths_trigger) for(i=COUGH;i<=RESP_FAILURE;i++) if(Purchase(&d,i)) purchases++;
   if(d.cure>8000 && Purchase(&d,RESHUFFLE1)) purchases++;
   if(d.cure>8000 && Purchase(&d,RESHUFFLE2)) purchases++;
   Refresh();
   if(StepWorldRegion(r,&next,&e,Random)) {
    TransportEvents(r,ports,&d,&e,Random,&s,&t,enabled?&mods:NULL); MigrateEvents(r,&d,&e,Random,enabled?&mods:NULL);
    Mutate(&d,Random);Refresh();
    for(i=0;i<REGION_COUNT;i++) counts[i]=r[i].counts;
    AdvanceDiseaseEvents(&d,counts,&e,enabled?mods.discovery:100,enabled?mods.research:100); ClosePorts(r,ports,&d,&e,Random);
    if(enabled)EventsAdvance(&events,&d,counts,Notice);
   } else TransportEvents(r,ports,&d,&e,Random,&s,&t,enabled?&mods:NULL);
  }
  { counts_t total=CountWorld(r);printf("events=%u starts=%u %s seed=%u result=%u cycles=%lu healthy=%u active=%u dead=%u DNA=%u buys=%u cure=%u\n",enabled,starts,disease_names[type],seed,d.result,(unsigned long)d.cycles,total.healthy,total.active,total.dead,d.dna,purchases,d.cure); }
 }
 return 0;
}
