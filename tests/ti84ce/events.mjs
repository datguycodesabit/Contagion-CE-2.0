// Focused native event/UI/save fixture; all calculator memory access is read-only.
import fs from 'node:fs';
import path from 'node:path';
import {pathToFileURL} from 'node:url';
import assert from 'node:assert/strict';
const root=process.env.TI84CE_ROOT,rom=process.env.AUTOTESTER_ROM,libs=process.env.CE_LIBRARIES;
assert(root&&rom&&libs&&process.env.CONTAGION_PROGRAM&&process.env.CONTAGION_MAP);
const output=process.env.TI84CE_OUTPUT||'/tmp/contagion-events';fs.mkdirSync(output,{recursive:true});
const {initSync,WasmEmu}=await import(pathToFileURL(path.join(root,'web/src/emu-core/emu_core.js')));
initSync({module:fs.readFileSync(path.join(root,'web/src/emu-core/emu_core_bg.wasm'))});
const injector=new WasmEmu();injector.load_rom(fs.readFileSync(rom));
for(const file of ['libload','graphx','keypadc','fileioc'])injector.send_file(fs.readFileSync(path.join(libs,file+'.8xv')));
injector.send_file(fs.readFileSync(process.env.CONTAGION_PROGRAM));
globalThis.emul_is_inited=false;globalThis.emul_is_paused=true;
for(const f of ['initFuncs','initLCD','enableGUI','disableGUI'])globalThis[f]=()=>{};
const {default:WebCEmu}=await import(pathToFileURL(path.join(root,'web/src/cemu-core/WebCEmu.js')));
const m=await WebCEmu({noExitRuntime:true,print:()=>{},printErr:console.error});
m.FS.writeFile('/CE.rom',injector.save_state().slice(-4194304));m.FS.chdir('/');
const p=m._malloc(8);m.HEAPU8.set(new TextEncoder().encode('/CE.rom\0'),p);m._emu_init(p);m._free(p);
function run(n){for(let i=0;i<n;i++)m._emu_step(1);}
function key(r,c){m._emu_keypad_event(r,c,true);run(30);m._emu_keypad_event(r,c,false);run(180);}
run(240);key(6,6);key(4,6);key(5,1);key(6,0);run(2400);
const map=fs.readFileSync(process.env.CONTAGION_MAP,'utf8');
const addr=name=>parseInt(map.match(new RegExp('0x([0-9a-f]+) +_'+name+'\\s'))[1],16);
const heap=()=>Buffer.from(m.HEAPU8.buffer);let base;
for(let at=heap().indexOf('Pathogen');at>=0;at=heap().indexOf('Pathogen',at+1)){
 const d=at-37,candidate=d-(addr('disease')-0xD00000),check=candidate+addr('native_check')-0xD00000;
 const r=candidate+addr('region')-0xD00000;
 if(r<0||r+112>heap().length||check<0||check+2>heap().length)continue;
 let land=0;for(let i=0;i<7;i++)for(let k=0;k<3;k++)land+=heap().readUInt16LE(r+i*16+10+k*2);
 if(land===4410){base=candidate;if(heap().readUInt16LE(check)===1000)break;}
}
assert.notEqual(base,undefined,'Locate diagnostic RAM');
const at=name=>base+addr(name)-0xD00000;
const stage=()=>heap().readUInt16LE(at('native_check'));
function shot(name){
 run(3);const pixels=new Uint32Array(m.HEAPU8.buffer,m._lcd_get_frame(),320*240),rgba=Buffer.alloc(320*240*4);
 for(let i=0;i<pixels.length;i++){rgba[i*4]=pixels[i]>>>16;rgba[i*4+1]=pixels[i]>>>8;rgba[i*4+2]=pixels[i];rgba[i*4+3]=255;}
 fs.writeFileSync(path.join(output,name+'.rgba'),rgba);
}
for(let elapsed=0;stage()<1000&&elapsed<12000;elapsed+=300)run(300);
shot('native-checks');assert.equal(stage(),1000,'Native event, migration and save fixture must pass');
const snapshot=()=>Buffer.concat([Buffer.from(heap().subarray(at('world_events'),at('world_events')+50)),Buffer.from(heap().subarray(at('disease'),at('disease')+58))]);
key(6,0);shot('actions');const paused=snapshot();
for(let i=0;i<4;i++)key(7,0);key(6,0);shot('world-events');
key(6,0);shot('event-detail');run(300);assert.deepEqual(snapshot(),paused,'Events and disease pause in details');
key(6,6);key(7,0);key(6,0);shot('second-detail');key(6,6);key(6,6);
for(let i=0;i<3;i++)key(7,0);shot('scrolled-actions');
assert.deepEqual(snapshot(),paused,'Menus cannot consume event timers');
key(6,6);assert.equal(stage(),2000);shot('complete');
console.log('PASS: native event/save checks, World Events and details, paused timers, six-row Actions scrolling and return paths');
