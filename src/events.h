#ifndef EVENTS_H
#define EVENTS_H
#include "disease.h"
#define WORLD_EVENT_COUNT 200
#define WORLD_EVENT_SLOTS 4
#define EVENT_NONE 255
enum { EV_NONE,EV_SPREAD,EV_AIR,EV_SEA,EV_MIGRATION,EV_DISCOVERY,EV_RESEARCH,EV_BLOCK_AIR,EV_BLOCK_SEA };
enum { TARGET_LIVING,TARGET_ACTIVE,TARGET_HEALTHY,TARGET_HOT,TARGET_COLD,TARGET_HUMID,TARGET_DRY,TARGET_URBAN,TARGET_RURAL,TARGET_HEALTHCARE,TARGET_SEA,TARGET_AIR };
enum { BR_ALWAYS,BR_OWNS,BR_SEVERITY,BR_DEAD,BR_ACTIVE,BR_CURE,BR_RESPONSE };
typedef struct { uint8_t kind,trait; int8_t amount; } event_effect_t;
typedef struct {
 const char *name,*description;
 event_effect_t effect[2];
 uint16_t min_cycle;
 uint8_t group,chain,duration,target,min_response,required_trait,type_mask,min_active,min_dead,mitigate,branch,branch_trait,next_true,next_false;
} event_def_t;
typedef struct { uint8_t id,region,remaining; } active_event_t;
typedef struct {
 uint32_t rng,last_cycle,next_start;
 uint8_t occurred[25],reshuffles_seen;
 active_event_t active[WORLD_EVENT_SLOTS];
} event_state_t;
typedef struct {
 uint16_t air[REGION_COUNT],sea[REGION_COUNT],migration[REGION_COUNT];
 uint16_t discovery,research;
 uint8_t blocked_air,blocked_sea;
} event_modifiers_t;
typedef void (*event_notice_fn)(uint8_t id,uint8_t region,bool ended);
extern const event_def_t event_catalog[WORLD_EVENT_COUNT];
extern event_state_t world_events;
extern event_modifiers_t event_modifiers;
void EventsInit(event_state_t *s,const disease_t *d,uint32_t seed);
bool EventsValidate(const event_state_t *s,const disease_t *d);
bool EventsOccurred(const event_state_t *s,uint8_t id);
bool EventsEligible(const event_def_t *e,const disease_t *d,const counts_t counts[REGION_COUNT],uint8_t region);
void EventsAdvance(event_state_t *s,const disease_t *d,const counts_t counts[REGION_COUNT],event_notice_fn notice);
void EventsRefreshTraits(event_state_t *s,const disease_t *d);
void EventsApply(const event_state_t *s,const disease_t *d,const counts_t counts[REGION_COUNT],effects_t *effects,event_modifiers_t *mods);
int16_t EventAmount(const event_def_t *e,const event_effect_t *effect,const disease_t *d);
#endif
