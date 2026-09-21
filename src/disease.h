#ifndef DISEASE_H
#define DISEASE_H
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#define REGION_COUNT 7
#define PORT_COUNT 22
#define TRAIT_COUNT 39
#define NO_TRAIT 255
#include "balance.h"
#define CELL_EMPTY 0
#define CELL_DEAD 64
#define CELL_INFECTED 224
#define CELL_HEALTHY 255

typedef enum { BACTERIA, VIRUS, FUNGUS } disease_type_t;
typedef enum { PLAYING, WON, LOST_EXTINCTION, LOST_CURE } result_t;
typedef enum { UNDETECTED, DISCOVERED, RESEARCH, ESCALATING } response_t;
typedef enum {
 AIR1, AIR2, WATER1, WATER2, LIVESTOCK1, LIVESTOCK2, RODENTS1, RODENTS2,
 INSECTS1, INSECTS2, BIRDS1, BIRDS2, BLOOD1, BLOOD2, AEROSOL, RESERVOIRS, VECTOR,
 COUGH, SNEEZING, PNEUMONIA, RESP_FAILURE, NAUSEA, VOMITING, DIARRHEA, COLLAPSE,
 RASH, FEVER, IMMUNE, ORGAN, HEAT1, HEAT2, COLD1, COLD2, MEDICAL1, MEDICAL2,
 HARDEN1, HARDEN2, RESHUFFLE1, RESHUFFLE2
} trait_id_t;
/* Navigation order is left, right, up, down. */
typedef struct {
 const char *name, *description;
 uint8_t prerequisite[2], cost, category;
 uint8_t infectivity, severity, lethality;
 uint16_t x;
 uint8_t y, neighbor[4];
} trait_t;
typedef struct { uint8_t heat, cold, humid, dry, urban, rural, healthcare; } environment_t;
typedef struct { uint16_t healthy, active, dead; } counts_t;
typedef uint16_t (*random_fn)(uint16_t exclusive_limit);
typedef struct {
 uint32_t owned[2], cycles, discovery_cycle, discovery_pressure;
 uint16_t dna, cure, cure_fraction, affected_rewards;
 uint8_t death_rewards, region_rewards, seen_regions, cure_news;
 uint8_t type, started, result, response, spores_used;
 char name[20];
} disease_t;
typedef struct {
 uint16_t spread[REGION_COUNT], infectivity, severity, lethality, resistance;
 uint16_t air, sea, migration;
} effects_t;
enum { EVENT_DISCOVERY=1, EVENT_RESEARCH=2, EVENT_RESPONSE=4,
 EVENT_CURE25=8, EVENT_CURE50=16, EVENT_CURE75=32, EVENT_CURE90=64 };
extern const trait_t traits[TRAIT_COUNT];
extern const environment_t environments[REGION_COUNT];
extern const char * const disease_names[3];
extern const uint8_t spore_costs[3];
extern const uint16_t reshuffle_reductions[2];
uint16_t ClampProbability(int32_t p);
uint8_t Percentage(uint16_t value, uint16_t total);
uint16_t LandCount(counts_t c);
bool Roll(random_fn random, uint16_t probability);
bool Owns(const disease_t *d, uint8_t id);
bool Eligible(const disease_t *d, uint8_t id);
bool Purchase(disease_t *d, uint8_t id);
bool CanDevolve(const disease_t *d, uint8_t id);
bool Devolve(disease_t *d, uint8_t id);
uint8_t DevolveCost(const disease_t *d);
void ResetDisease(disease_t *d);
void CalculateEffects(const disease_t *d, effects_t *e);
uint8_t Mutate(disease_t *d, random_fn random);
void AwardDNA(disease_t *d, counts_t total);
uint8_t AdvanceDisease(disease_t *d, const counts_t regions[REGION_COUNT], const effects_t *e);
void EvaluateOutcome(disease_t *d, counts_t total);
bool ValidateDisease(const disease_t *d);
#endif
