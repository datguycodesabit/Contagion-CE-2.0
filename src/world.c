#include "world.h"
/* Same 22 locations. Modes are lightweight gameplay capabilities, not real airports. */
const port_t port_definitions[PORT_COUNT] = {
 {12,46,4,3,20,0},{28,50,4,1,70,0},{37,40,4,3,50,0},{54,24,3,3,30,0},
 {34,62,5,3,50,0},{30,72,5,2,90,0},{48,74,5,3,60,0},
 {84,84,0,3,60,0},{74,60,0,1,30,0},{94,80,0,2,40,0},
 {94,52,1,3,50,0},{68,44,2,3,40,0},{86,36,2,1,40,0},
 {112,54,1,1,50,0},{128,50,1,3,80,0},{138,46,1,2,40,0},{134,58,1,3,50,0},
 {141,68,6,3,40,0},{142,68,6,2,50,0},{146,84,6,1,90,0},{153,94,6,3,50,0},{146,70,6,2,40,0}
};
static const uint8_t neighbors[REGION_COUNT] = {
 (1U<<1)|(1U<<2)|(1U<<5), (1U<<0)|(1U<<2)|(1U<<4)|(1U<<6),
 (1U<<0)|(1U<<1)|(1U<<3), (1U<<2)|(1U<<4),
 (1U<<1)|(1U<<3)|(1U<<5), (1U<<0)|(1U<<4), (1U<<1)
};
void RecountRegion(region_t *r) {
 size_t i,n=(size_t)r->width*r->height;
 r->counts.healthy=r->counts.active=r->counts.dead=0;
 for(i=0;i<n;i++) {
  if(r->data[i]==CELL_HEALTHY) r->counts.healthy++;
  else if(r->data[i]==CELL_INFECTED) r->counts.active++;
  else if(r->data[i]==CELL_DEAD) r->counts.dead++;
 }
}
counts_t CountWorld(const region_t r[REGION_COUNT]) {
 counts_t c={0,0,0}; uint8_t i;
 for(i=0;i<REGION_COUNT;i++) { c.healthy+=r[i].counts.healthy; c.active+=r[i].counts.active; c.dead+=r[i].counts.dead; }
 return c;
}
bool SetCell(region_t *r, size_t index, uint8_t state) {
 uint8_t old;
 if(index>=(size_t)r->width*r->height) return false;
 old=r->data[index];
 if(!((old==CELL_HEALTHY && state==CELL_INFECTED) || (old==CELL_INFECTED && state==CELL_DEAD))) return false;
 if(old==CELL_HEALTHY) { r->counts.healthy--; r->counts.active++; }
 else { r->counts.active--; r->counts.dead++; }
 r->data[index]=state; return true;
}
bool InfectCoordinate(region_t r[REGION_COUNT], disease_t *d, int x, int y) {
 uint8_t i;
 for(i=0;i<REGION_COUNT;i++) {
  int lx=x-r[i].x,ly=y-r[i].y;
  if(lx>=0 && ly>=0 && lx<r[i].width && ly<r[i].height && SetCell(&r[i],(size_t)ly*r[i].width+lx,CELL_INFECTED)) { d->seen_regions|=1U<<i; return true; }
 }
 return false;
}
bool SeedRegion(region_t r[REGION_COUNT], disease_t *d, uint8_t destination, random_fn random) {
 size_t i,n,start;
 if(destination>=REGION_COUNT || !r[destination].counts.healthy) return false;
 n=(size_t)r[destination].width*r[destination].height;
 if(!n) return false;
 start=random((uint16_t)n);
 for(i=0;i<n;i++) if(SetCell(&r[destination],(start+i)%n,CELL_INFECTED)) { d->seen_regions|=1U<<destination; return true; }
 return false;
}
void StepRegion(region_t *r, uint16_t spread, uint16_t lethality, random_fn random) {
 uint8_t x,y;
 for(x=0;x<r->width;x++) for(y=0;y<r->height;y++) {
  size_t index=(size_t)y*r->width+x;
  if(r->data[index]==CELL_INFECTED) {
   if(Roll(random,spread)) {
    int nx=(int)x+(int)random(3)-1,ny=(int)y+(int)random(3)-1;
    if(nx>=0 && ny>=0 && nx<r->width && ny<r->height) SetCell(r,(size_t)ny*r->width+nx,CELL_INFECTED);
   }
   if(Roll(random,lethality)) SetCell(r,index,CELL_DEAD);
  }
 }
}
bool StepWorldRegion(region_t r[REGION_COUNT], uint8_t *next, const effects_t *e, random_fn random) {
 StepRegion(&r[*next],e->spread[*next],ClampProbability((int32_t)e->lethality*100),random);
 *next=(*next+1)%REGION_COUNT;
 return *next==0;
}
bool ValidPort(const region_t r[REGION_COUNT], const port_t *p) {
 int x,y;
 if(p->region>=REGION_COUNT || !p->modes || (p->modes&~3)) return false;
 x=(int)p->x-r[p->region].x; y=(int)p->y-r[p->region].y;
 return x>=0 && y>=0 && x<r[p->region].width && y<r[p->region].height && r[p->region].data[(size_t)y*r[p->region].width+x]!=CELL_EMPTY;
}
bool Transport(region_t r[REGION_COUNT], port_t p[PORT_COUNT], disease_t *d, const effects_t *e, random_fn random, uint8_t *source, uint8_t *destination) {
 uint8_t i,count=0,s=NO_TRAIT,t=NO_TRAIT,mode=random(2)?PORT_AIR:PORT_SEA;
 uint16_t probability;
 *source=*destination=0;
 for(i=0;i<PORT_COUNT;i++) if(!p[i].closed && (p[i].modes&mode) && ValidPort(r,&p[i]) && r[p[i].region].counts.active) { count++; if(random(count)==0) s=i; }
 if(s==NO_TRAIT) return false;
 count=0;
 for(i=0;i<PORT_COUNT;i++) if(i!=s && p[i].region!=p[s].region && !p[i].closed && (p[i].modes&mode) && ValidPort(r,&p[i])) { count++; if(random(count)==0) t=i; }
 if(t==NO_TRAIT) return false;
 *source=s; *destination=t;
 probability=mode==PORT_AIR?e->air:e->sea;
 probability=(uint32_t)probability*r[p[s].region].counts.active/LandCount(r[p[s].region].counts);
 if(!Roll(random,probability)) return false;
 /* An arriving carrier seeds healthy land in the destination region. This also
    reaches disconnected islands without a second geography representation. */
 return SeedRegion(r,d,p[t].region,random);
}
bool Migrate(region_t r[REGION_COUNT], disease_t *d, const effects_t *e, random_fn random) {
 uint8_t i,s=NO_TRAIT,t=NO_TRAIT,count=0;
 if(!d->started || d->result!=PLAYING || (d->cycles+1)%MIGRATION_INTERVAL || !e->migration) return false;
 for(i=0;i<REGION_COUNT;i++) if(r[i].counts.active) { count++; if(random(count)==0) s=i; }
 if(s==NO_TRAIT || !Roll(random,(uint32_t)e->migration*r[s].counts.active/LandCount(r[s].counts))) return false;
 count=0;
 for(i=0;i<REGION_COUNT;i++) if((neighbors[s]&(1U<<i)) && r[i].counts.healthy) { count++; if(random(count)==0) t=i; }
 return t!=NO_TRAIT && SeedRegion(r,d,t,random);
}
bool SporeBurst(region_t r[REGION_COUNT], disease_t *d, uint8_t destination, random_fn random) {
 if(!d->started || d->result!=PLAYING || d->type!=FUNGUS || d->spores_used>=3 || d->dna<spore_costs[d->spores_used]) return false;
 if(!SeedRegion(r,d,destination,random)) return false;
 d->dna-=spore_costs[d->spores_used++]; return true;
}
uint8_t ClosePorts(const region_t r[REGION_COUNT], port_t p[PORT_COUNT], const disease_t *d, const effects_t *e, random_fn random) {
 uint8_t i,closed=0;
 if(d->response<DISCOVERED) return 0;
 for(i=0;i<PORT_COUNT;i++) if(!p[i].closed) {
  counts_t c=r[p[i].region].counts;
  uint16_t pressure=Percentage(c.active,LandCount(c))/CLOSURE_ACTIVE_DIVISOR+Percentage(c.dead,LandCount(c))+e->severity+(d->response==ESCALATING?CLOSURE_ESCALATION_BONUS:0);
  if(pressure>=p[i].threshold && Roll(random,PORT_CLOSURE_CHANCE)) { p[i].closed=true; closed|=1U<<p[i].region; }
 }
 return closed;
}
