/* Development-only native diagnostic. Never include this in the transfer ZIP.
 * Uses the production engine, save codec and actual TI-OS/FileIOC, not stubs.
 * Run only in an isolated emulator: deliberately replaces CNTGN2* AppVars. */
#define main contagion_game_main
#include "../../src/main.c"
#undef main
#include <fileioc.h>
#include <ti/vars.h>
volatile uint16_t native_check;
static disease_t expected;
static session_t expected_session;
static void Check(bool ok, uint16_t stage) {
 native_check=stage;
 if(!ok) {
  native_check=0x8000U|stage;
  char message[40];snprintf(message,sizeof(message),"FAIL native save check %u",stage);
  BeginScreen(message);gfx_SwapDraw();for(;;) kb_Scan();
 }
}
static void RestoreCheck(uint16_t stage) {
 ResetGameState();Check(LoadData(),stage);
 Check(!memcmp(&disease,&expected,sizeof(disease)),stage+1);
 Check(!memcmp(&session,&expected_session,sizeof(session)),stage+2);
 Check(LandCount(CountWorld(region))==4410,stage+3);
}
static void Corrupt(const char *name) {
 uint8_t h=ti_Open(name,"w"),bad=0;Check(h!=0,90);
 Check(ti_Write(&bad,1,1,h)==1,91);ti_Close(h);
}
int main(void) {
 uint8_t h,i;size_t available,amount;char filler[]="CNTEST0";
 gfx_Begin();gfx_SetDrawBuffer();InitializeMap();ResetGameState();
 /* Optional archived production save supplied by the harness. */
 h=ti_Open(SAVE_NAME,"r");
 if(h) {
  Check(ti_IsArchived(h),2);ti_Close(h);Check(LoadData(),3);
  expected=disease;expected_session=session;
  Check(SaveData(),4);RestoreCheck(5);
 }
 ti_Delete(SAVE_NAME);ti_Delete(SAVE_BACKUP);ti_Delete(SAVE_TEMP);
 ResetGameState();
 for(i=0;i<8;i++){filler[6]='0'+i;ti_Delete(filler);}
 disease.started=1;Check(SeedRegion(region,&disease,0,GameRandom),1);
 session.next_region=4;session.selected=2;session.view=1;session.ticks=12345;
 expected=disease;expected_session=session;
 Check(SaveData(),10);RestoreCheck(11);
 /* A second save creates a validated recovery generation. */
 Check(SaveData(),20);Corrupt(SAVE_NAME);RestoreCheck(21);
 Check(SaveData(),30);ti_Delete(SAVE_NAME);RestoreCheck(31);
 Check(SaveData(),40);
 /* Exhaust RAM with actual AppVars, leaving too little for a temp save. */
 for(i=0;i<8;i++) {
  available=os_MemChk(NULL);if(available<1500)break;
  amount=available-1024;if(amount>60000)amount=60000;
  filler[6]='0'+i;h=ti_Open(filler,"w");Check(h!=0,50);
  Check(ti_Resize(amount,h)==(int)amount,51);ti_Close(h);
 }
 Check(!SaveData(),52);
 for(i=0;i<8;i++){filler[6]='0'+i;ti_Delete(filler);}
 RestoreCheck(53);Check(SaveData(),57);
 /* Prefix-only primary represents interruption during replacement. */
 Corrupt(SAVE_NAME);RestoreCheck(60);
 /* Both copies invalid: safe new-game reset, never partial application. */
 Corrupt(SAVE_BACKUP);Check(!LoadData(),70);
 Check(!disease.started && disease.dna==START_DNA && !session.next_region,71);
 Check(CountWorld(region).healthy==4410,72);
 /* Leave a valid production save for the harness to export and reinject archived. */
 Check(SaveData(),73);
 native_check=1000;
 BeginScreen("PASS: NATIVE SAVE CHECKS");
 Text("Roundtrip, partial cycle, backup",8,50);
 Text("Corrupt/missing primary, archive",8,75);
 Text("Full RAM, interrupted copy, reset",8,100);
 gfx_SwapDraw();WaitKey();
 /* Explicit outcome fixtures: not represented as natural playthroughs. */
 ResetGameState();disease.started=1;
 EvaluateOutcome(&disease,CountWorld(region));Check(disease.result==LOST_EXTINCTION,1001);
 native_check=1001;ResultScreen();
 ResetGameState();disease.started=1;SeedRegion(region,&disease,0,GameRandom);
 disease.cure=10000;EvaluateOutcome(&disease,CountWorld(region));Check(disease.result==LOST_CURE,1002);
 native_check=1002;ResultScreen();
 for(i=0;i<REGION_COUNT;i++) {
  size_t j;for(j=0;j<(size_t)region[i].width*region[i].height;j++)if(region[i].data[j])region[i].data[j]=CELL_DEAD;
  RecountRegion(&region[i]);
 }
 disease.result=PLAYING;EvaluateOutcome(&disease,CountWorld(region));Check(disease.result==WON,1003);
 native_check=1003;ResultScreen();
 /* Funded UI fixture: purchases still go through the real UI/rules. */
 ResetGameState();disease.type=FUNGUS;disease.started=1;
 SeedRegion(region,&disease,0,GameRandom);disease.dna=1000;
 disease.response=RESEARCH;disease.cure=9000;disease.cycles=100;disease.discovery_cycle=50;
 CalculateEffects(&disease,&effects);
 native_check=1100;
 while(disease.owned[0]!=UINT32_MAX || disease.owned[1]!=127 || disease.spores_used!=3) {
  BeginScreen("FUNDED UI TEST FIXTURE");gfx_SwapDraw();WaitKey();EvolutionMenu();
 }
 disease.type=VIRUS;native_check=1200;
 while(Owns(&disease,RESP_FAILURE)) {
  BeginScreen("VIRUS DEVOLUTION FIXTURE");gfx_SwapDraw();WaitKey();EvolutionMenu();
 }
 native_check=2000;BeginScreen("PASS: OUTCOME FIXTURES");gfx_SwapDraw();for(;;)kb_Scan();
}
