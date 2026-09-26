#include "contagion.h"
#include <stdio.h>
static const char * const effect_names[]={"None","Local spread","Air travel","Sea travel","Bird migration","Regional discovery","Regional research","Air travel blocked","Sea travel blocked"};
static void EventDetail(uint8_t slot) {
 const active_event_t *a=&world_events.active[slot];const event_def_t *e=&event_catalog[a->id];char line[80];uint8_t i;
 BeginScreen("WORLD EVENT DETAILS");WrapText(e->name,8,27,304,2);
 snprintf(line,sizeof(line),"%s: %u cycles left",region[a->region].name,a->remaining);Text(line,8,54);
 WrapText(e->description,8,72,304,4);
 for(i=0;i<2;i++) {
  const event_effect_t *f=&e->effect[i];if(f->kind==EV_NONE)continue;
  if(f->kind>=EV_BLOCK_AIR)snprintf(line,sizeof(line),"%s",effect_names[f->kind]);
  else if(f->trait!=EVENT_NONE)snprintf(line,sizeof(line),"%s spread bonus: %+d%%",traits[f->trait].name,Owns(&disease,f->trait)?EventAmount(e,f,&disease):0);
  else snprintf(line,sizeof(line),"%s: %+d%%",effect_names[f->kind],EventAmount(e,f,&disease));
  Text(line,8,124+i*12);
 }
 if(e->mitigate!=EVENT_NONE) { snprintf(line,sizeof(line),"Counter: %s%s",traits[e->mitigate].name,Owns(&disease,e->mitigate)?" (active)":"");WrapText(line,8,151,304,2); }
 else if(e->chain==3 && (a->id-100)%5<2)WrapText("New Reshuffle: investigation delayed 16 cycles.",8,151,304,2);
 else if(e->branch==BR_OWNS) { snprintf(line,sizeof(line),"Next stage checks: %s",traits[e->branch_trait].name);WrapText(line,8,151,304,2); }
 else if(e->next_true==EVENT_NONE)Text("Temporary effect; ends automatically.",8,151);
 else if(e->branch==BR_ALWAYS)Text("Next stage when the timer expires.",8,151);
 else {
  static const char * const checks[]={"", "", "Severity at least 20", "Regional deaths at least 25%", "Regional active infection at least 50%", "Cure progress at least 50%", "Escalating public response"};
  snprintf(line,sizeof(line),"Next stage: %s",checks[e->branch]);WrapText(line,8,151,304,2);
 }
 snprintf(line,sizeof(line),"Effective local spread: %u.%02u%%",effects.spread[a->region]/100,effects.spread[a->region]%100);Text(line,8,178);
 snprintf(line,sizeof(line),"Air %u%%  Sea %u%%  Birds %u%%",event_modifiers.air[a->region],event_modifiers.sea[a->region],event_modifiers.migration[a->region]);Text(line,8,192);
 snprintf(line,sizeof(line),"Cure speed %u%% / discovery %u%%",event_modifiers.research,event_modifiers.discovery);Text(line,8,206);
 MenuItem("Back (Enter / Clear)",224,true);gfx_SwapDraw();
 for(;;){uint8_t key=WaitKey();if(key==KEY_ENTER||key==KEY_CLEAR)break;}EndModal();
}
void WorldEventsMenu(void) {
 uint8_t selected=0,key,slots[4],count=0,i;char line[80];
 for(i=0;i<4;i++)if(world_events.active[i].id!=EVENT_NONE)slots[count++]=i;
 for(;;) {
  BeginScreen("WORLD EVENTS: PAUSED");
  if(!count)Text("No active world events.",8,38);
  for(i=0;i<count;i++) {
   const active_event_t *a=&world_events.active[slots[i]];
   MenuItem(event_catalog[a->id].name,38+i*36,selected==i);
   snprintf(line,sizeof(line),"%s / %u cycles",region[a->region].name,a->remaining);Text(line,24,51+i*36);
  }
  MenuItem("Back",190,selected==count);Text("Arrows: select  Enter: details",8,212);Text("Clear: back to actions",8,227);gfx_SwapDraw();key=WaitKey();
  if(key==KEY_CLEAR || (key==KEY_ENTER&&selected==count)){EndModal();return;}
  if(MenuMove(key,&selected,count+1))continue;
  if(key==KEY_ENTER)EventDetail(slots[selected]);
 }
}
