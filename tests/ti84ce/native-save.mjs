import fs from 'node:fs';
import {pathToFileURL} from 'node:url';
import path from 'node:path';
import assert from 'node:assert/strict';
import {createHash} from 'node:crypto';
const root=process.env.TI84CE_ROOT;
const rom=process.env.AUTOTESTER_ROM;
const libs=process.env.CE_LIBRARIES;
assert(root && rom && libs, 'Set TI84CE_ROOT, AUTOTESTER_ROM, CE_LIBRARIES');
const output=path.resolve(process.env.TI84CE_OUTPUT || '/tmp/contagion-smoke');
fs.mkdirSync(output,{recursive:true});
const modulePath=path.join(root,'web/src/emu-core/emu_core.js');
const {initSync,WasmEmu}=await import(pathToFileURL(modulePath));
const snapshots=new Map();
initSync({module:fs.readFileSync(path.join(root,'web/src/emu-core/emu_core_bg.wasm'))});
let refModule; let e=new WasmEmu(); e.load_rom(fs.readFileSync(rom));
for(const f of ['libload','graphx','keypadc','fileioc']) e.send_file(fs.readFileSync(path.join(libs,`${f}.8xv`)));
if(process.env.ARCHIVE_FIXTURE)e.send_file(fs.readFileSync(process.env.ARCHIVE_FIXTURE));
e.send_file(fs.readFileSync(path.resolve(process.env.CONTAGION_PROGRAM || 'bin/CNTAGION.8xp')));
fs.writeFileSync(path.join(output,'preloaded.rom'),e.save_state().slice(-4194304));
if(process.env.TI84CE_BACKEND !== 'rust') {
 const {default:WebCEmu}=await import(pathToFileURL(path.join(root,'web/src/cemu-core/WebCEmu.js')));
 globalThis.emul_is_inited=false;globalThis.emul_is_paused=true;
 for(const f of ['initFuncs','initLCD','enableGUI','disableGUI'])globalThis[f]=()=>{};
 const m=refModule=await WebCEmu({noExitRuntime:true,print:console.log,printErr:console.error});
 m.FS.writeFile('/CE.rom',fs.readFileSync(path.join(output,'preloaded.rom')));m.FS.chdir('/');
 const p=m._malloc(8);m.HEAPU8.set(new TextEncoder().encode('/CE.rom\0'),p);m._emu_init(p);m._free(p);
 e={run_cycles:()=>m._emu_step(1),set_key:(r,c,d)=>m._emu_keypad_event(r,c,d),debug_status:()=>'',dump_state:()=>'',save_state:()=>new Uint8Array(), get_framebuffer_rgba:()=>{
 const a=new Uint32Array(m.HEAPU8.buffer,m._lcd_get_frame(),320*240),b=new Uint8Array(a.length*4);
 for(let i=0;i<a.length;i++){b[i*4]=a[i]>>>16;b[i*4+1]=a[i]>>>8;b[i*4+2]=a[i];b[i*4+3]=255;}return b;
 }};
} else e.power_on();
function run(n=60){for(let i=0;i<n;i++)e.run_cycles(800000);}
let releaseFrames=180;
function key(r,c){e.set_key(r,c,true);run(30);e.set_key(r,c,false);run(releaseFrames);}
run(240);key(6,6);key(4,6);key(5,1);key(6,0);run(180);

run(1800);
fs.writeFileSync(path.join(output,'native-save.rgba'),e.get_framebuffer_rgba());
const map=fs.readFileSync(process.env.CONTAGION_MAP,'utf8');
const addr=n=>parseInt(map.match(new RegExp('0x([0-9a-f]+) +_'+n+'\\s'))[1],16);
const b=Buffer.from(refModule.HEAPU8.buffer),daddr=addr('disease'),raddr=addr('region'),status=addr('native_check');
const found=[];
for(let at=b.indexOf('Pathogen');at>=0;at=b.indexOf('Pathogen',at+1)){
 const base=at-37-(daddr-0xD00000),r=base+raddr-0xD00000,check=base+status-0xD00000;
 if(r<0||r+112>b.length||check<0||check+2>b.length)continue;
 let land=0;for(let i=0;i<7;i++)for(let k=0;k<3;k++)land+=b.readUInt16LE(r+i*16+10+k*2);
 if(land===4410)found.push({base,stage:b.readUInt16LE(check)});
}
console.log('NATIVE SAVE CHECK',found);
// Export only a checksum-valid production save as a development archive fixture.
for(let at=b.indexOf('CNTG');at>=0;at=b.indexOf('CNTG',at+1)){
 if(b[at+4]!==2||b.readUInt32LE(at+5)!==10923||at+10923>b.length)continue;
 const data=b.subarray(at,at+10923);let hash=2166136261;
 for(const byte of data.subarray(0,-4))hash=Math.imul(hash^byte,16777619)>>>0;
 if(hash!==data.readUInt32LE(data.length-4))continue;
 const variable=Buffer.alloc(data.length+2);variable.writeUInt16LE(data.length);data.copy(variable,2);
 const entry=Buffer.alloc(17+variable.length);entry.writeUInt16LE(13);entry.writeUInt16LE(variable.length,2);entry[4]=0x15;
 entry.write('CNTGN2',5);entry[14]=128;entry.writeUInt16LE(variable.length,15);variable.copy(entry,17);
 const header=Buffer.alloc(55);header.write('**TI83F*');header.set([26,10,0],8);header.writeUInt16LE(entry.length,53);
 const checksum=Buffer.alloc(2);checksum.writeUInt16LE(entry.reduce((a,v)=>(a+v)&65535,0));
 fs.writeFileSync(path.join(output,'archive-fixture.8xv'),Buffer.concat([header,entry,checksum]));break;
}

