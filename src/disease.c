#include "disease.h"
#include <string.h>
const environment_t environments[REGION_COUNT] = {
 {4,0,2,3,2,4,1},{3,3,3,3,4,3,3},{1,3,2,1,4,2,4},{0,4,1,3,1,1,3},
 {2,3,2,3,4,3,4},{3,1,4,1,2,4,2},{3,1,3,4,3,2,3}
};
const char * const disease_names[3] = {"Bacteria", "Virus", "Fungus"};
const uint8_t spore_costs[3] = {10,16,24};
const uint16_t reshuffle_reductions[2] = {1500,2500};
static const uint8_t affected_thresholds[9] = {1,5,10,20,35,50,70,90,100};
static const uint8_t death_thresholds[6] = {1,10,25,50,75,90};
static const uint8_t cure_thresholds[4] = {25,50,75,90};
uint16_t ClampProbability(int32_t p) { return p<0 ? 0 : p>(int32_t)PROB_SCALE ? PROB_SCALE : (uint16_t)p; }
uint16_t LandCount(counts_t c) { return c.healthy+c.active+c.dead; }
uint8_t Percentage(uint16_t value, uint16_t total) { return total ? (uint8_t)((uint32_t)value*100/total) : 0; }
bool Roll(random_fn random, uint16_t p) { return p && (p>=PROB_SCALE || random(PROB_SCALE)<p); }
bool Owns(const disease_t *d, uint8_t id) { return id<TRAIT_COUNT && (d->owned[id/32] & (UINT32_C(1)<<(id%32)))!=0; }
static void SetOwned(disease_t *d, uint8_t id) { d->owned[id/32] |= UINT32_C(1)<<(id%32); }
bool Eligible(const disease_t *d, uint8_t id) {
 uint8_t k;
 if (id>=TRAIT_COUNT || Owns(d,id)) return false;
 for(k=0;k<2;k++) if(traits[id].prerequisite[k]!=NO_TRAIT && !Owns(d,traits[id].prerequisite[k])) return false;
 return id<RESHUFFLE1 || (d->response>=DISCOVERED && d->cure>0);
}
bool Purchase(disease_t *d, uint8_t id) {
 uint16_t reduction;
 if(!d->started || d->result!=PLAYING || !Eligible(d,id) || d->dna<traits[id].cost) return false;
 d->dna-=traits[id].cost; SetOwned(d,id);
 if(id>=RESHUFFLE1) {
  reduction=reshuffle_reductions[id-RESHUFFLE1];
  d->cure=d->cure>reduction?d->cure-reduction:0;
  if(!d->cure) d->cure_fraction=0;
 }
 return true;
}
uint8_t DevolveCost(const disease_t *d) { return d->type==VIRUS?VIRUS_DEVOLVE_COST:DEVOLVE_COST; }
bool CanDevolve(const disease_t *d, uint8_t id) {
 uint8_t i;
 if(id<COUGH || id>ORGAN || !Owns(d,id)) return false;
 for(i=0;i<TRAIT_COUNT;i++) if(Owns(d,i) && (traits[i].prerequisite[0]==id || traits[i].prerequisite[1]==id)) return false;
 return true;
}
bool Devolve(disease_t *d, uint8_t id) {
 if(!d->started || d->result!=PLAYING || !CanDevolve(d,id) || d->dna<DevolveCost(d)) return false;
 d->dna-=DevolveCost(d); d->owned[id/32]&=~(UINT32_C(1)<<(id%32)); return true;
}
void ResetDisease(disease_t *d) { memset(d,0,sizeof(*d)); d->dna=START_DNA; memcpy(d->name,"Pathogen",9); }
static uint8_t Level(const disease_t *d, uint8_t first) { return Owns(d,first)+Owns(d,first+1); }
void CalculateEffects(const disease_t *d, effects_t *e) {
 uint8_t i; uint16_t inf=BASE_INFECTIVITY,sev=0,leth=0;
 memset(e,0,sizeof(*e));
 for(i=0;i<TRAIT_COUNT;i++) if(Owns(d,i)) { inf+=traits[i].infectivity; sev+=traits[i].severity; leth+=traits[i].lethality; }
 e->infectivity=inf; e->severity=sev; e->lethality=leth;
 e->resistance=HARDENING_REDUCTION*Level(d,HARDEN1);
 e->air=BASE_TRAVEL+TRANSPORT_LEVEL_BONUS*Level(d,AIR1)+AEROSOL_TRAVEL_BONUS*Owns(d,AEROSOL);
 e->sea=BASE_TRAVEL+TRANSPORT_LEVEL_BONUS*Level(d,WATER1)+AEROSOL_TRAVEL_BONUS*Owns(d,AEROSOL);
 if(d->type==FUNGUS) { e->air/=FUNGUS_TRAVEL_DIVISOR; e->sea/=FUNGUS_TRAVEL_DIVISOR; }
 e->migration=Level(d,BIRDS1)?BIRD_LEVEL_CHANCE*Level(d,BIRDS1)+VECTOR_MIGRATION_BONUS*Owns(d,VECTOR):0;
 for(i=0;i<REGION_COUNT;i++) {
  const environment_t *r=&environments[i];
  int32_t p=(int32_t)inf*100;
  p-= (int32_t)r->heat*HEAT_PENALTY*(100-ADAPTATION_REDUCTION*Level(d,HEAT1))/100;
  p-= (int32_t)r->cold*COLD_PENALTY*(100-ADAPTATION_REDUCTION*Level(d,COLD1))/100;
  p-= (int32_t)r->healthcare*MEDICAL_PENALTY*(100-ADAPTATION_REDUCTION*Level(d,MEDICAL1))/100;
  p+=AIR_WATER_SPREAD_BONUS*(int32_t)(r->dry*Level(d,AIR1)+r->humid*Level(d,WATER1));
  p+=ANIMAL_VECTOR_SPREAD_BONUS*(int32_t)(r->rural*Level(d,LIVESTOCK1)+r->urban*Level(d,RODENTS1)+r->heat*Level(d,INSECTS1));
  p+=Level(d,BLOOD1)*(BLOOD_SPREAD_BONUS+BLOOD_HEALTHCARE_BONUS*(4-r->healthcare));
  if(Owns(d,AEROSOL)) p+=AEROSOL_SPREAD_BONUS;
  if(Owns(d,RESERVOIRS)) p+=RESERVOIR_SPREAD_BONUS+RESERVOIR_SPARSE_BONUS*(8-r->urban-r->rural);
  if(Owns(d,VECTOR)) p+=r->cold*VECTOR_COLD_BONUS;
  /* Baseline retains a small foothold even in the harshest region. */
  e->spread[i]=ClampProbability(p<MIN_SPREAD?MIN_SPREAD:p);
 }
}
uint8_t Mutate(disease_t *d, random_fn random) {
 uint8_t i,chosen=NO_TRAIT,count=0;
 if(d->type!=VIRUS || !d->started || d->result!=PLAYING || (d->cycles+1)%MUTATION_INTERVAL || !Roll(random,MUTATION_CHANCE)) return NO_TRAIT;
 for(i=COUGH;i<=ORGAN;i++) if(Eligible(d,i)) { count++; if(random(count)==0) chosen=i; }
 if(chosen!=NO_TRAIT) SetOwned(d,chosen);
 return chosen;
}
static void GiveDNA(disease_t *d, uint8_t n) { d->dna=d->dna>MAX_DNA-n?MAX_DNA:d->dna+n; }
void AwardDNA(disease_t *d, counts_t total) {
 uint8_t i; uint16_t land=LandCount(total);
 for(i=0;i<REGION_COUNT;i++) if((d->seen_regions&(1U<<i)) && !(d->region_rewards&(1U<<i))) { d->region_rewards|=1U<<i; GiveDNA(d,REGION_REWARD); }
 for(i=0;i<9;i++) if(!(d->affected_rewards&(1U<<i)) && land && (uint32_t)(total.active+total.dead)*100 >= (uint32_t)affected_thresholds[i]*land) { d->affected_rewards|=1U<<i; GiveDNA(d,AFFECTED_REWARD); }
 for(i=0;i<6;i++) if(!(d->death_rewards&(1U<<i)) && land && (uint32_t)total.dead*100 >= (uint32_t)death_thresholds[i]*land) { d->death_rewards|=1U<<i; GiveDNA(d,DEATH_REWARD); }
}
void EvaluateOutcome(disease_t *d, counts_t total) {
 if(!d->started || d->result!=PLAYING || !LandCount(total)) return;
 if(!total.healthy && !total.active) d->result=WON;
 else if(!total.active && total.healthy) d->result=LOST_EXTINCTION;
 else if(d->cure>=PROB_SCALE) d->result=LOST_CURE;
}
uint8_t AdvanceDisease(disease_t *d, const counts_t regions[REGION_COUNT], const effects_t *e) {
 counts_t total={0,0,0}; uint8_t i,events=0,affected_regions=0; uint32_t pressure=0,increment;
 uint16_t land; uint8_t prevalence,deaths;
 if(!d->started || d->result!=PLAYING) return 0;
 if(d->cycles<UINT32_MAX-1) d->cycles++;
 for(i=0;i<REGION_COUNT;i++) {
  total.healthy+=regions[i].healthy; total.active+=regions[i].active; total.dead+=regions[i].dead;
  if(regions[i].active) { d->seen_regions|=1U<<i; affected_regions++; pressure+=environments[i].healthcare*Percentage(regions[i].active,LandCount(regions[i])); }
 }
 land=LandCount(total); prevalence=Percentage(total.active,land); deaths=Percentage(total.dead,land);
 AwardDNA(d,total);
 if(d->response==UNDETECTED) {
  pressure=pressure/DISCOVERY_HEALTHCARE_DIVISOR+prevalence+e->severity*DISCOVERY_SEVERITY_WEIGHT+deaths*DISCOVERY_DEATH_WEIGHT;
  d->discovery_pressure+=pressure;
  if(d->discovery_pressure>=DISCOVERY_LIMIT || prevalence>=DISCOVERY_ACTIVE_THRESHOLD || deaths>=DISCOVERY_DEATH_THRESHOLD) {
   d->discovery_pressure=DISCOVERY_LIMIT; d->response=DISCOVERED; d->discovery_cycle=d->cycles; events|=EVENT_DISCOVERY;
  }
 }
 if(d->response==DISCOVERED && d->cycles-d->discovery_cycle>=RESEARCH_DELAY) { d->response=RESEARCH; events|=EVENT_RESEARCH; }
 if(d->response>=RESEARCH && total.active) {
  increment=(uint32_t)(RESEARCH_BASE+prevalence/RESEARCH_ACTIVE_DIVISOR+deaths+e->severity*RESEARCH_SEVERITY_WEIGHT+affected_regions*RESEARCH_REGION_WEIGHT)*(100-e->resistance);
  /* 1/200 of one basis point; positive even at maximum hardening. */
  increment+=d->cure_fraction;
  d->cure=ClampProbability((int32_t)d->cure+(int32_t)(increment/RESEARCH_FRACTION_SCALE));
  d->cure_fraction=d->cure==PROB_SCALE?0:increment%RESEARCH_FRACTION_SCALE;
  if(d->response==RESEARCH && (d->cure>=RESPONSE_CURE_THRESHOLD || e->severity>=RESPONSE_SEVERITY_THRESHOLD || deaths>=RESPONSE_DEATH_THRESHOLD)) { d->response=ESCALATING; events|=EVENT_RESPONSE; }
 }
 for(i=0;i<4;i++) if(d->cure>=cure_thresholds[i]*100U && !(d->cure_news&(1U<<i))) { d->cure_news|=1U<<i; events|=(EVENT_CURE25<<i); }
 EvaluateOutcome(d,total);
 return events;
}
bool ValidateDisease(const disease_t *d) {
 uint8_t i,k; uint16_t earned=START_DNA;
 if(d->type>FUNGUS || d->started>1 || d->result>LOST_CURE || d->response>ESCALATING || d->spores_used>3 || (d->type!=FUNGUS && d->spores_used) || d->dna>MAX_DNA || d->cure>PROB_SCALE || d->cure_fraction>=RESEARCH_FRACTION_SCALE || d->owned[1]>127 || d->affected_rewards>511 || d->death_rewards>63 || d->region_rewards>127 || d->seen_regions>127 || (d->region_rewards&~d->seen_regions) || d->cure_news>15 || d->discovery_pressure>DISCOVERY_LIMIT || d->cycles==UINT32_MAX || d->discovery_cycle>d->cycles) return false;
 if((d->affected_rewards & (d->affected_rewards+1)) || (d->death_rewards & (d->death_rewards+1)) || (d->cure_news & (d->cure_news+1))) return false;
 for(i=0;i<REGION_COUNT;i++) if(d->region_rewards&(1U<<i)) earned+=REGION_REWARD;
 for(i=0;i<9;i++) if(d->affected_rewards&(1U<<i)) earned+=AFFECTED_REWARD;
 for(i=0;i<6;i++) if(d->death_rewards&(1U<<i)) earned+=DEATH_REWARD;
 if(d->dna>earned) return false;
 if(!memchr(d->name,0,sizeof(d->name))) return false;
 for(i=0;d->name[i];i++) if((unsigned char)d->name[i]<32 || (unsigned char)d->name[i]>126) return false;
 for(;i<sizeof(d->name);i++) if(d->name[i]) return false;
 if(!d->started && (d->cycles || d->result || d->owned[0] || d->owned[1] || d->seen_regions || d->response || d->spores_used || d->affected_rewards || d->death_rewards || d->discovery_pressure || d->dna!=START_DNA)) return false;
 if(d->response==UNDETECTED && (d->cure || d->cure_fraction || d->discovery_cycle || d->cure_news || Owns(d,RESHUFFLE1))) return false;
 if(d->response>=DISCOVERED && (!d->discovery_cycle || d->discovery_pressure!=DISCOVERY_LIMIT)) return false;
 for(i=0;i<TRAIT_COUNT;i++) if(Owns(d,i)) for(k=0;k<2;k++) if(traits[i].prerequisite[k]!=NO_TRAIT && !Owns(d,traits[i].prerequisite[k])) return false;
 return true;
}
