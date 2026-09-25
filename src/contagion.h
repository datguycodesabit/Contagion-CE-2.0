#ifndef CONTAGION_H
#define CONTAGION_H
#include "savecodec.h"
#include "ticker.h"
#include <graphx.h>
#include <keypadc.h>
#define WORLD_SCALE 2
extern disease_t disease;
extern effects_t effects;
extern region_t region[REGION_COUNT];
extern port_t port[PORT_COUNT];
extern session_t session;
enum { KEY_NONE, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_ENTER, KEY_CLEAR,
 KEY_GRAPH, KEY_PREVIOUS, KEY_NEXT, KEY_DELETE, KEY_ZOOM, KEY_MODE, KEY_OTHER };
uint8_t ReadKey(void);
uint8_t WaitKey(void);
void ReleaseKeys(void);
void BeginScreen(const char *title);
void Text(const char *text, int x, int y);
void WrapText(const char *text, int x, int y, int width, uint8_t lines);
void Message(const char *title, const char *message);
void MenuItem(const char *label, int y, bool selected);
bool MenuMove(uint8_t key, uint8_t *selected, uint8_t count);
uint8_t ChooseMenu(const char *title, const char * const *items, uint8_t count, uint8_t selected);
void EndModal(void);
uint8_t ActionsMenu(void);
uint16_t GameRandom(uint16_t limit);
void EvolutionMenu(void);
void RegionInfo(void);
void SporeMenu(void);
void ResultScreen(void);
void ResetGameState(void);
bool SaveData(void);
bool LoadData(void);
#endif