assert(found.some(v=>v.stage===1000),'Native diagnostic must reach PASS, inspect stage/screenshot on failure');
console.log('PASS: actual FileIOC roundtrip, partial cycle, corruption, recovery, storage exhaustion, reset; archived fixture: '+Boolean(process.env.ARCHIVE_FIXTURE));

if(process.env.SAVE_ONLY==='1')process.exit(0);
releaseFrames=60; // Modal screens only; retain conservative boot timing.
const ramBase=found.find(v=>v.stage===1000).base;
const stage=()=>Buffer.from(refModule.HEAPU8.buffer).readUInt16LE(ramBase+status-0xD00000);
const d=()=>{const h=Buffer.from(refModule.HEAPU8.buffer),at=ramBase+daddr-0xD00000;return {owned:[h.readUInt32LE(at),h.readUInt32LE(at+4)],dna:h.readUInt16LE(at+20),cycles:h.readUInt32LE(at+8),cure:h.readUInt16LE(at+22),spores:h[at+36]};};
function shot(name){fs.writeFileSync(path.join(output,name+'.rgba'),e.get_framebuffer_rgba());}
for(const expected of [1001,1002,1003]){
 key(6,0);assert.equal(stage(),expected);shot(`outcome-${expected}`);
 const before=d();run(300);assert.deepEqual(d(),before);
}
key(6,0);assert.equal(stage(),1100);
// Region Details and Travel View return to Actions and remain paused.
key(6,0);const paused=d();shot('actions');
key(7,0);key(7,0);key(6,0);shot('region');key(6,0);
key(7,0);key(6,0);shot('travel-toggle');run(300);
assert.deepEqual(d(),paused);key(6,6);
const traits=fs.readFileSync('src/traits.c','utf8').split('\n').filter(l=>l.startsWith(' {"')).map(l=>{
 const m=l.match(/\{"([^"]+)", "[^"]+", \{(\d+),(\d+)\}, (\d+), (\d+).*\{(\d+),(\d+),(\d+),(\d+)\}\}/);
 return {name:m[1],cost:+m[4],category:+m[5],neighbors:m.slice(6).map(Number)};
});
function detail(id){
 key(6,0);key(7,0);key(6,0);const cat=traits[id].category;
 for(let i=0;i<cat;i++)key(7,0);
 key(6,0);
 const q=[[[0,17,29][cat],[]]],seen=new Set();
 while(q.length){const [at,steps]=q.shift();if(seen.has(at))continue;seen.add(at);
  if(at===id){for(const k of steps)key(7,[1,2,3,0][k]);key(6,0);return;}
  traits[at].neighbors.forEach((next,k)=>q.push([next,[...steps,k]]));
 }
 throw Error('No UI route');
}
for(let id=0;id<39;id++){
 detail(id);const before=d();
 // A long held Enter must buy only once. Duplicate Enter must also be inert.
 e.set_key(6,0,true);run(180);e.set_key(6,0,false);run(180);
 const after=d();assert.equal(after.dna,before.dna-traits[id].cost);
 assert(after.owned[id>>>5]&(1<<(id%32)));assert.equal(after.cycles,before.cycles);
 key(6,0);assert.deepEqual(d(),after,'Duplicate purchase is inert');
 if([14,16,20,28,38].includes(id))shot(`detail-${id}`);
 key(6,6);key(6,6);key(6,6);key(6,6);
}
function spores(){key(6,0);for(let i=0;i<4;i++)key(7,0);key(6,0);}
spores();const cancelled=d();key(6,6);key(6,6);assert.deepEqual(d(),cancelled,'Cancel spores is inert');
spores();for(const cost of [10,16,24]){const before=d();key(6,0);assert.equal(d().dna,before.dna-cost);assert.equal(d().spores,before.spores+1);}
const spent=d();key(6,0);assert.deepEqual(d(),spent,'Fourth spore is inert');shot('three-spores');key(6,6);key(6,6);
assert.equal(stage(),1200);
detail(19);const blocked=d();key(7,0);key(6,0);assert.deepEqual(d(),blocked,'Cannot devolve a prerequisite');key(6,6);key(6,6);key(6,6);key(6,6);
detail(20);const before=d();key(7,0);key(6,0);assert.equal(d().dna,before.dna-7);assert(!(d().owned[0]&(1<<20)));shot('devolved');key(6,6);key(6,6);key(6,6);key(6,6);
assert.equal(stage(),1300);
for(let i=0;i<4;i++)key(7,0);key(6,0);
const poor=d();key(6,0);assert.deepEqual(d(),poor);shot('spore-no-dna');key(6,6);key(6,6);
assert.equal(stage(),1400);
for(let i=0;i<4;i++)key(7,0);key(6,0);
const full=d();key(6,0);assert.deepEqual(d(),full);shot('spore-no-land');key(6,6);key(6,6);
run(600);assert.equal(stage(),1500);shot('save-failed');
key(7,0);key(6,0);run(600);assert.equal(stage(),1500,'Retry still cannot save');
key(7,0);key(7,0);key(6,0);key(6,0);assert.equal(stage(),1500,'Default confirmation cannot quit');
key(6,6);run(600);assert.equal(stage(),1600,'Clear returns without quitting');
key(7,0);key(7,0);key(6,0);key(7,0);key(6,0);
run(600);assert.equal(stage(),2000);shot('complete');
console.log('PASS: all 39 native UI purchases, held Enter, duplicate purchase, all spore charges/cancel/exhaustion, Virus leaf devolution, all outcome screens and victory precedence');
