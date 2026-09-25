/* CONTAGION CE 2.0: original calculator sprite engine by epsilon5/EverydayCode. */
#include "contagion.h"
#include "sprites/sprites.h"
#include <sys/timers.h>
#include <sys/rtc.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

disease_t disease;
effects_t effects;
region_t region[REGION_COUNT];
port_t port[PORT_COUNT];
session_t session;
static bool canpress;
static bool connection;
static uint8_t source_port,destination_port;
static gfx_sprite_t * const map_sprites[REGION_COUNT]={africa,asia,europe,greenland,northamerica,southamerica,oceania};
/* Tiny bounded FIFO: no allocations or repeated discovery events. */
static const char * const responses[4]={"Undetected","Discovered","Research underway","Escalating response"};

uint16_t GameRandom(uint16_t limit) { return limit?(uint16_t)randInt(0,limit-1):0; }
/* Inspect the scan we already completed, without starting another scan. */
static bool ScannedKeyDown(void) {
 uint8_t row;
 for(row=1;row<8;row++) if(kb_Data[row]) return true;
 return false;
}
uint8_t ReadKey(void) {
 kb_Scan();
 if(kb_Data[6]&kb_Clear) return KEY_CLEAR;
 if(kb_Data[1]&kb_Graph) return KEY_GRAPH;
 if(kb_Data[6]&kb_Enter) return KEY_ENTER;
 if(kb_Data[1]&kb_Yequ) return KEY_PREVIOUS;
 if(kb_Data[1]&kb_Window) return KEY_NEXT;
 if(kb_Data[1]&kb_Zoom) return KEY_ZOOM;
 if(kb_Data[1]&kb_Del) return KEY_DELETE;
 if(kb_Data[1]&kb_Mode) return KEY_MODE;
 if(kb_Data[7]&kb_Left) return KEY_LEFT;
 if(kb_Data[7]&kb_Right) return KEY_RIGHT;
 if(kb_Data[7]&kb_Up) return KEY_UP;
 if(kb_Data[7]&kb_Down) return KEY_DOWN;
 return ScannedKeyDown()?KEY_OTHER:KEY_NONE;
}
void ReleaseKeys(void) { do { kb_Scan(); } while(ScannedKeyDown()); canpress=true; }
uint8_t WaitKey(void) { uint8_t key; ReleaseKeys(); do { key=ReadKey(); } while(key==KEY_NONE); return key; }
void EndModal(void) { ReleaseKeys(); timer_1_Counter=0; }
bool MenuMove(uint8_t key, uint8_t *selected, uint8_t count) {
 if(key==KEY_UP) { *selected=(*selected+count-1)%count; return true; }
 if(key==KEY_DOWN) { *selected=(*selected+1)%count; return true; }
 return false;
}
void MenuItem(const char *label, int y, bool selected) {
 if(selected) { gfx_SetColor(224); gfx_Rectangle(6,y-4,308,19); }
 Text(selected?">":" ",10,y); Text(label,24,y);
}
uint8_t ChooseMenu(const char *title, const char * const *items, uint8_t count, uint8_t selected) {
 uint8_t i,key;
 for(;;) {
  BeginScreen(title);
  for(i=0;i<count;i++) MenuItem(items[i],42+i*24,i==selected);
  Text("Up/Down: select   Enter: confirm",8,211); Text("Clear: back",8,226);
  gfx_SwapDraw(); key=WaitKey();
  if(key==KEY_CLEAR) { EndModal(); return 255; }
  if(key==KEY_ENTER) { EndModal(); return selected; }
  MenuMove(key,&selected,count);
 }
}
void Text(const char *text, int x, int y) { gfx_SetTextFGColor(255); gfx_PrintStringXY(text,x,y); }
void BeginScreen(const char *title) {
 gfx_SetDrawBuffer(); gfx_FillScreen(0); gfx_SetTextScale(1,1); gfx_SetTextBGColor(0); gfx_SetTextTransparentColor(0);
 gfx_SetColor(224); gfx_FillRectangle(0,0,320,19); Text(title,8,5);
}
void WrapText(const char *text, int x, int y, int width, uint8_t lines) {
 char line[48];
 while(*text && lines--) {
  size_t n=0,last_space=0;
  while(text[n] && n<sizeof(line)-1) {
   line[n]=text[n]; line[n+1]=0;
   if(gfx_GetStringWidth(line)>(unsigned)width) break;
   if(text[n]==' ') last_space=n;
   n++;
  }
  if(text[n] && last_space) n=last_space;
  if(!n) n=1;
  memcpy(line,text,n); line[n]=0; Text(line,x,y); y+=12;
  text+=n; while(*text==' ') text++;
 }
}
void Message(const char *title, const char *message) {
 BeginScreen(title); WrapText(message,8,48,304,10); MenuItem("Back (Enter / Clear)",222,true); gfx_SwapDraw();
 for(;;) { uint8_t key=WaitKey(); if(key==KEY_ENTER || key==KEY_CLEAR) break; }
 ReleaseKeys(); timer_1_Counter=0;
}
static void InitializeMap(void) {
 uint8_t i;
 static const char * const names[REGION_COUNT]={"Africa","Asia","Europe","Greenland","North America","South America","Oceania"};
 static const uint8_t x[REGION_COUNT]={58,84,63,45,0,24,126},y[REGION_COUNT]={41,18,23,17,21,57,65};
 for(i=0;i<REGION_COUNT;i++) {
  region[i].name=names[i]; region[i].x=x[i]; region[i].y=y[i];
  region[i].width=map_sprites[i]->width; region[i].height=map_sprites[i]->height;
  region[i].data=map_sprites[i]->data;
 }
}
void ResetGameState(void) {
 uint8_t i; size_t j;
 for(i=0;i<REGION_COUNT;i++) {
  for(j=0;j<(size_t)region[i].width*region[i].height;j++) if(region[i].data[j]!=CELL_EMPTY) region[i].data[j]=CELL_HEALTHY;
  RecountRegion(&region[i]);
 }
 ResetDisease(&disease); memset(&session,0,sizeof(session)); memcpy(port,port_definitions,sizeof(port));
 CalculateEffects(&disease,&effects);
 connection=false; source_port=destination_port=0; canpress=false;
 TickerInit(&disease);
}
static void DrawMap(void) {
 uint8_t i; gfx_FillScreen(18);
 for(i=0;i<REGION_COUNT;i++) gfx_ScaledTransparentSprite_NoClip(map_sprites[i],region[i].x*WORLD_SCALE,region[i].y*WORLD_SCALE,WORLD_SCALE,WORLD_SCALE);
}
static void DrawTransportation(void) {
 uint8_t i;
 gfx_SetColor(7);
 if(connection) gfx_Line(port[source_port].x*2,port[source_port].y*2,port[destination_port].x*2,port[destination_port].y*2);
 for(i=0;i<PORT_COUNT;i++) {
  gfx_SetColor(port[i].closed?64:7);
  if(port[i].modes&PORT_AIR) gfx_FillTriangle(port[i].x*2,port[i].y*2-3,port[i].x*2-3,port[i].y*2+3,port[i].x*2+3,port[i].y*2+3);
  if(port[i].modes&PORT_SEA) gfx_Rectangle(port[i].x*2-3,port[i].y*2-3,7,7);
  if(port[i].closed) { gfx_SetColor(255); gfx_Line(port[i].x*2-3,port[i].y*2-3,port[i].x*2+3,port[i].y*2+3); }
 }
}
static void RenderHUD(void) {
 char line[80]; counts_t c=CountWorld(region); uint16_t total=LandCount(c);
 gfx_SetColor(0); gfx_FillRectangle(0,0,320,34); gfx_FillRectangle(0,204,320,36);
 snprintf(line,sizeof(line),"DNA %u   Cure %u%%   Cycle %lu",disease.dna,disease.cure/100,(unsigned long)disease.cycles); Text(line,4,4);
 if(ticker.count) TickerRender();
 else Text(responses[disease.response],4,20);
 snprintf(line,sizeof(line),"%s: active %u%%  dead %u%%",region[session.selected].name,Percentage(region[session.selected].counts.active,LandCount(region[session.selected].counts)),Percentage(region[session.selected].counts.dead,LandCount(region[session.selected].counts))); Text(line,4,207);
 snprintf(line,sizeof(line),"World affected %u%%   dead %u%%",Percentage(c.active+c.dead,total),Percentage(c.dead,total)); Text(line,4,219);
 Text("Arrows: region   Enter/Clear: actions",4,231);
}
void UpdateSelectedRegion(void) {
    //ripped from OPTIX
    int tryx;
    int tryy;
    uint8_t closestbutton;
    int closestbuttonscore;
    int buttonscore;
    uint8_t i;
    int buttonsensitivity = 3;
    region_t *c;
    i = 0;
    tryx = 0;
    tryy = 0;
    closestbuttonscore = 10000;
    closestbutton = 0;
    buttonscore = 0;
    if (canpress) {
        kb_Scan();
        if (kb_Data[7] & kb_Left) tryx--;
        if (kb_Data[7] & kb_Right) tryx++;
        if (kb_Data[7] & kb_Up) tryy--;
        if (kb_Data[7] & kb_Down) tryy++;
        if (tryx == 0 && tryy == 0) return;
        c = &region[session.selected];
        for (i = 0; i < REGION_COUNT; i++) {
            region_t *b = &region[i];
            if (tryx == -1) {
                if (b->x < c->x) buttonscore = (c->x - b->x) + (abs(b->y - c->y)) * buttonsensitivity;
                else buttonscore = 10000;
            } else if (tryx == 1) {
                if (b->x > c->x) buttonscore = (b->x - c->x) + (abs(b->y - c->y)) * buttonsensitivity;
                else buttonscore = 10000;
            } else if (tryy == -1) {
                if (b->y < c->y) buttonscore = (c->y - b->y) + (abs(b->x - c->x)) * buttonsensitivity;
                else buttonscore = 10000;
            } else if (tryy == 1) {
                if (b->y > c->y) buttonscore = (b->y - c->y) + (abs(b->x - c->x)) * buttonsensitivity;
                else buttonscore = 10000;
            } else closestbuttonscore = 10000;
            if (buttonscore < closestbuttonscore) {
                closestbutton = i;
                closestbuttonscore = buttonscore;
            }
        }
        if (closestbuttonscore < 5000) session.selected = closestbutton;
        canpress = false;
    }
}

