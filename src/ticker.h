#ifndef TICKER_H
#define TICKER_H
#include "disease.h"
#define TICKER_SLOTS 8
#define TICKER_WIDTH 312
#define TICKER_HZ UINT32_C(32768)
typedef enum {
 NEWS_DISCOVERY, NEWS_RESEARCH, NEWS_RESPONSE, NEWS_CURE, NEWS_CLOSURE,
 NEWS_MUTATION, NEWS_SPORE, NEWS_REGION, NEWS_AFFECTED, NEWS_DEATH,
 NEWS_REACHED, NEWS_HEALTHY, NEWS_PROGRESS, NEWS_CHARGES, NEWS_COUNT
} news_kind_t;
typedef struct { uint8_t kind,subject; uint16_t value; } news_event_t;
typedef struct {
 news_event_t queue[TICKER_SLOTS],last_report;
 uint32_t elapsed,duration;
 uint16_t width,affected;
 uint8_t count,seen,deaths,rotation;
 bool prepared;
 char text[80];
} ticker_t;
extern ticker_t ticker;
void TickerInit(const disease_t *d);
bool TickerPost(news_kind_t kind,uint8_t subject,uint16_t value);
void TickerObserve(const disease_t *d,const counts_t counts[REGION_COUNT]);
uint8_t TickerPriority(news_event_t event);
const char *TickerText(void);
void TickerPrepare(uint16_t width);
void TickerUpdate(uint32_t elapsed);
uint16_t TickerOffset(void);
void TickerRender(void);
#endif
