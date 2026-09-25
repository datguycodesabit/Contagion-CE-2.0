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
function key(r,c){e.set_key(r,c,true);run(30);e.set_key(r,c,false);run(180);}
run(240);key(6,6);key(4,6);key(5,1);key(6,0);run(180);
console.log('MENU', e.debug_status(),e.dump_state());
key(6,0);run(60);
fs.writeFileSync(path.join(output,'menu.state'),e.save_state());
fs.writeFileSync(path.join(output,'menu.rgba'),e.get_framebuffer_rgba());
function snap(n){snapshots.set(n,createHash("sha256").update(e.get_framebuffer_rgba()).digest("hex"));if(process.env.TI84CE_BACKEND === 'rust')fs.writeFileSync(path.join(output,`${n}.state`),e.save_state());fs.writeFileSync(path.join(output,`${n}.rgba`),e.get_framebuffer_rgba());console.log(n,e.debug_status());}
const diseaseType=Number(process.env.DISEASE_TYPE || 0);
assert(Number.isInteger(diseaseType) && diseaseType>=0 && diseaseType<=2);
for(let i=0;i<diseaseType;i++) key(7,0);
key(6,0);for(let i=0;i<4;i++)key(7,0);key(6,0);key(6,0);run(180);snap('start');

const map=fs.readFileSync(process.env.CONTAGION_MAP || 'bin/CNTAGION.map','utf8');
const address=n=>parseInt(map.match(new RegExp('0x([0-9a-f]+) +_'+n+'\\s'))[1],16);
const daddr=address('disease'),raddr=address('region');
const heap=()=>Buffer.from(refModule.HEAPU8.buffer);
let ramBase;
for(let at=heap().indexOf('Pathogen');at>=0;at=heap().indexOf('Pathogen',at+1)) {
 const base=at-37-(daddr-0xD00000),r=base+raddr-0xD00000,d=at-37;
 if(base<0 || r+112>heap().length)continue;
 let land=0;for(let i=0;i<7;i++)for(let k=0;k<3;k++)land+=heap().readUInt16LE(r+i*16+10+k*2);
 if(land===4410 && heap()[d+33]===1 && heap()[d+32]===diseaseType){console.log('RAM',base);assert.equal(ramBase,undefined);ramBase=base;}
}
assert.notEqual(ramBase,undefined,'Locate actual calculator RAM');
const read=()=>{const b=heap(),d=ramBase+daddr-0xD00000,r=ramBase+raddr-0xD00000;let healthy=0,active=0,dead=0;const regions=[];
 for(let i=0;i<7;i++){regions.push({healthy:b.readUInt16LE(r+i*16+10),active:b.readUInt16LE(r+i*16+12)});healthy+=b.readUInt16LE(r+i*16+10);active+=b.readUInt16LE(r+i*16+12);dead+=b.readUInt16LE(r+i*16+14);}
 return {regions,spores:b[d+36],response:b[d+35],owned:[b.readUInt32LE(d),b.readUInt32LE(d+4)],cycles:b.readUInt32LE(d+8),dna:b.readUInt16LE(d+20),cure:b.readUInt16LE(d+22),result:b[d+34],healthy,active,dead};};
console.log('START',read());