static bool NameDisease(void) {
 static const char alphabet[]="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -";
 uint8_t selected=0,key,i,length=0; char line[40];
 memset(disease.name,0,sizeof(disease.name));
 for(;;) {
  BeginScreen("NAME YOUR DISEASE"); Text(disease.name,8,35);
  for(i=0;i<sizeof(alphabet)-1;i++) {
   char letter[2]={alphabet[i],0}; int x=15+(i%10)*30,y=70+(i/10)*28;
   if(i==selected) { gfx_SetColor(224); gfx_Rectangle(x-4,y-4,19,18); }
   Text(letter,x,y);
  }
  MenuItem("Done",181,selected==38);
  snprintf(line,sizeof(line),"%u/19 characters   Del: erase",length); Text(line,8,199);
  Text("Arrows: select   Enter: add / done",8,215); Text("Clear: cancel",8,229);
  gfx_SwapDraw(); key=WaitKey();
  if(key==KEY_CLEAR) return false;
  if(key==KEY_LEFT && selected<38) selected=selected?selected-1:37;
  if(key==KEY_RIGHT && selected<38) selected=(selected+1)%38;
  if(key==KEY_UP) selected=selected==38?30:selected>=10?selected-10:selected;
  if(key==KEY_DOWN) selected=selected+10<38?selected+10:38;
  if(key==KEY_ENTER && selected==38) { if(!length) strcpy(disease.name,"Pathogen"); return true; }
  if(key==KEY_ENTER && length<19) { disease.name[length++]=alphabet[selected]; disease.name[length]=0; }
  if(key==KEY_DELETE && length) disease.name[--length]=0;
 }
}
static bool StartGame(void) {
 uint8_t key,type=BACTERIA,i;
 const char * const descriptions[3]={"Balanced. No automatic mutations. Recommended for your first outbreak.","Free symptom mutations can help spread, but raise discovery risk. Devolution costs more.","Weaker human travel. Three paid spore bursts can seed any region with healthy land."};
 for(;;) {
  BeginScreen("NEW GAME: DISEASE TYPE");
  for(i=0;i<3;i++) { if(i==type) { gfx_SetColor(224); gfx_Rectangle(6,35+i*24,304,20); } Text(disease_names[i],14,41+i*24); }
  WrapText(descriptions[type],8,122,304,5); Text("Up/Down: type   Enter: choose",8,209); Text("Clear: cancel",8,225);
  gfx_SwapDraw(); key=WaitKey();
  if(key==KEY_CLEAR) return false;
  if(key==KEY_UP) type=(type+2)%3;
  if(key==KEY_DOWN) type=(type+1)%3;
  if(key==KEY_ENTER) break;
 }
 /* New game is a full reset, including any previous completed run. */
 ResetGameState(); disease.type=type; CalculateEffects(&disease,&effects);
 if(!NameDisease()) { ResetGameState(); return false; }
 session.cursorx=80; session.cursory=60;
 for(;;) {
  DrawMap(); gfx_SetColor(0); gfx_FillRectangle(0,0,320,32); gfx_FillRectangle(0,215,320,25);
  Text("Select healthy land for your first case.",4,5); Text("Arrows: move  Enter: seed  Clear: cancel",4,219);
  gfx_SetColor(224); gfx_Circle(session.cursorx*2,session.cursory*2,4); gfx_SwapDraw();
  key=WaitKey();
  if(key==KEY_CLEAR) { ResetGameState(); return false; }
  if(key==KEY_LEFT && session.cursorx) session.cursorx--;
  if(key==KEY_RIGHT && session.cursorx<159) session.cursorx++;
  if(key==KEY_UP && session.cursory) session.cursory--;
  if(key==KEY_DOWN && session.cursory<119) session.cursory++;
  if(key==KEY_ENTER && InfectCoordinate(region,&disease,session.cursorx,session.cursory)) break;
 }
 for(i=0;i<REGION_COUNT;i++) if(disease.seen_regions&(1U<<i)) session.selected=i;
 disease.started=1; ReleaseKeys(); timer_1_Counter=0; return true;
}
static void CompleteCycle(void) {
 uint8_t i,event,mutation,closed,previously_closed=0,restricted_regions=0,last_closed=0; counts_t counts[REGION_COUNT];
 Migrate(region,&disease,&effects,GameRandom);
 mutation=Mutate(&disease,GameRandom);
 if(mutation!=NO_TRAIT) { CalculateEffects(&disease,&effects); TickerPost(NEWS_MUTATION,mutation,0); }
 for(i=0;i<REGION_COUNT;i++) counts[i]=region[i].counts;
 event=AdvanceDisease(&disease,counts,&effects);
 if(event&EVENT_DISCOVERY) TickerPost(NEWS_DISCOVERY,0,0);
 if(event&EVENT_RESEARCH) TickerPost(NEWS_RESEARCH,0,0);
 if(event&EVENT_RESPONSE) TickerPost(NEWS_RESPONSE,0,0);
 if(event&EVENT_CURE25) TickerPost(NEWS_CURE,0,25);
 if(event&EVENT_CURE50) TickerPost(NEWS_CURE,0,50);
 if(event&EVENT_CURE75) TickerPost(NEWS_CURE,0,75);
 if(event&EVENT_CURE90) TickerPost(NEWS_CURE,0,90);
 for(i=0;i<PORT_COUNT;i++) if(port[i].closed) previously_closed|=1U<<port[i].region;
 closed=ClosePorts(region,port,&disease,&effects,GameRandom)&~previously_closed;
 for(i=0;i<REGION_COUNT;i++) if(closed&(1U<<i)) { restricted_regions++; last_closed=i; }
 if(restricted_regions) TickerPost(NEWS_CLOSURE,last_closed,restricted_regions);
 TickerObserve(&disease,counts);
}
static uint8_t SaveExit(uint8_t destination) {
 static const char * const choices[]={"Return to game/menu","Retry save","Quit Without Saving"};
 if(SaveData()) return destination;
 for(;;) {
  uint8_t choice=ChooseMenu("SAVE FAILED: FREE CALCULATOR RAM",choices,3,0);
  if(choice==255 || choice==0) return 0;
  if(choice==1 && SaveData()) return destination;
  if(choice==2) {
   static const char * const confirm[]={"Go back","Quit Without Saving"};
   if(ChooseMenu("DISCARD UNSAVED PROGRESS?",confirm,2,0)==1) return 2;
  }
 }
}
uint8_t ActionsMenu(void) {
 uint8_t selected=0,key,i,result,count=disease.type==FUNGUS?7:6;
 char spore[64]; const char *items[7];
 for(;;) {
  items[0]="Resume"; items[1]="Evolution"; items[2]="Region Details";
  items[3]=session.view?"Travel View: ON (toggle)":"Travel View: OFF (toggle)";
  if(disease.spores_used<3) snprintf(spore,sizeof(spore),"Spore Burst: %u left, %u DNA",3-disease.spores_used,spore_costs[disease.spores_used]);
  else strcpy(spore,"Spore Burst: no charges left");
  if(disease.type==FUNGUS) items[4]=spore;
  items[count-2]="Save & Main Menu"; items[count-1]="Save & Quit";
  BeginScreen("PAUSED: ACTIONS");
  for(i=0;i<count;i++) MenuItem(items[i],38+i*24,i==selected);
  Text("Up/Down: select   Enter: confirm",8,211); Text("Clear: resume",8,226);
  gfx_SwapDraw(); key=WaitKey();
  if(key==KEY_CLEAR || (key==KEY_ENTER && selected==0)) { EndModal(); return 0; }
  if(MenuMove(key,&selected,count) || key!=KEY_ENTER) continue;
  if(selected==1) EvolutionMenu();
  else if(selected==2) RegionInfo();
  else if(selected==3) session.view^=1;
  else if(selected==4 && disease.type==FUNGUS) SporeMenu();
  else {
   result=SaveExit(selected==count-1?2:1);
   if(result) { EndModal(); return result; }
  }
 }
}
static bool Play(void) {
 ReleaseKeys(); timer_1_Counter=0;
 while(disease.result==PLAYING) {
  uint8_t key=ReadKey(); bool completed;
  if(key==KEY_NONE) canpress=true;
  if(canpress) {
   if(key==KEY_CLEAR || key==KEY_ENTER) {
    uint8_t destination=ActionsMenu();
    if(destination) return destination==2;
   }
   else if(key>=KEY_LEFT && key<=KEY_DOWN) UpdateSelectedRegion();
   if(key!=KEY_NONE) canpress=false;
  }
  completed=StepWorldRegion(region,&session.next_region,&effects,GameRandom);
  connection=Transport(region,port,&disease,&effects,GameRandom,&source_port,&destination_port);
  if(completed) CompleteCycle();
  DrawMap();
  if(session.view) DrawTransportation();
  else { gfx_SetColor(224); gfx_Rectangle(region[session.selected].x*2,region[session.selected].y*2,region[session.selected].width*2,region[session.selected].height*2); }
  RenderHUD(); gfx_SwapDraw();
  TickerUpdate(timer_1_Counter);
  if(UINT32_MAX-session.ticks>timer_1_Counter) session.ticks+=timer_1_Counter;
  else session.ticks=UINT32_MAX;
  timer_1_Counter=0;
 }
 if(!SaveData()) Message("SAVE FAILED","Unable to save. Your last validated save is retained. Free calculator storage and try again.");
 if(disease.result!=PLAYING) ResultScreen();
 ReleaseKeys();
 return false;
}
int main(void) {
 bool done=false; uint8_t key,selected=0,count,i;
 srand(rtc_Time()); gfx_Begin(); gfx_SetDrawBuffer(); gfx_SetTransparentColor(0); gfx_SetTextTransparentColor(0);
 InitializeMap(); ResetGameState(); LoadData(); TickerInit(&disease);
 timer_Control=TIMER1_ENABLE|TIMER1_32K|TIMER1_UP;
 while(!done) {
  BeginScreen("CONTAGION CE 2.0");
  Text("Seven regions. One extinction objective.",8,42);
  WrapText("Spread quietly, earn DNA, then evolve lethal symptoms before humanity completes its cure.",8,69,304,4);
  const char *items[3];
  count=disease.started?3:2; items[0]="New Game";
  if(disease.started) items[1]=disease.result==PLAYING?"Continue":"Results";
  items[count-1]="Save & Quit";
  if(selected>=count) selected=0;
  for(i=0;i<count;i++) MenuItem(items[i],130+i*24,i==selected);
  Text("Up/Down: select   Enter: confirm",8,207);
  Text("Clear: select Save & Quit",8,224);
  gfx_SwapDraw(); key=WaitKey();
  if(key==KEY_CLEAR) selected=count-1;
  else if(!MenuMove(key,&selected,count) && key==KEY_ENTER) {
   if(selected==0) { if(StartGame()) done=Play(); }
   else if(selected==count-1) done=SaveExit(2)==2;
   else if(disease.result!=PLAYING) ResultScreen();
   else done=Play();
   selected=disease.started?1:0;
  }
 }
 gfx_End(); return 0;
}
