/* Focused native event/save fixture. Uses production main, FileIOC, and rules. */
#define main contagion_game_main
#include "../../src/main.c"
#undef main
#include <fileioc.h>

volatile uint16_t native_check;

static bool FileRead(void *context,void *out,size_t n) { return ti_Read(out,1,n,*(uint8_t *)context)==n; }
static bool FileWrite(void *context,const void *in,size_t n) { return ti_Write(in,1,n,*(uint8_t *)context)==n; }
static bool FileSeek(void *context,uint32_t offset) { return ti_Seek((int)offset,SEEK_SET,*(uint8_t *)context)!=EOF; }
static void Check(bool ok,uint16_t stage) {
 native_check=stage;
 if(!ok) {
  char message[40];native_check=0x8000U|stage;
  snprintf(message,sizeof(message),"FAIL EVENT/SAVE %u",stage);
  BeginScreen(message);gfx_SwapDraw();for(;;)kb_Scan();
 }
}
static void RemoveSaves(void) {
 ti_Delete(SAVE_NAME);ti_Delete(SAVE_BACKUP);ti_Delete(SAVE_TEMP);
}
static void StartRun(uint32_t cycle) {
 ResetGameState();disease.type=FUNGUS;disease.started=1;disease.cycles=cycle;
 memcpy(disease.name,"Pathogen",9);EventsInit(&world_events,&disease,UINT32_C(0x12345678));
 Check(SeedRegion(region,&disease,0,GameRandom),1);
 disease.cycles=cycle;EventsInit(&world_events,&disease,UINT32_C(0x12345678));
}
static void DiscoveredWithClosures(void) {
 disease.response=DISCOVERED;disease.discovery_cycle=disease.cycles?1:0;
 disease.discovery_pressure=DISCOVERY_LIMIT;port[0].closed=true;port[8].closed=true;
}
static void MarkOccurred(uint8_t id) { world_events.occurred[id/8]|=(uint8_t)(1U<<(id%8)); }
static void SetActive(uint8_t slot,uint8_t id,uint8_t r,uint8_t remaining) {
 world_events.active[slot].id=id;world_events.active[slot].region=r;
 world_events.active[slot].remaining=remaining;MarkOccurred(id);
}
static bool SameEvents(const event_state_t *a,const event_state_t *b) {
 return !memcmp(a,b,sizeof(*a));
}
static uint32_t HashVar(const char *name) {
 uint8_t h=ti_Open(name,"r"),buffer[32];uint32_t remaining,hash=UINT32_C(2166136261);
 if(!h)return 0;remaining=ti_GetSize(h);
 while(remaining){size_t i,n=remaining>sizeof(buffer)?sizeof(buffer):remaining;
  if(ti_Read(buffer,1,n,h)!=n){ti_Close(h);return 0;}
  for(i=0;i<n;i++){hash^=buffer[i];hash*=UINT32_C(16777619);}remaining-=(uint32_t)n;
 }
 ti_Close(h);return hash;
}
static void BreakPrimary(void) {
 uint8_t h=ti_Open(SAVE_NAME,"w"),bad=0;Check(h!=0,20);
 Check(ti_Write(&bad,1,1,h)==1,21);ti_Close(h);
}
static void CheckFileRoundtripAndBackup(void) {
 disease_t expected;session_t expected_session;event_state_t expected_events;uint8_t i;
 RemoveSaves();StartRun(40);DiscoveredWithClosures();session.next_region=3;session.ticks=245;
 for(i=0;i<4;i++)SetActive(i,i,i,event_catalog[i].duration);
 RefreshEffects();Check(EventsValidate(&world_events,&disease),10);
 Check(SaveData(),11);expected=disease;expected_session=session;expected_events=world_events;
 session.ticks++;Check(SaveData(),12);BreakPrimary();ResetGameState();Check(LoadData(),13);
 Check(!memcmp(&disease,&expected,sizeof(disease)),14);
 Check(!memcmp(&session,&expected_session,sizeof(session)),15);
 Check(SameEvents(&world_events,&expected_events),16);
 Check(port[0].closed&&port[8].closed,17);
}
static void CheckLegacyImport(void) {
 save_io_t io;uint8_t h;uint32_t original_hash;disease_t expected;session_t expected_session;
 RemoveSaves();ti_Delete("CNTGN2");ti_Delete("CNTGN2B");StartRun(37);
 session.next_region=3;session.ticks=987;h=ti_Open("CNTGN2","w");Check(h!=0,31);
 io.context=&h;io.read=FileRead;io.write=FileWrite;io.seek=FileSeek;io.size=0;
 Check(EncodeSave(&io,&disease,&session,region,port),32);
 ti_Close(h);
 original_hash=HashVar("CNTGN2");Check(original_hash!=0,33);
 expected=disease;expected_session=session;ResetGameState();Check(HasLegacySave(),34);
 Check(ImportLegacySave(),35);Check(!memcmp(&disease,&expected,sizeof(disease)),36);
 Check(!memcmp(&session,&expected_session,sizeof(session)),37);
 Check(world_events.rng!=0&&world_events.next_start==disease.cycles+24,38);
 Check(SaveData(),39);Check(HashVar("CNTGN2")==original_hash,40);
 expected=disease;expected_session=session;{event_state_t saved=world_events;
  ResetGameState();Check(LoadData(),41);Check(!memcmp(&disease,&expected,sizeof(disease)),42);
  Check(!memcmp(&session,&expected_session,sizeof(session)),43);Check(SameEvents(&world_events,&saved),44);
 }
}
static void Own(uint8_t trait) { disease.owned[trait/32]|=UINT32_C(1)<<(trait%32); }
static uint8_t SeverityBranch(void) {
 uint8_t root;
 for(root=100;root<200;root=(uint8_t)(root+5)) {
  const event_def_t *e=&event_catalog[root+1];
  if(e->branch==BR_SEVERITY&&e->next_true!=EVENT_NONE&&e->next_false!=EVENT_NONE)return root+1;
 }
 return EVENT_NONE;
}
static void PrepareChain(uint8_t id,uint8_t remaining) {
 uint8_t root=(uint8_t)(100+(id-100)/5*5);
 MarkOccurred(root);SetActive(0,id,0,remaining);
}
static void CheckChainBranch(bool high_severity) {
 disease_t expected;session_t expected_session;event_state_t expected_events;counts_t counts[REGION_COUNT];uint8_t i,id=SeverityBranch();
 Check(id!=EVENT_NONE,49);
 RemoveSaves();StartRun(48);DiscoveredWithClosures();
 if(high_severity){Own(COUGH);Own(SNEEZING);Own(PNEUMONIA);Own(RESP_FAILURE);}
 PrepareChain(id,1);RefreshEffects();Check(EventsValidate(&world_events,&disease),50);
 Check(SaveData(),51);expected=disease;expected_session=session;expected_events=world_events;
 ResetGameState();Check(LoadData(),52);Check(!memcmp(&disease,&expected,sizeof(disease)),53);
 Check(!memcmp(&session,&expected_session,sizeof(session)),54);Check(SameEvents(&world_events,&expected_events),55);
 disease.cycles++;for(i=0;i<REGION_COUNT;i++)counts[i]=region[i].counts;
 EventsAdvance(&world_events,&disease,counts,NULL);
 Check(world_events.active[0].id==(high_severity?event_catalog[id].next_true:event_catalog[id].next_false),high_severity?56:57);
 Check(EventsValidate(&world_events,&disease),58);Check(port[0].closed&&port[8].closed,59);
 Check(SaveData(),60);expected_events=world_events;ResetGameState();Check(LoadData(),61);
 Check(SameEvents(&world_events,&expected_events),62);Check(port[0].closed&&port[8].closed,63);
}
static void CheckStandaloneExpiry(void) {
 counts_t counts[REGION_COUNT];uint8_t i;
 RemoveSaves();StartRun(60);DiscoveredWithClosures();SetActive(0,0,0,1);
 RefreshEffects();Check(EventsValidate(&world_events,&disease),65);Check(SaveData(),66);
 ResetGameState();Check(LoadData(),67);disease.cycles++;
 for(i=0;i<REGION_COUNT;i++)counts[i]=region[i].counts;
 EventsAdvance(&world_events,&disease,counts,NULL);
 Check(world_events.active[0].id==EVENT_NONE&&EventsOccurred(&world_events,0),68);
 Check(SaveData(),69);ResetGameState();Check(LoadData(),70);Check(EventsValidate(&world_events,&disease),71);
}
static void CheckChainCancellation(void) {
 counts_t counts[REGION_COUNT];size_t j;uint8_t i;
 uint8_t id=SeverityBranch();Check(id!=EVENT_NONE,72);
 RemoveSaves();StartRun(64);DiscoveredWithClosures();
 for(j=0;j<(size_t)region[0].width*region[0].height;j++)
  if(region[0].data[j]!=CELL_EMPTY)region[0].data[j]=CELL_DEAD;
 RecountRegion(&region[0]);Check(SeedRegion(region,&disease,1,GameRandom),70);
 disease.seen_regions|=(uint8_t)(1U<<1);PrepareChain(id,event_catalog[id].duration);
 RefreshEffects();Check(EventsValidate(&world_events,&disease),73);Check(SaveData(),74);
 ResetGameState();Check(LoadData(),75);disease.cycles++;
 for(i=0;i<REGION_COUNT;i++)counts[i]=region[i].counts;
 EventsAdvance(&world_events,&disease,counts,NULL);
 Check(world_events.active[0].id==EVENT_NONE&&EventsOccurred(&world_events,id),76);
 Check(port[0].closed&&port[8].closed,77);Check(SaveData(),78);
 ResetGameState();Check(LoadData(),79);Check(port[0].closed&&port[8].closed,80);
 Check(EventsValidate(&world_events,&disease),81);
}
static void SetupMenuFixture(void) {
 uint8_t i,ids[4],long_description=EVENT_NONE,long_name=EVENT_NONE;
 size_t description_length=0,name_length=0;StartRun(80);session.next_region=3;session.ticks=321;
 for(i=0;i<100;i++)if(event_catalog[i].chain==EVENT_NONE) {
  size_t n=strlen(event_catalog[i].description);
  if(n>description_length){description_length=n;long_description=i;}
 }
 for(i=0;i<100;i++)if(event_catalog[i].chain==EVENT_NONE && i!=long_description) {
  size_t n=strlen(event_catalog[i].name);
  if(n>name_length){name_length=n;long_name=i;}
 }
 Check(long_description!=EVENT_NONE&&long_name!=EVENT_NONE,90);
 ids[0]=long_description;ids[1]=long_name;ids[2]=ids[3]=EVENT_NONE;
 for(i=0;i<100;i++)if(event_catalog[i].chain==EVENT_NONE && i!=ids[0] && i!=ids[1]) {
  if(ids[2]==EVENT_NONE)ids[2]=i;else if(ids[3]==EVENT_NONE){ids[3]=i;break;}
 }
 Check(ids[2]!=EVENT_NONE&&ids[3]!=EVENT_NONE,91);
 for(i=0;i<4;i++)SetActive(i,ids[i],i,event_catalog[ids[i]].duration);
 RefreshEffects();Check(EventsValidate(&world_events,&disease),95);
}
int main(void) {
 gfx_Begin();gfx_SetDrawBuffer();gfx_SetTransparentColor(0);gfx_SetTextTransparentColor(0);
 InitializeMap();ResetGameState();srand(1);
 CheckFileRoundtripAndBackup();CheckLegacyImport();
 CheckChainBranch(false);CheckChainBranch(true);CheckStandaloneExpiry();CheckChainCancellation();
 SetupMenuFixture();native_check=1000;
 BeginScreen("PASS: EVENT AND SAVE CHECKS");
 Text("FileIOC v3 backup and v2 import",8,52);
 Text("Both chain branches, expiry and cancel",8,76);
 Text("Closed ports persist",8,100);gfx_SwapDraw();WaitKey();ActionsMenu();
 native_check=2000;BeginScreen("PASS: EVENT MENU CHECKS");gfx_SwapDraw();for(;;)kb_Scan();
}
