#ifndef SAVECODEC_H
#define SAVECODEC_H
#include "world.h"
#define SAVE_NAME "CNTGN2"
#define SAVE_TEMP "CNTGN2T"
#define SAVE_BACKUP "CNTGN2B"
#define SAVE_VERSION 2
/* UI/scheduler fields only; never encode native structs. */
typedef struct {
 uint32_t ticks;
 uint8_t selected, next_region, cursorx, cursory, view;
} session_t;
typedef struct {
 void *context;
 bool (*read)(void *, void *, size_t);
 bool (*write)(void *, const void *, size_t);
 bool (*seek)(void *, uint32_t);
 uint32_t size;
} save_io_t;
uint32_t SaveSize(const region_t regions[REGION_COUNT]);
bool EncodeSave(save_io_t *io, const disease_t *d, const session_t *s, const region_t r[REGION_COUNT], const port_t p[PORT_COUNT]);
bool ValidateSave(save_io_t *io, const region_t r[REGION_COUNT]);
bool DecodeSave(save_io_t *io, disease_t *d, session_t *s, region_t r[REGION_COUNT], port_t p[PORT_COUNT]);
#endif
