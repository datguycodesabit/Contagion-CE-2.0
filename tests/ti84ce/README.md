# Native program smoke test through ti84ce

This runs the real eZ80 `.8xp` in an emulator; it does not replace calculator APIs
with host stubs. No firmware, libraries, or emulator binaries belong in this repo.

Verified baseline: ti84ce commit `eb90c33cfaebd19fbd0fea9c06a359e3efaf54c2`,
its bundled CEmu reference WASM core, TI-OS 5.3.0.0037 / boot 5.1.5.0014,
CE runtime libraries v15.0, Node 24.20.0. The baseline ROM's program menu places
CNTAGION third. Other ROM contents need an explicitly verified launch sequence.

```sh
TI84CE_ROOT=/path/to/ti84ce \
AUTOTESTER_ROM=/path/to/local.rom \
CE_LIBRARIES=/path/to/clibs \
DISEASE_TYPE=0 \
node tests/ti84ce/smoke.mjs
```

Repeat with `DISEASE_TYPE=1` and `2`. Optional `TI84CE_OUTPUT` selects an output
folder (default `/tmp/contagion-smoke`); `CONTAGION_PROGRAM` selects the artifact.
Outputs include local firmware/state copies: never commit them. RGBA frames are
320x240, four bytes per pixel. The smoke sequence compares the Continue selection
after saving, relaunching, and saving again, plus changed gameplay frames. It also
reads calculator RAM to check the chosen disease type and exact disease restore.
These assertions prove smoke coverage, not a full winning playthrough or every
saved field. Pure codec semantics remain covered by `make test-host`.

The default core is **CEmu**, embedded within ti84ce; this does not require the
CEmu desktop GUI. `TI84CE_BACKEND=rust` selects the independent core for diagnosis,
but it is not a passing baseline: repeated inputs still get lost in this sequence.

`keypad-mirrors.patch` fixes one confirmed Rust-core problem: mirrored keypad MMIO
addresses F50200/F51200 used by keypadc were ignored or treated as fallback RAM.
Apply to the stated ti84ce checkout, build the Rust WASM core with the matching
wasm-bindgen CLI, and rerun its `test_keypadc_mmio_mirrors` unit test. The test passes.
The entire upstream suite has 179 failures both before and after this patch
(314/315 passes respectively, seven ignored). Do not claim the Rust emulator is
fully repaired based on the targeted test.

Game fixes verified here: reuse the completed keypad scan for release detection;
replace FileIOC rename during GraphX with bounded validated save copies. The
rename crash reproduced in both cores. Physical calculator checks, archive/GC and
out-of-storage failure injection, full UI coverage and long playthroughs remain
release gates. See `tests/cemu/smoke-test.md`.

## Full native runs and save/UI diagnostics (September 21)

`playthrough.mjs` uses the same boot/injection setup and the matching
`bin/CNTAGION.map`. Its packed eZ80 state reader is read-only. A bounded strategy
buys through actual menus, waits for natural progression, checks population
conservation, and requires victory, paused/reopenable results, and clean New Game.
Run with `DISEASE_TYPE=0`, `1`, and `2`; `SCENARIO=cure` deliberately buys no lethal
symptoms and requires a natural cure defeat. There is no claim that early lethal
purchases reliably produce extinction: that attempted policy ended in cure defeat.
Extinction and simultaneous victory/cure precedence use explicit native fixtures.

```sh
# Same TI84CE_ROOT, AUTOTESTER_ROM and CE_LIBRARIES as the smoke test.
DISEASE_TYPE=0 TI84CE_OUTPUT=/tmp/contagion-bacteria node tests/ti84ce/playthrough.mjs
DISEASE_TYPE=1 TI84CE_OUTPUT=/tmp/contagion-virus node tests/ti84ce/playthrough.mjs
DISEASE_TYPE=2 TI84CE_OUTPUT=/tmp/contagion-fungus node tests/ti84ce/playthrough.mjs
SCENARIO=cure TI84CE_OUTPUT=/tmp/contagion-cure node tests/ti84ce/playthrough.mjs
```

The separate development diagnostic includes the production C engine, UI,
codec and persistence adapter and runs against **actual FileIOC/TI-OS**. It is
not a host calculator stub. It creates/replaces CNTGN2* and CNTEST* AppVars, so
run only in an isolated emulator. It never belongs in the transfer package.

```sh
# CEDEV and PATH must point to the native toolchain.
sh tests/native/build.sh
export CONTAGION_PROGRAM=tests/cemu/artifacts/native-bin/CNTAGION.8xp
export CONTAGION_MAP=tests/cemu/artifacts/native-bin/CNTAGION.map
SAVE_ONLY=1 TI84CE_OUTPUT=/tmp/contagion-native-bootstrap node tests/ti84ce/native-save.mjs
ARCHIVE_FIXTURE=/tmp/contagion-native-bootstrap/archive-fixture.8xv \
 TI84CE_OUTPUT=/tmp/contagion-native-release node tests/ti84ce/native-save.mjs
# Unset the diagnostic override before testing/packaging the actual game.
unset CONTAGION_PROGRAM CONTAGION_MAP
```

The first pass exports a checksum-valid production save as a local AppVar fixture;
the second injects it archived, then verifies archived load/replacement. Direct
TI-OS archiving in the injected ROM returned `ERR:ARCHIVE FULL` (largest variable
226 bytes), even outside GraphX; archive allocation/GC is not a passing baseline.
The game itself does not perform archive operations.

The diagnostic checks exact disease/session restoration, partial cycle, invalid
and missing primary, backup fallback, both-invalid reset, insufficient RAM, and
a truncated-primary interruption fixture. It then displays all three result
screens and checks victory precedence. Its explicitly funded UI fixture purchases
all 39 nodes, checks long-held Enter and duplicate purchases, all three spores,
cancel/exhaustion, blocked prerequisite devolution, and seven-DNA Virus leaf
removal. Fixtures are not natural playthroughs. Screens are captured for inspection;
no uninspected framebuffer hashes are asserted.

`tests/cemu/smoke-test.md` remains the comprehensive **physical acceptance** list.
Hardware timing, OS 5.7 launch, actual interrupted power, full archive/GC, and
exhaustive manual navigation/name entry still require calculator verification.

## Focused ticker check (September 24)

For ticker changes, run `sh tests/host/run.sh test_ticker`, then the short native
fixture below with the existing toolchain/ROM/library environment. This uses the
production ticker, GraphX rendering and Actions menu. It queues synthetic news,
not a natural playthrough; it is never packaged. The harness reads emulator RAM,
checks priority order, clipping, scrolling, final hold and pause/resume timing,
and writes 320x240 RGBA captures for visual inspection.

```sh
sh tests/ticker-native/build.sh
CONTAGION_PROGRAM=tests/cemu/artifacts/ticker-bin/CNTAGION.8xp \
CONTAGION_MAP=tests/cemu/artifacts/ticker-bin/CNTAGION.map \
TI84CE_OUTPUT=/tmp/contagion-ticker node tests/ti84ce/ticker.mjs
```

The ticker queue and display position are transient. Loading initializes milestone
snapshots from the restored disease instead of replaying old milestone headlines.

## Menu controls (September 24)

All scripts now use arrows, Enter and Clear through Actions and the category menu.
The native diagnostic also exercises Region Details, travel toggle, insufficient
spore DNA, exhausted destination land, and failed-save retry/cancel/explicit quit.
The harness only reads emulator state; funded/failure fixtures are explicitly
constructed in the separate native diagnostic, never in the shipping game.
