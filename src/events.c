#include "events.h"
#include "world.h"
#include <string.h>
event_state_t world_events;
event_modifiers_t event_modifiers;
static uint32_t AddCycles(uint32_t a,uint8_t b) { return a>UINT32_MAX-b?UINT32_MAX:a+b; }
static uint32_t RandomEvent(event_state_t *s) {
 uint32_t x=s->rng;x^=x<<13;x^=x>>17;x^=x<<5;s->rng=x;return x;
}
static uint8_t Reshuffles(const disease_t *d) { return Owns(d,RESHUFFLE1)|(Owns(d,RESHUFFLE2)<<1); }
bool EventsOccurred(const event_state_t *s,uint8_t id) { return id<WORLD_EVENT_COUNT && (s->occurred[id/8]&(1U<<(id%8))); }
static void Mark(event_state_t *s,uint8_t id) { s->occurred[id/8]|=1U<<(id%8); }
static void Clear(active_event_t *a) { a->id=EVENT_NONE;a->region=a->remaining=0; }
void EventsInit(event_state_t *s,const disease_t *d,uint32_t seed) {
 uint8_t i;memset(s,0,sizeof(*s));s->rng=seed?seed:UINT32_C(0x9e3779b9);
 s->last_cycle=d->cycles;s->next_start=AddCycles(d->cycles,24);s->reshuffles_seen=Reshuffles(d);
 for(i=0;i<WORLD_EVENT_SLOTS;i++)Clear(&s->active[i]);
}
bool EventsValidate(const event_state_t *s,const disease_t *d) {
 uint8_t i,j,chains=0;
 if(!s->rng || s->last_cycle>d->cycles || d->cycles-s->last_cycle>1 || s->next_start>AddCycles(s->last_cycle,24) || s->reshuffles_seen>3 || s->reshuffles_seen!=Reshuffles(d))return false;
 for(i=100;i<200;i+=5) {
  bool a=EventsOccurred(s,i),b=EventsOccurred(s,i+1),c=EventsOccurred(s,i+2),e=EventsOccurred(s,i+3),f=EventsOccurred(s,i+4);
  if((b&&!a)||((c||e)&&!b)||(c&&e)||(f&&!(c||e)))return false;
 }
 for(i=0;i<WORLD_EVENT_SLOTS;i++) {
  const active_event_t *a=&s->active[i];
  if(a->id==EVENT_NONE) { if(a->region||a->remaining)return false;continue; }
  if(a->id>=200 || a->region>=7 || !a->remaining || a->remaining>event_catalog[a->id].duration+((event_catalog[a->id].chain==3 && (a->id-100)%5<2)?16*((s->reshuffles_seen&1)!=0)+16*((s->reshuffles_seen&2)!=0):0) || !EventsOccurred(s,a->id))return false;
  if(event_catalog[a->id].chain!=EVENT_NONE)chains++;
  for(j=0;j<i;j++)if(s->active[j].id!=EVENT_NONE && (s->active[j].id==a->id || (event_catalog[a->id].chain!=EVENT_NONE && event_catalog[s->active[j].id].chain==event_catalog[a->id].chain)))return false;
  if(a->id>=100) {
   uint8_t root=a->id-(a->id-100)%5,k;
   for(k=a->id+1;k<root+5;k++)if(EventsOccurred(s,k))return false;
  }
 }
 if(chains>2)return false;
 if(!d->started) { for(i=0;i<25;i++)if(s->occurred[i])return false; }
 return true;
}
static bool Capable(uint8_t region,uint8_t mode) {
 uint8_t i;for(i=0;i<PORT_COUNT;i++)if(port_definitions[i].region==region && (port_definitions[i].modes&mode))return true;return false;
}
bool EventsEligible(const event_def_t *e,const disease_t *d,const counts_t counts[REGION_COUNT],uint8_t r) {
 const environment_t *env;counts_t c;uint8_t i;
 if(r>=7 || !d->started || d->result!=PLAYING || d->cycles<e->min_cycle || d->response<e->min_response || !(e->type_mask&(1U<<d->type)) || (e->required_trait!=EVENT_NONE&&!Owns(d,e->required_trait)))return false;
 c=counts[r];env=&environments[r];
 if(!c.healthy&&!c.active)return false;
 /* A zero threshold cannot reject a region; avoid its integer division. */
 if((e->min_active && Percentage(c.active,LandCount(c))<e->min_active) ||
    (e->min_dead && Percentage(c.dead,LandCount(c))<e->min_dead))return false;
 switch(e->target) {
 case TARGET_ACTIVE:if(!c.active)return false;break;
 case TARGET_HEALTHY:if(!c.healthy)return false;break;
 case TARGET_HOT:if(env->heat<3)return false;break;
 case TARGET_COLD:if(env->cold<3)return false;break;
 case TARGET_HUMID:if(env->humid<3)return false;break;
 case TARGET_DRY:if(env->dry<3)return false;break;
 case TARGET_URBAN:if(env->urban<3)return false;break;
 case TARGET_RURAL:if(env->rural<3)return false;break;
 case TARGET_HEALTHCARE:if(env->healthcare<3)return false;break;
 case TARGET_SEA:if(!Capable(r,PORT_SEA))return false;break;
 case TARGET_AIR:if(!Capable(r,PORT_AIR))return false;break;
 default:break;
 }
 for(i=0;i<2;i++) {
  const event_effect_t *f=&e->effect[i];if(!f->kind||!f->amount)continue;
  if(f->trait!=EVENT_NONE && !Owns(d,f->trait))continue;
  if(f->kind==EV_SPREAD && f->trait!=EVENT_NONE && !TransmissionContribution(d,r,f->trait))continue;
  if(f->kind==EV_RESEARCH && d->response<RESEARCH)continue;
  if(f->kind==EV_DISCOVERY && d->response!=UNDETECTED)continue;
  if(f->kind==EV_MIGRATION && !Owns(d,BIRDS1))continue;
  return true;
 }
 return false;
}
static bool Branch(const event_def_t *e,const disease_t *d,const counts_t counts[7],uint8_t r) {
 effects_t base;
 switch(e->branch) {
 case BR_OWNS:return Owns(d,e->branch_trait);
 case BR_SEVERITY:CalculateEffects(d,&base);return base.severity>=20;
 case BR_DEAD:return Percentage(counts[r].dead,LandCount(counts[r]))>=25;
 case BR_ACTIVE:return Percentage(counts[r].active,LandCount(counts[r]))>=50;
 case BR_CURE:return d->cure>=5000;
 case BR_RESPONSE:return d->response>=ESCALATING;
 default:return true;
 }
}
void EventsRefreshTraits(event_state_t *s,const disease_t *d) {
 uint8_t fresh=Reshuffles(d)&~s->reshuffles_seen,i,extra=((fresh&1)!=0)+((fresh&2)!=0);
 if(extra)for(i=0;i<4;i++)if(s->active[i].id!=EVENT_NONE && event_catalog[s->active[i].id].chain==3 && (s->active[i].id-100)%5<2) s->active[i].remaining+=extra*16;
 s->reshuffles_seen=Reshuffles(d);
}
void EventsAdvance(event_state_t *s,const disease_t *d,const counts_t counts[7],event_notice_fn notice) {
 uint8_t i,r,slot=EVENT_NONE,chains=0,kind;uint16_t candidates[2]={0,0},pick;
 uint32_t elapsed;
 if(!d->started || d->result!=PLAYING || d->cycles<=s->last_cycle)return;
 elapsed=d->cycles-s->last_cycle;s->last_cycle=d->cycles;EventsRefreshTraits(s,d);
 for(i=0;i<4;i++) {
  active_event_t *a=&s->active[i];
  if(a->id!=EVENT_NONE) {
   const event_def_t *e=&event_catalog[a->id];
   if(!counts[a->region].healthy&&!counts[a->region].active) { if(notice)notice(a->id,a->region,true);Clear(a); }
   else if(elapsed>=a->remaining) {
    uint8_t next=Branch(e,d,counts,a->region)?e->next_true:e->next_false;
    if(next!=EVENT_NONE && !EventsOccurred(s,next)) { a->id=next;a->remaining=event_catalog[next].duration;Mark(s,next);if(notice)notice(next,a->region,false); }
    else { if(notice)notice(a->id,a->region,true);Clear(a); }
   } else a->remaining-=(uint8_t)elapsed;
  }
  if(a->id==EVENT_NONE)slot=i;
  else if(event_catalog[a->id].chain!=EVENT_NONE)chains++;
 }
 if(slot==EVENT_NONE || d->cycles<s->next_start || d->cycles%8 || RandomEvent(s)%100>=25)return;
 /* Two bounded catalog passes, no pixel access or candidate allocations. */
 for(i=0;i<200;i++) {
  if(EventsOccurred(s,i) || (i>=100 && ((i-100)%5 || chains>=2)))continue;
  for(r=0;r<7;r++)if(EventsEligible(&event_catalog[i],d,counts,r))candidates[i>=100]++;
 }
 if(!candidates[0]&&!candidates[1])return;
 kind=!candidates[0]?1:!candidates[1]?0:RandomEvent(s)%100>=70;
 pick=RandomEvent(s)%candidates[kind];
 for(i=kind?100:0;i<(kind?200:100);i++) {
  if(EventsOccurred(s,i) || (kind && (i-100)%5))continue;
  for(r=0;r<7;r++)if(EventsEligible(&event_catalog[i],d,counts,r) && !pick--) {
   s->active[slot].id=i;s->active[slot].region=r;s->active[slot].remaining=event_catalog[i].duration;
   Mark(s,i);s->next_start=AddCycles(d->cycles,16);if(notice)notice(i,r,false);return;
  }
 }
}
int16_t EventAmount(const event_def_t *e,const event_effect_t *f,const disease_t *d) { return e->mitigate!=EVENT_NONE&&Owns(d,e->mitigate)?f->amount/2:f->amount; }
static uint16_t Percent(int32_t value,uint16_t lo,uint16_t hi) { return value<lo?lo:value>hi?hi:(uint16_t)value; }
void EventsApply(const event_state_t *s,const disease_t *d,const counts_t counts[7],effects_t *effects,event_modifiers_t *mods) {
 int32_t spread[7]={0},research=0,discovery=0;int16_t air[7]={0},sea[7]={0},migration[7]={0};uint16_t land=0;uint8_t i,j;
 memset(mods,0,sizeof(*mods));for(i=0;i<7;i++)land+=LandCount(counts[i]);
 for(i=0;i<4;i++)if(s->active[i].id!=EVENT_NONE) {
  const active_event_t *a=&s->active[i];const event_def_t *e=&event_catalog[a->id];uint8_t r=a->region;
  for(j=0;j<2;j++) {
   const event_effect_t *f=&e->effect[j];int16_t amount=EventAmount(e,f,d);uint16_t contribution;
   if(f->trait!=EVENT_NONE&&!Owns(d,f->trait))continue;
   switch(f->kind) {
   case EV_SPREAD:
    contribution=f->trait==EVENT_NONE?effects->spread[r]:TransmissionContribution(d,r,f->trait);
    spread[r]+=(int32_t)contribution*amount/100;break;
   case EV_AIR:air[r]+=amount;break;
   case EV_SEA:sea[r]+=amount;break;
   case EV_MIGRATION:migration[r]+=amount;break;
   case EV_DISCOVERY:case EV_RESEARCH:
    if(land) { int32_t delta=(int32_t)amount*LandCount(counts[r])/land;
     if(!delta&&amount&&LandCount(counts[r]))delta=amount>0?1:-1;
     if(f->kind==EV_RESEARCH)research+=delta;else discovery+=delta;
    }break;
   case EV_BLOCK_AIR:mods->blocked_air|=1U<<r;break;
   case EV_BLOCK_SEA:mods->blocked_sea|=1U<<r;break;
   default:break;
   }
  }
 }
 for(i=0;i<7;i++) {
  uint16_t base=effects->spread[i];
  effects->spread[i]=ClampProbability(Percent((int32_t)base+spread[i],base/2,(uint32_t)base*150/100));
  mods->air[i]=Percent(100+air[i],50,150);mods->sea[i]=Percent(100+sea[i],50,150);mods->migration[i]=Percent(100+migration[i],50,150);
 }
 mods->research=Percent(100+research,75,125);mods->discovery=Percent(100+discovery,75,125);
}
