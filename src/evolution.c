#include "contagion.h"
#include <stdio.h>
#include <string.h>
#include <sys/timers.h>

static const char * const categories[3]={"TRANSMISSION","SYMPTOMS","ABILITIES"};
static const uint8_t first_node[3]={0,17,29};
static const char * const branch_labels[3][7]={
 {"Air","Water","Live","Rod","Insect","Bird","Blood"},
 {"Respiratory","Digestive","Systemic",NULL,NULL,NULL,NULL},
 {"Heat","Cold","Medical","Harden","Shuffle",NULL,NULL}
};
static char StateSymbol(uint8_t id) {
 if(Owns(&disease,id)) return '*';
 if(!Eligible(&disease,id)) return 'L';
 return disease.dna<traits[id].cost?'$':'+';
}
static void Detail(uint8_t id) {
 uint8_t key; char line[80]; const trait_t *t=&traits[id];
 const char *feedback="";
 for(;;) {
  disease_t preview=disease; effects_t after;
  bool removal=CanDevolve(&disease,id);
  if(removal) preview.owned[id/32]&=~(UINT32_C(1)<<(id%32));
  else preview.owned[id/32]|=UINT32_C(1)<<(id%32);
  CalculateEffects(&preview,&after);
  BeginScreen("EVOLUTION DETAILS");
  Text(t->name,8,32);
  snprintf(line,sizeof(line),"DNA %u   Cost %u   State %c",disease.dna,t->cost,StateSymbol(id)); Text(line,8,48);
  Text("Requires:",8,65);
  Text(t->prerequisite[0]==NO_TRAIT?"None":traits[t->prerequisite[0]].name,80,65);
  if(t->prerequisite[1]!=NO_TRAIT) Text(traits[t->prerequisite[1]].name,80,78);
  if(id>=RESHUFFLE1) Text("Discovered + positive cure progress",8,92);
  WrapText(t->description,8,108,304,3);
  Text(removal?"Devolve preview:":"Purchase preview:",8,148);
  snprintf(line,sizeof(line),"INF %u>%u  SEV %u>%u",effects.infectivity,after.infectivity,effects.severity,after.severity); Text(line,8,162);
  snprintf(line,sizeof(line),"LETH %u>%u%%  RES %u>%u%%",effects.lethality,after.lethality,effects.resistance,after.resistance); Text(line,8,175);
  if(id>=RESHUFFLE1) {
   uint16_t reduction=reshuffle_reductions[id-RESHUFFLE1];
   if(Owns(&disease,id)) snprintf(line,sizeof(line),"Reshuffle already used this run.");
   else snprintf(line,sizeof(line),"Cure %u.%02u > %u.%02u%%",disease.cure/100,disease.cure%100,(disease.cure>reduction?disease.cure-reduction:0)/100,(disease.cure>reduction?disease.cure-reduction:0)%100);
  } else if(id<=WATER2 || id==AEROSOL) {
   snprintf(line,sizeof(line),"Base air %u>%u%%  sea %u>%u%%",effects.air/100,after.air/100,effects.sea/100,after.sea/100);
  } else if(id==BIRDS1 || id==BIRDS2 || id==VECTOR) {
   snprintf(line,sizeof(line),"Base birds %u>%u%% per 8 cycles",effects.migration/100,after.migration/100);
  } else snprintf(line,sizeof(line),"Local spread %u.%02u > %u.%02u%%",effects.spread[session.selected]/100,effects.spread[session.selected]%100,after.spread[session.selected]/100,after.spread[session.selected]%100);
  Text(line,8,188);
  Text(feedback,8,201);
  Text("Enter: buy    Graph/Clear: back",8,216);
  if(id>=COUGH && id<=ORGAN) {
   snprintf(line,sizeof(line),"Del: devolve leaf (%u DNA, no refund)",DevolveCost(&disease)); Text(line,8,229);
  }
  gfx_SwapDraw(); key=WaitKey();
  if(key==KEY_CLEAR || key==KEY_GRAPH) return;
  if(key==KEY_ENTER) {
   if(Purchase(&disease,id)) { CalculateEffects(&disease,&effects); feedback="Purchased."; }
   else feedback="Owned, locked, or insufficient DNA.";
  }
  if(key==KEY_DELETE) {
   if(Devolve(&disease,id)) { CalculateEffects(&disease,&effects); feedback="Devolved; discovery remains."; }
   else feedback="Need owned leaf symptom and DNA.";
  }
 }
}
void EvolutionMenu(void) {
 uint8_t category=0,selected[3]={0,17,29},key,i,k;
 char line[64];
 for(;;) {
  uint8_t id=selected[category];
  BeginScreen(categories[category]);
  snprintf(line,sizeof(line),"DNA %u    Y=/Window: category",disease.dna); Text(line,8,24);
  for(i=0;i<(category==0?7:category==1?3:5);i++) {
   int x=category==0?22+i*45:category==1?55+i*105:32+i*63;
   Text(branch_labels[category][i],x-gfx_GetStringWidth(branch_labels[category][i])/2,40);
  }
  gfx_SetColor(181);
  for(i=0;i<TRAIT_COUNT;i++) if(traits[i].category==category) for(k=0;k<2;k++) {
   uint8_t pre=traits[i].prerequisite[k];
   if(pre!=NO_TRAIT) gfx_Line(traits[pre].x,traits[pre].y,traits[i].x,traits[i].y);
  }
  for(i=0;i<TRAIT_COUNT;i++) if(traits[i].category==category) {
   char symbol[2]={StateSymbol(i),0};
   gfx_SetColor(0); gfx_FillCircle(traits[i].x,traits[i].y,10);
   gfx_SetColor(Owns(&disease,i)?224:255); gfx_Circle(traits[i].x,traits[i].y,10);
   if(i==id) gfx_Rectangle(traits[i].x-13,traits[i].y-13,27,27);
   Text(symbol,traits[i].x-3,traits[i].y-4);
  }
  if(category==0) { Text("Aerosol",22,163); Text("Reservoirs",105,163); Text("Vector",208,163); }
  Text(traits[id].name,8,180);
  snprintf(line,sizeof(line),"Cost %u  * owned  + ready  L lock  $ DNA",traits[id].cost); Text(line,8,194);
  Text("Arrows: move   Enter: details",8,211);
  Text(category==2 && disease.type==FUNGUS?"Zoom: spores     Graph/Clear: return":"Graph/Clear: return",8,226);
  gfx_SwapDraw(); key=WaitKey();
  if(key==KEY_GRAPH || key==KEY_CLEAR) break;
  if(key==KEY_PREVIOUS) category=(category+2)%3;
  else if(key==KEY_NEXT) category=(category+1)%3;
  else if(key>=KEY_LEFT && key<=KEY_DOWN) selected[category]=traits[id].neighbor[key-KEY_LEFT];
  else if(key==KEY_ENTER) Detail(id);
  else if(key==KEY_ZOOM && category==2 && disease.type==FUNGUS) SporeMenu();
  if(selected[category]>=TRAIT_COUNT) selected[category]=first_node[category];
 }
 ReleaseKeys(); timer_1_Counter=0;
}
void RegionInfo(void) {
 const region_t *r=&region[session.selected]; const environment_t *e=&environments[session.selected]; char line[80]; uint8_t i,closed=0,total_ports=0;
 BeginScreen(r->name);
 snprintf(line,sizeof(line),"Healthy %u   Active %u   Dead %u",r->counts.healthy,r->counts.active,r->counts.dead); Text(line,8,40);
 snprintf(line,sizeof(line),"Ever affected %u",r->counts.active+r->counts.dead); Text(line,8,58);
 Text("Mixed gameplay ratings (0-4)",8,85);
 snprintf(line,sizeof(line),"Heat %u   Cold %u",e->heat,e->cold); Text(line,8,106);
 snprintf(line,sizeof(line),"Humidity %u   Aridity %u",e->humid,e->dry); Text(line,8,126);
 snprintf(line,sizeof(line),"Urban %u   Rural %u",e->urban,e->rural); Text(line,8,146);
 snprintf(line,sizeof(line),"Healthcare %u",e->healthcare); Text(line,8,166);
 snprintf(line,sizeof(line),"Effective spread: %u.%02u%%",effects.spread[session.selected]/100,effects.spread[session.selected]%100); Text(line,8,190);
 for(i=0;i<PORT_COUNT;i++) if(port[i].region==session.selected) { total_ports++; if(port[i].closed) closed++; }
 snprintf(line,sizeof(line),"Travel endpoints closed: %u/%u",closed,total_ports); Text(line,8,205);
 Text("Enter / Graph / Clear: return",8,222); gfx_SwapDraw();
 for(;;) { uint8_t key=WaitKey(); if(key==KEY_ENTER || key==KEY_GRAPH || key==KEY_CLEAR) break; }
 ReleaseKeys(); timer_1_Counter=0;
}
void SporeMenu(void) {
 uint8_t selected=session.selected,key,i; char line[80]; const char *feedback="";
 for(;;) {
  BeginScreen("FUNGUS: SPORE BURST");
  if(disease.spores_used>=3) Text("All three charges spent.",8,28);
  else { snprintf(line,sizeof(line),"DNA %u   Charge %u/3 costs %u",disease.dna,disease.spores_used+1,spore_costs[disease.spores_used]); Text(line,8,28); }
  Text("Seeds healthy land; ignores closures.",8,44);
  for(i=0;i<REGION_COUNT;i++) {
   snprintf(line,sizeof(line),"%c %s: %u healthy",i==selected?'>':' ',region[i].name,region[i].counts.healthy); Text(line,8,67+i*17);
  }
  Text(feedback,8,193); Text("Up/Down: choose   Enter: release",8,212); Text("Graph/Clear: cancel",8,226);
  gfx_SwapDraw(); key=WaitKey();
  if(key==KEY_CLEAR || key==KEY_GRAPH) return;
  if(key==KEY_UP) selected=(selected+6)%7;
  if(key==KEY_DOWN) selected=(selected+1)%7;
  if(key==KEY_ENTER) {
   if(SporeBurst(region,&disease,selected,GameRandom)) { QueueNews("Spore burst seeded healthy land."); feedback="One healthy cell seeded."; }
   else feedback="Need healthy land, DNA, and a charge.";
  }
 }
}
void ResultScreen(void) {
 counts_t c=CountWorld(region); uint16_t total=LandCount(c); char line[80];
 BeginScreen(disease.result==WON?"EXTINCTION: VICTORY":"OUTBREAK ENDED");
 snprintf(line,sizeof(line),"%s / %s",disease_names[disease.type],disease.name); Text(line,8,38);
 snprintf(line,sizeof(line),"Completed world cycles: %lu",(unsigned long)disease.cycles); Text(line,8,63);
 snprintf(line,sizeof(line),"Healthy %u%%  Active %u%%  Dead %u%%",Percentage(c.healthy,total),Percentage(c.active,total),Percentage(c.dead,total)); Text(line,8,90);
 snprintf(line,sizeof(line),"Ever affected %u%%   Cure %u.%02u%%",Percentage(c.active+c.dead,total),disease.cure/100,disease.cure%100); Text(line,8,114);
 WrapText(disease.result==WON?"No living land cells remain.":disease.result==LOST_CURE?"Humanity completed the cure.":"The last active infection died while healthy land survived.",8,148,304,3);
 Text("Enter / Clear: main menu",8,221); gfx_SwapDraw();
 for(;;) { uint8_t key=WaitKey(); if(key==KEY_ENTER || key==KEY_CLEAR) break; }
 ReleaseKeys(); timer_1_Counter=0;
}
