#include "disease.h"
#include "world.h"
#include "savecodec.h"
#include "events.h"
#include "sprites/sprites.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>

typedef struct { uint8_t bytes[20000]; size_t size,pos; } memory_t;
static memory_t mem;
static region_t regions[REGION_COUNT];
static port_t ports[PORT_COUNT];
static disease_t disease;
static effects_t effects;
static const uint8_t * const maps[]={africa_data,asia_data,europe_data,greenland_data,
 northamerica_data,southamerica_data,oceania_data};
static const uint8_t xs[]={58,84,63,45,0,24,126},ys[]={41,18,23,17,21,57,65};

static bool Read(void *context,void *out,size_t n) {
 memory_t *m=context;
 if(m->pos+n>m->size)return false;
 memcpy(out,m->bytes+m->pos,n);m->pos+=n;return true;
}
static bool Write(void *context,const void *in,size_t n) {
 memory_t *m=context;
 if(m->pos+n>sizeof(m->bytes))return false;
 memcpy(m->bytes+m->pos,in,n);m->pos+=n;if(m->pos>m->size)m->size=m->pos;return true;
}
static bool Seek(void *context,uint32_t offset) {
 memory_t *m=context;if(offset>m->size)return false;m->pos=offset;return true;
}
static save_io_t IO(void) { save_io_t io={&mem,Read,Write,Seek,(uint32_t)mem.size};return io; }
static uint16_t First(uint16_t n) { assert(n);return 0; }
static void InitMap(void) {
 unsigned i;size_t j;
 for(i=0;i<REGION_COUNT;i++) {
  uint8_t *data=(uint8_t *)maps[i]+2;
  regions[i].name="Fixture";regions[i].data=data;regions[i].width=maps[i][0];regions[i].height=maps[i][1];regions[i].x=xs[i];regions[i].y=ys[i];
  for(j=0;j<(size_t)regions[i].width*regions[i].height;j++)if(data[j])data[j]=CELL_HEALTHY;
  RecountRegion(&regions[i]);
 }
 memcpy(ports,port_definitions,sizeof(ports));ResetDisease(&disease);CalculateEffects(&disease,&effects);
}
static void StartAt(uint32_t cycle) {
 disease.started=1;assert(SeedRegion(regions,&disease,0,First));disease.cycles=cycle;
}
static void ResetMemory(void) { memset(&mem,0,sizeof(mem)); }
static uint32_t Hash(void) {
 uint32_t h=UINT32_C(2166136261);size_t i;
 for(i=0;i<mem.size-4;i++){h^=mem.bytes[i];h*=UINT32_C(16777619);}return h;
}
static void RepairChecksum(void) {
 uint32_t h=Hash();size_t i;
 for(i=0;i<4;i++)mem.bytes[mem.size-4+i]=(uint8_t)(h>>(i*8));
}
static void SaveV3(const session_t *session,const event_state_t *events) {
 save_io_t io=IO();ResetMemory();io=IO();
 assert(EncodeSaveV3(&io,&disease,session,regions,ports,events));
 assert(mem.size==SaveSizeV3(regions));memset(&io,0,sizeof(io));io=IO();
 assert(io.size==mem.size && mem.bytes[4]==3);
}
static uint8_t SeverityBranch(void) {
 uint8_t root;
 for(root=100;root<200;root=(uint8_t)(root+5)) {
  const event_def_t *e=&event_catalog[root+1];
  if(e->branch==BR_SEVERITY&&e->next_true!=EVENT_NONE&&e->next_false!=EVENT_NONE)return root+1;
 }
 return EVENT_NONE;
}
static void CheckV3RoundtripAndPartialCycle(bool high_severity) {
 session_t session={123,2,4,159,119,1},loaded_session={0};
 disease_t loaded={0},advanced;event_state_t events,loaded_events={0},saved_next,loaded_next;save_io_t io;
 counts_t counts[REGION_COUNT];uint8_t id,root,i,expected_next;
 InitMap();StartAt(42);EventsInit(&events,&disease,UINT32_C(0x12345678));
 id=SeverityBranch();assert(id!=EVENT_NONE);root=(uint8_t)(100+(id-100)/5*5);
 if(high_severity) {
  disease.owned[COUGH/32]|=UINT32_C(1)<<(COUGH%32);
  disease.owned[SNEEZING/32]|=UINT32_C(1)<<(SNEEZING%32);
  disease.owned[PNEUMONIA/32]|=UINT32_C(1)<<(PNEUMONIA%32);
  disease.owned[RESP_FAILURE/32]|=UINT32_C(1)<<(RESP_FAILURE%32);
 }
 events.occurred[root/8]|=(uint8_t)(1U<<(root%8));
 events.occurred[id/8]|=(uint8_t)(1U<<(id%8));
 events.active[0].id=id;events.active[0].region=0;events.active[0].remaining=1;
 assert(EventsValidate(&events,&disease));
 /* Save with a live chain event one cycle before its branch transition. */
 SaveV3(&session,&events);io=IO();assert(ValidateSaveV3(&io,regions));
 assert(session.next_region==4 && events.last_cycle==disease.cycles && events.next_start==disease.cycles+24);
 assert(DecodeSaveV3(&io,&loaded,&loaded_session,regions,ports,&loaded_events));
 assert(!memcmp(&disease,&loaded,sizeof(disease)));
 assert(loaded_session.next_region==4 && loaded_session.ticks==session.ticks);
 assert(loaded_events.rng==events.rng && loaded_events.last_cycle==events.last_cycle && loaded_events.next_start==events.next_start);
 assert(!memcmp(loaded_events.occurred,events.occurred,sizeof(events.occurred)));
 assert(loaded_events.active[0].id==id&&loaded_events.active[0].remaining==1);
 for(i=0;i<REGION_COUNT;i++)counts[i]=regions[i].counts;
 advanced=disease;advanced.cycles++;saved_next=events;loaded_next=loaded_events;
 EventsAdvance(&saved_next,&advanced,counts,NULL);EventsAdvance(&loaded_next,&advanced,counts,NULL);
 expected_next=high_severity?event_catalog[id].next_true:event_catalog[id].next_false;
 assert(saved_next.active[0].id==expected_next&&loaded_next.active[0].id==expected_next);
 assert(saved_next.last_cycle==loaded_next.last_cycle&&saved_next.rng==loaded_next.rng);
 assert(!memcmp(saved_next.occurred,loaded_next.occurred,sizeof(saved_next.occurred)));
 assert(EventsValidate(&saved_next,&advanced)&&EventsValidate(&loaded_next,&advanced));
 puts(high_severity?"PASS: v3 active-chain roundtrip takes the severity branch before a partial-cycle transition":"PASS: v3 active-chain roundtrip takes the other branch before a partial-cycle transition");
}
static void ExpectEventCorruption(unsigned offset,uint8_t value) {
 uint8_t saved[20000];save_io_t io;
 memcpy(saved,mem.bytes,mem.size);mem.bytes[offset]=value;RepairChecksum();io=IO();
 assert(!ValidateSaveV3(&io,regions));memcpy(mem.bytes,saved,mem.size);
}
static void CheckCorruptEvents(void) {
 session_t session={0,0,0,0,0,0};event_state_t events;save_io_t io;
 InitMap();StartAt(42);EventsInit(&events,&disease,7);SaveV3(&session,&events);
 /* The record begins after the unchanged 78-byte v2 payload prefix. */
 ExpectEventCorruption(116,200); /* Active event ID outside the catalog. */
 ExpectEventCorruption(115,4);   /* Unsupported reshuffle mask. */
 ExpectEventCorruption(102,(uint8_t)(mem.bytes[102]|(1U<<5))); /* Chain child before root. */
 ExpectEventCorruption(82,43);   /* Scheduler last-cycle is ahead of disease. */
 /* An invalid event record must be rejected before touching the live map. */
 mem.bytes[116]=200;mem.bytes[117]=0;mem.bytes[118]=1;RepairChecksum();io=IO();
 { disease_t before=disease,target_d,target_before;uint8_t pixel=regions[0].data[0];session_t target_s={1,1,1,1,1,1};event_state_t target_events,before_events;
   memset(&target_d,0x3c,sizeof(target_d));target_before=target_d;memset(&target_events,0x5a,sizeof(target_events));before_events=target_events;
   assert(!DecodeSaveV3(&io,&target_d,&target_s,regions,ports,&target_events));
   assert(!memcmp(&before,&disease,sizeof(before)) && !memcmp(&target_d,&target_before,sizeof(target_d)));
   assert(!memcmp(&target_events,&before_events,sizeof(target_events)) && regions[0].data[0]==pixel && target_s.ticks==1);
 }
 puts("PASS: v3 rejects recomputed-checksum event ID, mask, chain, and timer corruption");
}
static void CheckV2ImportGrace(void) {
 session_t session={91,0,5,20,30,0},loaded_session={0};disease_t loaded={0};event_state_t events;save_io_t io;
 InitMap();StartAt(64);ResetMemory();io=IO();
 assert(EncodeSave(&io,&disease,&session,regions,ports));assert(mem.bytes[4]==2 && mem.size==SaveSize(regions));
 io=IO();assert(ValidateSave(&io,regions));assert(DecodeSave(&io,&loaded,&loaded_session,regions,ports));
 EventsInit(&events,&loaded,session.ticks^loaded.cycles^UINT32_C(0x68a31));
 assert(events.rng!=0 && events.last_cycle==loaded.cycles && events.next_start==loaded.cycles+24);
 for(unsigned i=0;i<WORLD_EVENT_SLOTS;i++)assert(events.active[i].id==EVENT_NONE);
 puts("PASS: v2 payload remains readable and event initialization gives imported runs 24-cycle grace");
}
int main(void) {
 CheckV3RoundtripAndPartialCycle(false);CheckV3RoundtripAndPartialCycle(true);CheckCorruptEvents();CheckV2ImportGrace();
 printf("All event-save checks passed. v3 save: %lu bytes.\n",(unsigned long)SaveSizeV3(regions));return 0;
}