// Drive production UI only. RAM access above is read-only and matches the packed
// eZ80 layout; map addresses are resolved from the matching native build.
const traits=fs.readFileSync('src/traits.c','utf8').split('\n').filter(l=>l.startsWith(' {"')).map(l=>{
 const m=l.match(/\{"([^"]+)", "[^"]+", \{(\d+),(\d+)\}, (\d+), (\d+).*\{(\d+),(\d+),(\d+),(\d+)\}\}/);
 assert(m,l);return {name:m[1],pre:[+m[2],+m[3]],cost:+m[4],category:+m[5],neighbors:m.slice(6).map(Number)};
});
const own=(s,id)=>Boolean(s.owned[id>>>5] & (1<<(id%32)));
const eligible=(s,id)=>!own(s,id)&&traits[id].pre.every(p=>p===255||own(s,p))&&s.dna>=traits[id].cost;
function navigate(id){
 key(6,0);key(7,0);key(6,0); // Actions -> Evolution
 const cat=traits[id].category;
 for(let i=0;i<cat;i++)key(7,0);
 key(6,0);
 const start=[0,17,29][cat],queue=[[start,[]]],seen=new Set([start]);
 while(queue.length){const [at,steps]=queue.shift();if(at===id){
  for(const step of steps)key(7,[1,2,3,0][step]);key(6,0);return;
 }for(let k=0;k<4;k++){const next=traits[at].neighbors[k];if(!seen.has(next)){seen.add(next);queue.push([next,[...steps,k]]);}}}
 throw Error('unreachable trait');
}
let purchases=0,devolutions=0;
function buy(id,remove=false){
 navigate(id);const before=read();if(remove)key(7,0);key(6,0);const after=read();
 assert.equal(own(after,id),!remove,`UI action ${traits[id].name}`);
 assert.equal(after.dna,before.dna-(remove?(diseaseType===1?7:4):traits[id].cost));
 assert.equal(after.cycles,before.cycles,'Detail remains paused');
 if(remove)devolutions++;else purchases++;
 console.log(remove?'DEVOLVE':'BUY',traits[id].name,after.dna);
 key(6,6);key(6,6);key(6,6);key(6,6);
}
const opening=[2,0,4,8,3,1,31,35,36];let order=0,lastCycle=-1,stalls=0;
const scenario=process.env.SCENARIO || 'win';
assert(['win','cure'].includes(scenario),'Use win or cure; extinction is covered by the explicit native fixture');
for(let iteration=0;iteration<10000;iteration++){
 let s=read();assert.equal(s.healthy+s.active+s.dead,4410,'Exact native cached population');
 if(s.result)break;
 if(s.cycles>=8000)throw Error('Cycle bound exceeded');
 if(s.cycles===lastCycle){if(++stalls>10){snap('stalled');throw Error('Game stopped progressing');}}else stalls=0;
 lastCycle=s.cycles;
 if(iteration%50===0)console.log('PROGRESS',JSON.stringify(s));
  if(diseaseType===1&&s.healthy>0)for(const id of [28,27,24,23,20,19]){
   s=read();if(own(s,id)&&s.dna>=7&&!traits.some((t,i)=>own(s,i)&&t.pre.includes(id)))buy(id,true);
  }
  s=read();
  if(order<opening.length&&own(s,opening[order]))order++;
  if(order<opening.length&&eligible(s,opening[order])){buy(opening[order]);order++;}
  s=read();
  if(diseaseType===2&&s.spores<3&&s.cycles>50&&s.dna>=[10,16,24][s.spores]+6){
   const target=s.regions.findIndex(r=>r.healthy&&!r.active);
   if(target>=0){key(6,0);for(let i=0;i<4;i++)key(7,0);key(6,0);
    // session.selected remains Africa throughout this policy.
    for(let i=0;i<target;i++)key(7,0);
    const before=read();key(6,0);assert.equal(read().spores,before.spores+1);
    snap(`spore-${read().spores}`);key(6,6);key(6,6);
   }
  }
  if(scenario==='win'&&read().healthy===0)for(const id of [17,18,19,20])if(eligible(read(),id))buy(id);
  if(scenario==='win')for(const id of [37,38])if(read().cure>8000&&eligible(read(),id))buy(id);
 run(240);
}
run(600);const final=read();snap('result');console.log('FINAL',JSON.stringify({...final,purchases,devolutions}));
assert.equal(final.result,{win:1,extinction:2,cure:3}[scenario]);
const frozen=read();run(600);assert.deepEqual(read(),frozen,'Result screen pauses mechanics');
key(6,0);snap('result-menu');key(6,0);snap('reopened-result');assert.deepEqual(read(),frozen);
key(6,6);key(7,3);key(6,0);key(6,0);for(let i=0;i<4;i++)key(7,0);key(6,0);key(6,0);
const reset=read();assert.deepEqual(reset.owned,[0,0]);assert.equal(reset.dead,0);assert.equal(reset.cure,0);assert.equal(reset.spores,0);assert.equal(reset.result,0);assert.equal(reset.response,0);
assert(reset.cycles<20);snap('reset');
console.log(`PASS: native type ${diseaseType}, ${scenario}, result pause/reopen and New Game reset`);
