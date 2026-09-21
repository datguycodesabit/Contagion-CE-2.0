#ifndef WORLD_H
#define WORLD_H
#include "disease.h"
typedef struct {
 const char *name;
 uint8_t *data;
 uint8_t width, height, x, y;
 counts_t counts;
} region_t;
enum { PORT_AIR=1, PORT_SEA=2 };
typedef struct { uint8_t x,y,region,modes,threshold; bool closed; } port_t;
extern const port_t port_definitions[PORT_COUNT];
void RecountRegion(region_t *r);
counts_t CountWorld(const region_t r[REGION_COUNT]);
bool SetCell(region_t *r, size_t index, uint8_t state);
bool InfectCoordinate(region_t r[REGION_COUNT], disease_t *d, int x, int y);
bool SeedRegion(region_t r[REGION_COUNT], disease_t *d, uint8_t destination, random_fn random);
void StepRegion(region_t *r, uint16_t spread, uint16_t lethality, random_fn random);
bool StepWorldRegion(region_t r[REGION_COUNT], uint8_t *next, const effects_t *e, random_fn random);
bool ValidPort(const region_t r[REGION_COUNT], const port_t *p);
bool Transport(region_t r[REGION_COUNT], port_t p[PORT_COUNT], disease_t *d, const effects_t *e, random_fn random, uint8_t *source, uint8_t *destination);
bool Migrate(region_t r[REGION_COUNT], disease_t *d, const effects_t *e, random_fn random);
bool SporeBurst(region_t r[REGION_COUNT], disease_t *d, uint8_t destination, random_fn random);
uint8_t ClosePorts(const region_t r[REGION_COUNT], port_t p[PORT_COUNT], const disease_t *d, const effects_t *e, random_fn random);
#endif
