#include "savecodec.h"
#include <string.h>
/* FNV-1a is a corruption checksum, not authentication. */
typedef struct { save_io_t *io; uint32_t hash; bool ok, writing; } stream_t;
static void Bytes(stream_t *s, void *bytes, size_t n) {
 size_t i; uint8_t *b=bytes;
 if(!s->ok) return;
 s->ok=s->writing?s->io->write(s->io->context,bytes,n):s->io->read(s->io->context,bytes,n);
 if(s->ok) for(i=0;i<n;i++) { s->hash^=b[i]; s->hash*=UINT32_C(16777619); }
}
static void U8(stream_t *s, uint8_t *v) { Bytes(s,v,1); }
static void U16(stream_t *s, uint16_t *v) {
 uint8_t b[2]={(uint8_t)*v,(uint8_t)(*v>>8)};
 Bytes(s,b,2); if(!s->writing && s->ok) *v=(uint16_t)b[0]|((uint16_t)b[1]<<8);
}
static void U32(stream_t *s, uint32_t *v) {
 uint8_t b[4]={(uint8_t)*v,(uint8_t)(*v>>8),(uint8_t)(*v>>16),(uint8_t)(*v>>24)};
 Bytes(s,b,4); if(!s->writing && s->ok) *v=(uint32_t)b[0]|((uint32_t)b[1]<<8)|((uint32_t)b[2]<<16)|((uint32_t)b[3]<<24);
}
uint32_t SaveSize(const region_t r[REGION_COUNT]) {
 uint8_t i; uint32_t size=110; /* 9 header + 57 disease + 9 session + 3 ports + 28 geometry + 4 checksum */
 for(i=0;i<REGION_COUNT;i++) size+=(uint32_t)r[i].width*r[i].height;
 return size;
}
static void Header(stream_t *st, const region_t r[REGION_COUNT]) {
 uint8_t magic[4]={'C','N','T','G'}, version=SAVE_VERSION; uint32_t length=SaveSize(r);
 Bytes(st,magic,4); U8(st,&version); U32(st,&length);
 if(memcmp(magic,"CNTG",4) || version!=SAVE_VERSION || length!=SaveSize(r)) st->ok=false;
}
static void State(stream_t *st, disease_t *d, session_t *s, uint8_t ports[3]) {
 U32(st,&d->owned[0]); U32(st,&d->owned[1]); U32(st,&d->cycles); U32(st,&d->discovery_cycle); U32(st,&d->discovery_pressure);
 U16(st,&d->dna); U16(st,&d->cure); U16(st,&d->cure_fraction); U16(st,&d->affected_rewards);
 U8(st,&d->death_rewards); U8(st,&d->region_rewards); U8(st,&d->seen_regions); U8(st,&d->cure_news);
 U8(st,&d->type); U8(st,&d->started); U8(st,&d->result); U8(st,&d->response); U8(st,&d->spores_used);
 Bytes(st,d->name,sizeof(d->name)); U32(st,&s->ticks);
 U8(st,&s->selected); U8(st,&s->next_region); U8(st,&s->cursorx); U8(st,&s->cursory); U8(st,&s->view);
 Bytes(st,ports,3);
 if(!ValidateDisease(d) || s->selected>=REGION_COUNT || s->next_region>=REGION_COUNT || s->cursorx>=160 || s->cursory>=120 || s->view>1 || ports[2]>63 || (d->response==UNDETECTED && (ports[0] || ports[1] || ports[2]))) st->ok=false;
}
static void Geometry(stream_t *st, const region_t *r) {
 uint8_t b[4]={r->width,r->height,r->x,r->y}; Bytes(st,b,4);
 if(b[0]!=r->width || b[1]!=r->height || b[2]!=r->x || b[3]!=r->y) st->ok=false;
}
static void Checksum(stream_t *st) {
 uint32_t expected=st->hash,actual=expected; U32(st,&actual);
 if(actual!=expected) st->ok=false;
}
bool EncodeSave(save_io_t *io, const disease_t *d, const session_t *s, const region_t r[REGION_COUNT], const port_t p[PORT_COUNT]) {
 stream_t st={io,UINT32_C(2166136261),true,true};
 disease_t copy=*d; session_t session=*s; uint8_t bits[3]={0,0,0},i;
 for(i=0;i<PORT_COUNT;i++) if(p[i].closed) bits[i/8]|=1U<<(i%8);
 Header(&st,r); State(&st,&copy,&session,bits);
 for(i=0;i<REGION_COUNT;i++) { Geometry(&st,&r[i]); Bytes(&st,r[i].data,(size_t)r[i].width*r[i].height); }
 Checksum(&st); return st.ok;
}
static bool ReadSave(save_io_t *io, disease_t *out, session_t *session, region_t r[REGION_COUNT], port_t p[PORT_COUNT], bool apply) {
 stream_t st={io,UINT32_C(2166136261),true,false};
 disease_t d={0}; session_t s={0}; uint8_t bits[3]={0},buffer[32],i,seen=0;
 counts_t total={0,0,0};
 if(io->size!=SaveSize(r) || !io->seek(io->context,0)) return false;
 Header(&st,r); State(&st,&d,&s,bits);
 for(i=0;i<REGION_COUNT && st.ok;i++) {
  size_t offset=0,n=(size_t)r[i].width*r[i].height;
  Geometry(&st,&r[i]);
  while(offset<n && st.ok) {
   size_t j,count=n-offset; if(count>sizeof(buffer)) count=sizeof(buffer);
   Bytes(&st,buffer,count);
   if(!st.ok) break;
   for(j=0;j<count;j++) {
    uint8_t v=buffer[j]; bool land=r[i].data[offset+j]!=CELL_EMPTY;
    if((!land && v!=CELL_EMPTY) || (land && v!=CELL_HEALTHY && v!=CELL_INFECTED && v!=CELL_DEAD)) { st.ok=false; break; }
    if(v==CELL_HEALTHY) total.healthy++;
    if(v==CELL_INFECTED) { total.active++; seen|=1U<<i; }
    if(v==CELL_DEAD) { total.dead++; seen|=1U<<i; }
   }
   if(apply && st.ok) memcpy(r[i].data+offset,buffer,count);
   offset+=count;
  }
 }
 Checksum(&st);
 if((seen!=d.seen_regions) || (!d.started && seen) || (d.started && !seen)) st.ok=false;
 if(d.result!=PLAYING) {
  disease_t check=d; check.result=PLAYING; EvaluateOutcome(&check,total);
  if(check.result!=d.result || s.next_region!=0) st.ok=false;
 }
 if(!st.ok) return false;
 if(apply) {
  *out=d; *session=s;
  for(i=0;i<PORT_COUNT;i++) p[i].closed=(bits[i/8]&(1U<<(i%8)))!=0;
  for(i=0;i<REGION_COUNT;i++) RecountRegion(&r[i]);
 }
 return true;
}
bool ValidateSave(save_io_t *io, const region_t r[REGION_COUNT]) {
 /* ReadSave's validation pass never modifies region data or metadata. */
 return ReadSave(io,NULL,NULL,(region_t *)r,NULL,false);
}
bool DecodeSave(save_io_t *io, disease_t *d, session_t *s, region_t r[REGION_COUNT], port_t p[PORT_COUNT]) {
 if(!ValidateSave(io,r)) return false;
 return ReadSave(io,d,s,r,p,true);
}
