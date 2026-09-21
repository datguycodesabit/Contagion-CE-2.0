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
static char news[8][48];
static uint8_t news_head,news_count,news_age;
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
 BeginScreen(title); WrapText(message,8,48,304,12); Text("Enter / Clear: return",8,222); gfx_SwapDraw();
 for(;;) { uint8_t key=WaitKey(); if(key==KEY_ENTER || key==KEY_CLEAR) break; }
 ReleaseKeys(); timer_1_Counter=0;
}
void QueueNews(const char *text) {
 if(news_count<8) { snprintf(news[(news_head+news_count)%8],48,"%s",text); news_count++; }
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
 news_head=news_count=news_age=0; memset(news,0,sizeof(news));
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
 if(news_count) {
  Text(news[news_head],4,20);
  if(++news_age>=100) { news_age=0; news_head=(news_head+1)%8; news_count--; }
 } else Text(responses[disease.response],4,20);
 snprintf(line,sizeof(line),"%s: active %u%%  dead %u%%",region[session.selected].name,Percentage(region[session.selected].counts.active,LandCount(region[session.selected].counts)),Percentage(region[session.selected].counts.dead,LandCount(region[session.selected].counts))); Text(line,4,207);
 snprintf(line,sizeof(line),"World affected %u%%   dead %u%%",Percentage(c.active+c.dead,total),Percentage(c.dead,total)); Text(line,4,219);
 Text("Graph: evolve  Enter: info  Mode: routes",4,231);
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
  snprintf(line,sizeof(line),"%u/19 characters",length); Text(line,8,186);
  Text("Arrows: select   Enter: add   Del: erase",8,207); Text("Zoom: done   Clear: cancel",8,224);
  gfx_SwapDraw(); key=WaitKey();
  if(key==KEY_CLEAR) return false;
  if(key==KEY_LEFT) selected=selected?selected-1:37;
  if(key==KEY_RIGHT) selected=(selected+1)%38;
  if(key==KEY_UP) selected=selected>=10?selected-10:selected;
  if(key==KEY_DOWN) selected=selected+10<38?selected+10:selected;
  if(key==KEY_ENTER && length<19) { disease.name[length++]=alphabet[selected]; disease.name[length]=0; }
  if(key==KEY_DELETE && length) disease.name[--length]=0;
  if(key==KEY_ZOOM) { if(!length) strcpy(disease.name,"Pathogen"); return true; }
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
 uint8_t i,event,mutation,closed,previously_closed=0,restricted_regions=0; counts_t counts[REGION_COUNT]; char line[48];
 Migrate(region,&disease,&effects,GameRandom);
 mutation=Mutate(&disease,GameRandom);
 if(mutation!=NO_TRAIT) { CalculateEffects(&disease,&effects); snprintf(line,sizeof(line),"Mutation: %s",traits[mutation].name); QueueNews(line); }
 for(i=0;i<REGION_COUNT;i++) counts[i]=region[i].counts;
 event=AdvanceDisease(&disease,counts,&effects);
 if(event&EVENT_DISCOVERY) QueueNews("Outbreak discovered.");
 if(event&EVENT_RESEARCH) QueueNews("Cure research has begun.");
 if(event&EVENT_RESPONSE) QueueNews("Public response is escalating.");
 if(event&EVENT_CURE25) QueueNews("Cure milestone: 25%.");
 if(event&EVENT_CURE50) QueueNews("Cure milestone: 50%.");
 if(event&EVENT_CURE75) QueueNews("Cure milestone: 75%.");
 if(event&EVENT_CURE90) QueueNews("Cure milestone: 90%.");
 for(i=0;i<PORT_COUNT;i++) if(port[i].closed) previously_closed|=1U<<port[i].region;
 closed=ClosePorts(region,port,&disease,&effects,GameRandom)&~previously_closed;
 for(i=0;i<REGION_COUNT;i++) if(closed&(1U<<i)) restricted_regions++;
 if(restricted_regions) { snprintf(line,sizeof(line),"New travel restrictions: %u regions.",restricted_regions); QueueNews(line); }
}
static void Play(void) {
 ReleaseKeys(); timer_1_Counter=0;
 while(disease.result==PLAYING) {
  uint8_t key=ReadKey(); bool completed;
  if(key==KEY_NONE) canpress=true;
  if(canpress) {
   if(key==KEY_CLEAR) break;
   if(key==KEY_GRAPH) EvolutionMenu();
   else if(key==KEY_ENTER) RegionInfo();
   else if(key==KEY_MODE) session.view^=1;
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
  if(UINT32_MAX-session.ticks>timer_1_Counter) session.ticks+=timer_1_Counter;
  else session.ticks=UINT32_MAX;
  timer_1_Counter=0;
 }
 if(!SaveData()) Message("SAVE FAILED","Unable to save. Your last validated save is retained. Free calculator storage and try again.");
 if(disease.result!=PLAYING) ResultScreen();
 ReleaseKeys();
}
int main(void) {
 bool done=false; uint8_t key;
 srand(rtc_Time()); gfx_Begin(); gfx_SetDrawBuffer(); gfx_SetTransparentColor(0); gfx_SetTextTransparentColor(0);
 InitializeMap(); ResetGameState(); LoadData();
 timer_Control=TIMER1_ENABLE|TIMER1_32K|TIMER1_UP;
 while(!done) {
  BeginScreen("CONTAGION CE 2.0");
  Text("Seven regions. One extinction objective.",8,42);
  WrapText("Spread quietly, earn DNA, then evolve lethal symptoms before humanity completes its cure.",8,69,304,4);
  Text("Y=: New Game",8,130);
  Text(disease.started?"Zoom: Continue / Results":"Zoom: Start",8,153);
  Text("Graph / Clear: Save and Quit",8,176);
  Text("Old version-1 runs remain untouched.",8,215);
  gfx_SwapDraw(); key=WaitKey();
  if(key==KEY_PREVIOUS) { if(StartGame()) Play(); }
  else if(key==KEY_ZOOM) {
   if(!disease.started) { if(StartGame()) Play(); }
   else if(disease.result!=PLAYING) ResultScreen();
   else Play();
  } else if(key==KEY_GRAPH || key==KEY_CLEAR) {
   if(SaveData()) done=true;
   else {
    BeginScreen("SAVE FAILED");
    WrapText("Your last validated save is retained. There may be insufficient calculator storage.",8,48,304,5);
    Text("Enter: return and retry later",8,184);
    Text("Clear: quit WITHOUT saving this run",8,210);
    gfx_SwapDraw();
    do { key=WaitKey(); } while(key!=KEY_ENTER && key!=KEY_CLEAR);
    done=key==KEY_CLEAR;
   }
  }
 }
 gfx_End(); return 0;
}
