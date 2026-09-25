// Short, isolated ticker rendering fixture. Emulator memory access is read-only.
import fs from 'node:fs';
import path from 'node:path';
import {pathToFileURL} from 'node:url';
import assert from 'node:assert/strict';
const root=process.env.TI84CE_ROOT,rom=process.env.AUTOTESTER_ROM,libs=process.env.CE_LIBRARIES;
assert(root&&rom&&libs&&process.env.CONTAGION_PROGRAM&&process.env.CONTAGION_MAP);
const output=process.env.TI84CE_OUTPUT||'/tmp/contagion-ticker';fs.mkdirSync(output,{recursive:true});
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
function key(r,c,release=180){m._emu_keypad_event(r,c,true);run(30);m._emu_keypad_event(r,c,false);run(release);}
run(240);key(6,6);key(4,6);key(5,1);key(6,0,180);
const map=fs.readFileSync(process.env.CONTAGION_MAP,'utf8');
const addr=name=>parseInt(map.match(new RegExp('0x([0-9a-f]+) +_'+name+'\\s'))[1],16);
const heap=()=>Buffer.from(m.HEAPU8.buffer);let base;
for(let at=heap().indexOf('Pathogen');at>=0;at=heap().indexOf('Pathogen',at+1)){
 const d=at-37;if(heap()[d+32]===2&&heap()[d+33]===1)base=d-(addr('disease')-0xD00000);
}
assert.notEqual(base,undefined);
const read=()=>Object.fromEntries(['kind','offset','width','elapsed'].map(n=>{
 const at=base+addr('ticker_test_'+n)-0xD00000;return [n,n==='elapsed'?heap().readUInt32LE(at):heap().readUInt16LE(at)];
}));
function shot(name){
 run(3); // Let the LCD catch up with the just-rendered draw buffer.
 const pixels=new Uint32Array(m.HEAPU8.buffer,m._lcd_get_frame(),320*240),rgba=Buffer.alloc(320*240*4);
 for(let i=0;i<pixels.length;i++){rgba[i*4]=pixels[i]>>>16;rgba[i*4+1]=pixels[i]>>>8;rgba[i*4+2]=pixels[i];rgba[i*4+3]=255;}
 fs.writeFileSync(path.join(output,name+'.rgba'),rgba);return rgba;
}
function until(predicate){for(let i=0;i<1800;i++){if(predicate(read()))return;run(1);}throw Error('Ticker timeout: '+JSON.stringify(read()));}
assert.equal(read().kind,0);const short=shot('short');
until(s=>s.kind!==0);assert.equal(read().kind,1,'Urgent research precedes waiting routine headline');shot('urgent');
until(s=>s.kind!==1);assert(read().width>312);const long=shot('long-start');
until(s=>s.offset>=24);shot('long-scroll');
for(let y=0;y<240;y++)for(let x=0;x<320;x++)if(y<20||y>=29||x<4||x>=316){
 const at=(y*320+x)*4;assert(short.subarray(at,at+4).equals(long.subarray(at,at+4)),'Ticker preserves other pixels');
}
key(6,0,10);const paused=read();shot('paused');run(300);assert.deepEqual(read(),paused);
key(6,6,1);assert.equal(read().kind,paused.kind);
assert(read().elapsed-paused.elapsed<16384,'Modal time discarded on resume');shot('resumed');
until(s=>s.offset===s.width-312);console.log('END HOLD',read());shot('long-end');console.log('CAPTURE',read());
until(s=>s.kind===255);
console.log('PASS: short headline, urgent ordering, longest headline scrolling/clipping, actual Actions pause/resume, final hold');
