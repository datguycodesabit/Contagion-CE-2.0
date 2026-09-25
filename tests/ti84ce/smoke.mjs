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
let refModule;let e=new WasmEmu(); e.load_rom(fs.readFileSync(rom));
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
function save(){key(6,6);for(let i=0;i<(diseaseType===2?5:4);i++)key(7,0);key(6,0);}
save();run(600);snap('only-save');
const map=fs.readFileSync(process.env.CONTAGION_MAP || 'bin/CNTAGION.map','utf8');
const address=n=>parseInt(map.match(new RegExp('0x([0-9a-f]+) +_'+n+'\\s'))[1],16);
function savedState(){
 const b=Buffer.from(refModule.HEAPU8.buffer),daddr=address('disease'),raddr=address('region');
 for(let at=b.indexOf('Pathogen');at>=0;at=b.indexOf('Pathogen',at+1)){
  const d=at-37,base=d-(daddr-0xD00000),r=base+raddr-0xD00000;
  if(r<0||r+112>b.length||b[d+33]!==1)continue;
  let land=0;for(let i=0;i<7;i++)for(let k=0;k<3;k++)land+=b.readUInt16LE(r+i*16+10+k*2);
  if(land===4410){assert.equal(b[d+32],diseaseType);return Buffer.from(b.subarray(d,d+58));}
 }
 throw Error('No started disease in calculator RAM');
}
const saved=savedState();
key(6,6);key(6,0);run(300);snap('quit-os');key(6,0);run(300);key(7,0);snap('continue-menu');
assert.deepEqual(savedState(),saved,'Disease fields survive relaunch exactly');
key(6,0);run(180);snap('continued-map');save();run(300);snap('second-save');

console.log(JSON.stringify(Object.fromEntries(snapshots),null,2));

// The same Continue selection must survive save/quit/relaunch/save.
for(const name of ['continue-menu','second-save']) {
 assert.equal(snapshots.get(name),snapshots.get('only-save'),`${name}: saved-run menu`);
}
assert.notEqual(snapshots.get('start'),snapshots.get('continued-map'),'Simulation should advance after continuing');
console.log(`PASS: native disease ${diseaseType}, save, exit, relaunch, continue, second save`);
