#include "contagion.h"
#include <fileioc.h>
#include <stdio.h>
extern void RefreshEffects(void);
static bool FileRead(void *context, void *data, size_t n) { return ti_Read(data,1,n,*(uint8_t *)context)==n; }
static bool FileWrite(void *context, const void *data, size_t n) { return ti_Write(data,1,n,*(uint8_t *)context)==n; }
static bool FileSeek(void *context, uint32_t offset) { return ti_Seek((int)offset,SEEK_SET,*(uint8_t *)context)!=EOF; }
static save_io_t FileIO(uint8_t *handle) {
 save_io_t io={handle,FileRead,FileWrite,FileSeek,ti_GetSize(*handle)}; return io;
}
static bool ReadNamed(const char *name, bool apply) {
 uint8_t handle=ti_Open(name,"r"); bool ok; save_io_t io;
 if(!handle) return false;
 io=FileIO(&handle);
 ok=apply?DecodeSaveV3(&io,&disease,&session,region,port,&world_events):ValidateSaveV3(&io,region);
 ti_Close(handle); return ok;
}
static bool ReadLegacyNamed(const char *name, bool apply) {
 uint8_t handle=ti_Open(name,"r"); bool ok; save_io_t io;
 if(!handle) return false;
 io=FileIO(&handle);
 ok=apply?DecodeSave(&io,&disease,&session,region,port):ValidateSave(&io,region);
 ti_Close(handle); return ok;
}
bool LoadData(void) {
 if(ReadNamed(SAVE_NAME,true) || ReadNamed(SAVE_BACKUP,true)) { RefreshEffects(); return true; }
 ResetGameState(); return false;
}
bool HasLegacySave(void) {
 return ReadLegacyNamed("CNTGN2",false) || ReadLegacyNamed("CNTGN2B",false);
}
static uint32_t LegacySeed(void) {
 uint32_t hash=UINT32_C(2166136261); uint8_t i; unsigned shift;
 for(shift=0;shift<32;shift+=8) { hash^=(uint8_t)(session.ticks>>shift); hash*=UINT32_C(16777619); }
 for(shift=0;shift<32;shift+=8) { hash^=(uint8_t)(disease.cycles>>shift); hash*=UINT32_C(16777619); }
 for(i=0;i<sizeof(disease.name) && disease.name[i];i++) { hash^=(uint8_t)disease.name[i]; hash*=UINT32_C(16777619); }
 return hash?hash:UINT32_C(0x9e3779b9);
}
bool ImportLegacySave(void) {
 if(!ReadLegacyNamed("CNTGN2",true) && !ReadLegacyNamed("CNTGN2B",true)) return false;
 EventsInit(&world_events,&disease,LegacySeed());
 RefreshEffects();
 return true;
}
/* FileIOC rename archives its source, invoking TI-OS archive/GC machinery.
 * Keep replacement in RAM while GraphX owns the display; copy through handles
 * so FileIOC can track data movement as the destination grows. */
static bool CopyNamed(const char *source, const char *destination) {
 uint8_t input=ti_Open(source,"r"),output,buffer[32];
 size_t remaining,count; bool ok=true;
 if(!input) return false;
 remaining=ti_GetSize(input);
 output=ti_Open(destination,"w");
 if(!output) { ti_Close(input); return false; }
 while(remaining) {
  count=remaining>sizeof(buffer)?sizeof(buffer):remaining;
  if(ti_Read(buffer,1,count,input)!=count || ti_Write(buffer,1,count,output)!=count) { ok=false; break; }
  remaining-=count;
 }
 ti_Close(input); ti_Close(output);
 return ok && ReadNamed(destination,false);
}
bool SaveData(void) {
 uint8_t handle; save_io_t io; bool ok;
 handle=ti_Open(SAVE_TEMP,"w"); if(!handle) return false;
 io=FileIO(&handle); ok=EncodeSaveV3(&io,&disease,&session,region,port,&world_events);
 ti_Close(handle);
 if(!ok || !ReadNamed(SAVE_TEMP,false)) { ti_Delete(SAVE_TEMP); return false; }
 /* Never overwrite the primary until its previous generation is validated in
  * the backup. If copying the primary fails, LoadData falls back to that copy. */
 if(ReadNamed(SAVE_NAME,false) && !CopyNamed(SAVE_NAME,SAVE_BACKUP)) return false;
 if(!CopyNamed(SAVE_TEMP,SAVE_NAME)) return false;
 ti_Delete(SAVE_TEMP);
 return true;
}
