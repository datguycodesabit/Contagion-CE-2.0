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
let e=new WasmEmu(); e.load_rom(fs.readFileSync(rom));
for(const f of ['libload','graphx','keypadc','fileioc']) e.send_file(fs.readFileSync(path.join(libs,`${f}.8xv`)));
e.send_file(fs.readFileSync(path.resolve(process.env.CONTAGION_PROGRAM || 'bin/CNTAGION.8xp')));
fs.writeFileSync(path.join(output,'preloaded.rom'),e.save_state().slice(-4194304));
if(process.env.TI84CE_BACKEND !== 'rust') {
 const {default:WebCEmu}=await import(pathToFileURL(path.join(root,'web/src/cemu-core/WebCEmu.js')));
 globalThis.emul_is_inited=false;globalThis.emul_is_paused=true;
 for(const f of ['initFuncs','initLCD','enableGUI','disableGUI'])globalThis[f]=()=>{};
 const m=await WebCEmu({noExitRuntime:true,print:console.log,printErr:console.error});
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
key(1,4);run(60);console.log('AFTER Y=',e.debug_status(),e.dump_state());
fs.writeFileSync(path.join(output,'menu.state'),e.save_state());
fs.writeFileSync(path.join(output,'menu.rgba'),e.get_framebuffer_rgba());
function snap(n){snapshots.set(n,createHash("sha256").update(e.get_framebuffer_rgba()).digest("hex"));if(process.env.TI84CE_BACKEND === 'rust')fs.writeFileSync(path.join(output,`${n}.state`),e.save_state());fs.writeFileSync(path.join(output,`${n}.rgba`),e.get_framebuffer_rgba());console.log(n,e.debug_status());}
const diseaseType=Number(process.env.DISEASE_TYPE || 0);
assert(Number.isInteger(diseaseType) && diseaseType>=0 && diseaseType<=2);
for(let i=0;i<diseaseType;i++) key(7,0);
key(6,0);key(1,2);key(6,0);run(180);snap('start');key(6,6);run(600);snap('only-save');
key(6,6);run(300);snap('quit-os');key(6,0);run(300);snap('continue-menu');key(1,2);run(180);snap('continued-map');key(6,6);run(300);snap('second-save');

console.log(JSON.stringify(Object.fromEntries(snapshots),null,2));

// Baseline inspected at 320x240: main menu explicitly says Continue / Results.
const continuedMenu='10588dc868b9d8395aacd7116e094f72525d45ad27d20e7d4a6856d2102189be';
for(const name of ['only-save','continue-menu','second-save']) {
 assert.equal(snapshots.get(name),continuedMenu,`${name}: expected valid saved-run menu`);
}
assert.notEqual(snapshots.get('start'),snapshots.get('continued-map'),'Simulation should advance after continuing');
console.log(`PASS: native disease ${diseaseType}, save, exit, relaunch, continue, second save`);
