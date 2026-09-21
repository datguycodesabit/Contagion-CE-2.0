#include "disease.h"
#include "world.h"
#include "savecodec.h"
#include "sprites/sprites.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

static region_t r[REGION_COUNT];
static port_t ports[PORT_COUNT];
static disease_t d;
static effects_t e;
static uint32_t rng=1;
static uint32_t calls;
static uint16_t Random(uint16_t n) { assert(n); calls++; rng=rng*UINT32_C(1664525)+UINT32_C(1013904223); return (uint16_t)((rng>>8)%n); }
static uint16_t Zero(uint16_t n) { assert(n); calls++; return 0; }
static uint16_t Last(uint16_t n) { assert(n); calls++; return n-1; }
static void Init(void) {
 uint8_t * const data[]={africa_data,asia_data,europe_data,greenland_data,northamerica_data,southamerica_data,oceania_data};
 const uint8_t x[]={58,84,63,45,0,24,126},y[]={41,18,23,17,21,57,65};
 unsigned i; size_t j;
 for(i=0;i<REGION_COUNT;i++) {
  r[i].name="Fixture"; r[i].data=data[i]+2; r[i].width=data[i][0]; r[i].height=data[i][1]; r[i].x=x[i]; r[i].y=y[i];
  for(j=0;j<(size_t)r[i].width*r[i].height;j++) if(r[i].data[j]) r[i].data[j]=CELL_HEALTHY;
  RecountRegion(&r[i]);
 }
 memcpy(ports,port_definitions,sizeof(ports)); ResetDisease(&d); CalculateEffects(&d,&e);
}
static void Own(uint8_t id) { d.owned[id/32]|=UINT32_C(1)<<(id%32); }
static void Start(void) { d.started=1; assert(SeedRegion(r,&d,0,Random)); }
static void Discover(void) { d.response=RESEARCH; d.discovery_cycle=1; d.cycles=10; d.discovery_pressure=DISCOVERY_LIMIT; d.cure=2500; }
static void CheckCounts(void) {
 unsigned i;
 for(i=0;i<REGION_COUNT;i++) { counts_t before=r[i].counts; RecountRegion(&r[i]); assert(!memcmp(&before,&r[i].counts,sizeof(before))); }
}
static void Traits(void) {
 unsigned i,k,type;
 for(type=0;type<3;type++) {
  Init(); Start(); d.type=type;
  for(i=0;i<TRAIT_COUNT;i++) {
   disease_t before;
   d.dna=MAX_DNA;
   if(i>=RESHUFFLE1) Discover();
   assert(Eligible(&d,i));
   for(k=0;k<2;k++) if(traits[i].prerequisite[k]!=NO_TRAIT) {
    disease_t missing=d; uint8_t pre=traits[i].prerequisite[k]; missing.owned[pre/32]&=~(UINT32_C(1)<<(pre%32)); assert(!Purchase(&missing,i));
   }
   d.dna=traits[i].cost-1; before=d; assert(!Purchase(&d,i)); assert(!memcmp(&d,&before,sizeof(d)));
   d.dna=traits[i].cost; assert(Purchase(&d,i)); assert(d.dna==0); assert(Owns(&d,i));
   before=d; assert(!Purchase(&d,i)); assert(!memcmp(&d,&before,sizeof(d)));
  }
  CalculateEffects(&d,&e);
  assert(e.resistance==60 && e.lethality==18);
  for(i=0;i<REGION_COUNT;i++) assert(e.spread[i]<=PROB_SCALE);
  for(i=0;i<TRAIT_COUNT;i++) assert(CanDevolve(&d,i)==(i==RESP_FAILURE || i==COLLAPSE || i==ORGAN));
  d.dna=20; assert(Devolve(&d,RESP_FAILURE)); assert(d.dna==20-(type==VIRUS?7:4)); assert(CanDevolve(&d,PNEUMONIA)); assert(d.response==RESEARCH);
 }
 Init(); Start(); assert(!Purchase(&d,RESHUFFLE1)); Discover(); d.dna=16; d.cure=100; assert(Purchase(&d,RESHUFFLE1)); assert(!d.cure); assert(!Eligible(&d,RESHUFFLE2)); d.cure=10; d.dna=24; assert(Purchase(&d,RESHUFFLE2)); assert(!d.cure); assert(!Devolve(&d,RESHUFFLE1));
 puts("PASS: all traits, exact/insufficient costs, prerequisites, devolution, reshuffles");
}
static void ArithmeticAndCells(void) {
 uint8_t pixels[9]={255,255,255,255,224,255,255,255,255}; region_t small={"test",pixels,3,3,0,0,{8,1,0}};
 uint32_t before; unsigned i;
 assert(ClampProbability(-1)==0 && ClampProbability(10001)==10000 && Percentage(3,0)==0);
 calls=0; assert(!Roll(Zero,0)); assert(Roll(Last,10000)); assert(calls==0);
 StepRegion(&small,10000,0,Zero); assert(small.counts.dead==0 && small.counts.active==2);
 assert(small.data[0]==CELL_INFECTED); /* Newly infected cell behind scan position is counted. */
 before=small.counts.active; RecountRegion(&small); assert(small.counts.active==before);
 StepRegion(&small,0,10000,Random); assert(!small.counts.active && small.counts.dead==2);
 assert(!SetCell(&small,9,CELL_INFECTED)); assert(!SetCell(&small,0,CELL_INFECTED));
 {
  uint8_t cells[9]={255,255,255,255,0,255,255,255,255};
  region_t edge[REGION_COUNT]={{0}}; disease_t local;
  edge[0]=(region_t){"edge",cells,3,3,3,4,{8,0,0}}; ResetDisease(&local);
  assert(InfectCoordinate(edge,&local,3,4)); assert(InfectCoordinate(edge,&local,5,6));
  assert(!InfectCoordinate(edge,&local,2,4)); assert(!InfectCoordinate(edge,&local,6,7));
  assert(!InfectCoordinate(edge,&local,4,5)); assert(!InfectCoordinate(edge,&local,-1,-1));
  assert(edge[0].counts.active==2 && cells[4]==CELL_EMPTY);
 }
 Init(); Start(); before=d.cycles;
 { uint8_t next=0; for(i=0;i<21;i++) { bool completed=StepWorldRegion(r,&next,&e,Random); assert(completed==(i%7==6)); assert(d.cycles==before); CheckCounts(); } }
 Init(); CalculateEffects(&d,&e);
 for(i=0;i<TRAIT_COUNT;i++) {
  effects_t old=e; Own(i); CalculateEffects(&d,&e);
  for(unsigned j=0;j<REGION_COUNT;j++) assert(e.spread[j]>=old.spread[j]);
 }
 puts("PASS: bounded arithmetic, scan-order counts, zero deaths, 7-region scheduling, monotonic effects");
}
static void RewardsAndDisease(void) {
 counts_t counts[REGION_COUNT]={{0}}; counts_t all={0,0,4410}; unsigned i; uint8_t events;
 Init(); d.seen_regions=127; AwardDNA(&d,all); assert(d.dna==MAX_DNA); d.dna=0; AwardDNA(&d,all); assert(d.dna==0);
 Init(); Start(); counts[0].active=1; counts[0].healthy=999;
 for(i=0;i<50;i++) { assert(!AdvanceDisease(&d,counts,&e)); assert(d.response==UNDETECTED && d.cure==0); }
 counts[0].active=700; counts[0].healthy=300; events=AdvanceDisease(&d,counts,&e); assert(events&EVENT_DISCOVERY); assert(d.response==DISCOVERED);
 for(i=0;i<RESEARCH_DELAY;i++) events=AdvanceDisease(&d,counts,&e);
 assert(events&EVENT_RESEARCH); assert(d.cure>0);
 Own(HARDEN1); Own(HARDEN2); CalculateEffects(&d,&e);
 for(i=0;i<10;i++) { uint16_t old=d.cure; AdvanceDisease(&d,counts,&e); assert(d.cure>old); }
 d.cure=9999; counts[0].active=0; counts[0].healthy=0; counts[0].dead=1000; d.cure=10000; AdvanceDisease(&d,counts,&e); assert(d.result==WON);
 d.result=PLAYING; counts[0].healthy=1; AdvanceDisease(&d,counts,&e); assert(d.result==LOST_EXTINCTION);
 d.result=PLAYING; counts[0].active=1; AdvanceDisease(&d,counts,&e); assert(d.result==LOST_CURE);
 Init(); d.cure=10000; EvaluateOutcome(&d,all); assert(d.result==PLAYING); /* Not started. */
 Init(); Start(); d.type=VIRUS; d.cycles=11;
 for(i=0;i<12;i++) { uint8_t id=Mutate(&d,Zero); assert(id>=COUGH && id<=ORGAN); for(unsigned k=0;k<2;k++) assert(traits[id].prerequisite[k]==NO_TRAIT || Owns(&d,traits[id].prerequisite[k])); }
 assert(Mutate(&d,Zero)==NO_TRAIT); d.type=BACTERIA; d.owned[0]=d.owned[1]=0; assert(Mutate(&d,Zero)==NO_TRAIT); d.type=VIRUS; d.cycles=0; assert(Mutate(&d,Zero)==NO_TRAIT);
 puts("PASS: one-time DNA, silent/discovered/research progression, cure minimum, outcomes, virus mutation");
}
static void Travel(void) {
 unsigned i; uint8_t source,destination; bool success=false;
 Init(); Start();
 for(i=0;i<PORT_COUNT;i++) assert(ValidPort(r,&ports[i]));
 for(i=0;i<PORT_COUNT;i++) ports[i].closed=true;
 assert(!Transport(r,ports,&d,&e,Zero,&source,&destination));
 d.type=FUNGUS; d.dna=MAX_DNA;
 { disease_t before=d; assert(!SporeBurst(r,&d,REGION_COUNT,Zero)); assert(!memcmp(&before,&d,sizeof(d))); }
 for(i=0;i<3;i++) { uint16_t old=d.dna; assert(SporeBurst(r,&d,3,Zero)); assert(d.dna==old-spore_costs[i]); }
 assert(!SporeBurst(r,&d,3,Zero));
 Init(); Start(); d.type=FUNGUS; d.dna=9;
 { disease_t before=d; assert(!SporeBurst(r,&d,3,Zero)); assert(!memcmp(&before,&d,sizeof(d))); }
 d.dna=10; assert(SporeBurst(r,&d,3,Zero)); assert(d.dna==0);
 for(i=0;i<(size_t)r[3].width*r[3].height;i++) if(r[3].data[i]) r[3].data[i]=CELL_DEAD;
 RecountRegion(&r[3]); d.dna=16;
 { disease_t before=d; assert(!SporeBurst(r,&d,3,Zero)); assert(!memcmp(&before,&d,sizeof(d))); }
 Init(); Start();
 for(i=0;i<(size_t)r[0].width*r[0].height;i++) if(r[0].data[i]) { r[0].data[i]=CELL_DEAD; }
 RecountRegion(&r[0]); assert(!Transport(r,ports,&d,&e,Zero,&source,&destination));
 Init(); Start();
 for(i=0;i<(size_t)r[0].width*r[0].height;i++) if(r[0].data[i]) r[0].data[i]=CELL_INFECTED;
 RecountRegion(&r[0]); e.air=e.sea=10000;
 for(i=0;i<100;i++) if(Transport(r,ports,&d,&e,Random,&source,&destination)) { assert(ports[source].modes&ports[destination].modes); assert(!ports[source].closed && !ports[destination].closed); success=true; }
 assert(success); CheckCounts();
 Init(); Start();
 for(i=0;i<PORT_COUNT;i++) ports[i].modes=ports[i].region==0?PORT_AIR:PORT_SEA;
 assert(!Transport(r,ports,&d,&e,Zero,&source,&destination)); assert(!Transport(r,ports,&d,&e,Last,&source,&destination));
 for(i=0;i<PORT_COUNT;i++) ports[i].closed=true;
 e.migration=10000; d.cycles=6; assert(!Migrate(r,&d,&e,Zero));
 d.cycles=7; assert(Migrate(r,&d,&e,Zero)); CheckCounts();
 Init(); Start();
 assert(ClosePorts(r,ports,&d,&e,Zero)==0);
 Discover(); e.severity=100; assert(ClosePorts(r,ports,&d,&e,Zero));
 for(i=0;i<PORT_COUNT;i++) assert(ports[i].closed);
 e.severity=0; ClosePorts(r,ports,&d,&e,Zero);
 for(i=0;i<PORT_COUNT;i++) assert(ports[i].closed);
 puts("PASS: static ports, closed routes, dead-only source, spores, migration, irreversible restrictions");
}
typedef struct { uint8_t bytes[20000]; size_t size,pos,fail_at; } memory_t;
static memory_t mem;
static bool Read(void *ctx, void *out, size_t n) { memory_t *m=ctx; if(m->pos+n>m->size || (m->fail_at && m->pos+n>m->fail_at)) return false; memcpy(out,m->bytes+m->pos,n); m->pos+=n; return true; }
static bool Write(void *ctx, const void *in, size_t n) { memory_t *m=ctx; if(m->pos+n>sizeof(m->bytes)) return false; memcpy(m->bytes+m->pos,in,n); m->pos+=n; if(m->pos>m->size) m->size=m->pos; return true; }
static bool Seek(void *ctx, uint32_t pos) { memory_t *m=ctx; if(pos>m->size) return false; m->pos=pos; return true; }
static void RepairChecksum(void) {
 uint32_t hash=UINT32_C(2166136261); size_t i;
 for(i=0;i<mem.size-4;i++) { hash^=mem.bytes[i]; hash*=UINT32_C(16777619); }
 for(i=0;i<4;i++) mem.bytes[mem.size-4+i]=(uint8_t)(hash>>(i*8));
}
static void Saves(void) {
 save_io_t io={&mem,Read,Write,Seek,0}; session_t s={123,2,3,159,119,1},loaded_s={0}; disease_t loaded;
 uint8_t original[20000]; unsigned i,type;
 for(type=0;type<3;type++) {
  Init(); Start(); d.type=type; Discover(); d.dna=17; d.region_rewards=d.seen_regions; assert(Purchase(&d,COUGH)); d.cure_fraction=37; ports[0].closed=true;
  d.region_rewards=d.seen_regions; d.affected_rewards=0; d.death_rewards=0; d.cure_news=1;
  if(type==FUNGUS) assert(SporeBurst(r,&d,3,Random));
  mem.size=mem.pos=mem.fail_at=0; assert(EncodeSave(&io,&d,&s,r,ports)); assert(mem.size==SaveSize(r)); io.size=mem.size;
  assert(ValidateSave(&io,r)); assert(DecodeSave(&io,&loaded,&loaded_s,r,ports));
  assert(!memcmp(&d,&loaded,sizeof(d))); assert(loaded_s.ticks==123 && loaded_s.next_region==3 && loaded_s.cursorx==159);
  CheckCounts(); memcpy(original,mem.bytes,mem.size);
  for(i=0;i<mem.size;i++) { mem.bytes[i]^=1; assert(!ValidateSave(&io,r)); mem.bytes[i]^=1; }
  for(i=0;i<mem.size;i+=19) { io.size=i; assert(!ValidateSave(&io,r)); } io.size=mem.size;
  /* Independently invalidate semantic fields, with a valid checksum. */
  { const unsigned offsets[]={4,5,16,32,37,38,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,71,72,73,74,77,78};
   for(i=0;i<sizeof(offsets)/sizeof(*offsets);i++) {
    unsigned offset=offsets[i]; memcpy(mem.bytes,original,mem.size); mem.bytes[offset]=255; RepairChecksum();
    /* All bytes in the name are legal printable constraints, here changed to 255. */
    assert(!ValidateSave(&io,r));
   }
  }
  memcpy(mem.bytes,original,mem.size); mem.fail_at=120; { disease_t before=d; assert(!DecodeSave(&io,&d,&s,r,ports)); assert(!memcmp(&before,&d,sizeof(d))); } mem.fail_at=0;
 }
 Init(); memset(&s,0,sizeof(s)); mem.size=mem.pos=0; assert(EncodeSave(&io,&d,&s,r,ports)); io.size=mem.size; assert(ValidateSave(&io,r));
 /* Round-trip a naturally advanced run at early, discovered, research, and final stages. */
 Init(); Start(); memset(&s,0,sizeof(s));
 for(i=0;i<500;i++) {
  counts_t counts[REGION_COUNT]; unsigned j;
  for(j=0;j<REGION_COUNT;j++) counts[j]=r[j].counts;
  if(i==1) { /* Force active prevalence, preserving map geometry. */
   for(j=0;j<REGION_COUNT;j++) { size_t k; for(k=0;k<(size_t)r[j].width*r[j].height;k++) if(r[j].data[k]) r[j].data[k]=CELL_INFECTED; RecountRegion(&r[j]); counts[j]=r[j].counts; }
  }
  AdvanceDisease(&d,counts,&e);
  mem.size=mem.pos=0; assert(EncodeSave(&io,&d,&s,r,ports)); io.size=mem.size;
  assert(DecodeSave(&io,&loaded,&loaded_s,r,ports)); assert(!memcmp(&d,&loaded,sizeof(d)));
  { uint16_t dna=loaded.dna; AwardDNA(&loaded,CountWorld(r)); assert(dna==loaded.dna); }
  if(d.result!=PLAYING) break;
 }
 assert(d.result==LOST_CURE);
 /* Valid completed victory and active-extinction loss. */
 for(unsigned outcome=1;outcome<=2;outcome++) {
  unsigned j; d.result=outcome;
  for(j=0;j<REGION_COUNT;j++) { size_t k; for(k=0;k<(size_t)r[j].width*r[j].height;k++) if(r[j].data[k]) r[j].data[k]=CELL_DEAD; RecountRegion(&r[j]); }
  if(outcome==LOST_EXTINCTION) { for(j=0;j<(size_t)r[0].width*r[0].height;j++) if(r[0].data[j]) { r[0].data[j]=CELL_HEALTHY; break; } RecountRegion(&r[0]); }
  mem.size=mem.pos=0; assert(EncodeSave(&io,&d,&s,r,ports)); io.size=mem.size; assert(ValidateSave(&io,r));
 }
 Init(); assert(d.dna==START_DNA && !d.started && !d.cycles && !d.owned[0] && !d.owned[1] && !d.cure && !d.cure_fraction && !d.seen_regions && !d.region_rewards && !d.affected_rewards && !d.death_rewards && !d.spores_used);
 puts("PASS: streaming saves, every-byte corruption, truncation, semantic validation, all stages/outcomes, reward persistence, reset");
}
static void Navigation(void) {
 unsigned category,i,k;
 for(category=0;category<3;category++) {
  bool seen[TRAIT_COUNT]={0},changed=true; seen[category==0?0:category==1?17:29]=true;
  while(changed) { changed=false; for(i=0;i<TRAIT_COUNT;i++) if(seen[i]) for(k=0;k<4;k++) {
   unsigned next=traits[i].neighbor[k]; assert(next<TRAIT_COUNT && traits[next].category==category);
   if(!seen[next]) { changed=true; seen[next]=true; }
  } }
  for(i=0;i<TRAIT_COUNT;i++) if(traits[i].category==category) { assert(seen[i]); assert(traits[i].x>=13 && traits[i].x<=306 && traits[i].y>=53 && traits[i].y<=155); }
 }
 puts("PASS: every tree node reachable, navigation edges remain on page, node bounds");
}
int main(void) {
 Traits(); ArithmeticAndCells(); RewardsAndDisease(); Travel(); Saves(); Navigation();
 printf("All host checks passed. Map land: %u cells; save: %lu bytes.\n",LandCount(CountWorld(r)),(unsigned long)SaveSize(r)); return 0;
}
