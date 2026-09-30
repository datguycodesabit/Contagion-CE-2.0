# CONTAGION CE 2.0 verification report

## September 29, 2026: preservation-focused cleanup (current candidate)

The working tree was clean before the baseline build; no applicable `AGENTS.md`
was found. Baseline host suites and native build passed. No pre-existing game
failure was reproduced. The SDK selection below is required on this host;
legacy OPTIX warnings and SDK executable-stack linker notices remain unchanged.

Production changes are limited to event eligibility and shared v2/v3 map codec
helpers. No catalog, balance, controls, disease rules, save schema, or FileIOC
replacement policy changed. Event eligibility avoids zero-threshold divisions
and stops at the first meaningful effect. Both formats share the same map
geometry/pixel/checksum/outcome checks while keeping their own state records.

Commands used (repository root):

```sh
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk make test-host
PATH=/tmp/contagion-cedev-mount/CEdev/bin:$PATH CEDEV=/tmp/contagion-cedev-mount/CEdev make -B OUTPUT_MAP=YES
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk sh tests/host/run.sh test_events
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk sh tests/host/run.sh test_rules
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk sh tests/host/run.sh test_event_saves
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk sh tests/host/run.sh event_balance 2
CE_LIBRARIES=bin/CONTAGION-CE-2.0 python3 tests/package/build.py
shasum -a 256 bin/CNTAGION.8xp bin/CONTAGION-CE-2.0.zip
```

PASS: the complete final `make test-host` suite, including generator freshness,
rules, ticker, event engine, and v2/v3 saves, ran with ASan/UBSan. New checks
verify the pre-refactor serialization fingerprints and reject malformed v3
geometry, pixels, checksums, and sizes without changing any live map bytes,
counts, ports, disease, session, or event outputs. The live map deliberately
differs from the saved image so unintended partial application is observable.
Final production and native event/save fixture builds both passed.

Targeted native execution is **blocked for this cleanup**. The existing driver
fails with `ERR_MODULE_NOT_FOUND` for the deleted ti84ce `emu_core.js` injector
(and its WASM companion). The retained `/tmp/contagion-browser/WebCEmu.js`, WASM,
and preloaded OS 5.3 `game.rom` remain, but a direct transfer probe did not
establish a usable injection path. That unsupported-call failure is not evidence
of a game defect. No final-build emulator assertions or screenshot inspection
are claimed. Restoring the injector or a verified reference-core transfer
adapter is required to run the final fixture; older results below are historical.

```sh
PATH=/tmp/contagion-cedev-mount/CEdev/bin:$PATH CEDEV=/tmp/contagion-cedev-mount/CEdev sh tests/event-native/build.sh
# Attempted; blocked before emulation by the missing injector module:
TI84CE_ROOT=/tmp/ti84ce-eb90c33cfaebd19fbd0fea9c06a359e3efaf54c2 AUTOTESTER_ROM=/tmp/contagion-browser/game.rom CE_LIBRARIES=bin/CONTAGION-CE-2.0 CONTAGION_PROGRAM=tests/cemu/artifacts/event-bin/CNTAGION.8xp CONTAGION_MAP=tests/cemu/artifacts/event-bin/CNTAGION.map TI84CE_OUTPUT=/tmp/contagion-cleanup-baseline-events node tests/ti84ce/events.mjs
```

The two-seed, three-disease, events-on/off diagnostic produced identical complete
output before and after the eligibility cleanup (12 runs). These are automated
production-rule simulations, not natural keypad playthroughs or speed measurements.
Baseline compatibility fingerprints were captured from the unedited codec:
v2 `5c23ace8`; v3 low/high severity branch fixtures `6c26689a` / `0394eba8`;
v3 empty-event fixture `f01d8fc0` (FNV-1a over bytes before the checksum).

| Measurement | Baseline | Final | Change |
|---|---:|---:|---:|
| Calculator binary | 47,960 | 46,976 | -984 bytes |
| Linker text | 55,133 | 53,082 | -2,051 bytes |
| Read-only data | 34,268 | 34,268 | 0 |
| Initialized data | 10,843 | 10,843 | 0 |
| BSS | 587 | 587 | 0 |
| v2 / v3 save length | 10,923 / 10,973 | 10,923 / 10,973 | 0 |

The streaming pixel buffer remains 32 bytes. Assembly local-frame allocations
for v2 changed from 234 to 91 + 136 bytes (caller + shared helper); v3 changed
from 287 to 153 + 136. Those figures exclude call arguments, saved registers,
and deeper callees: they are not stack high-water measurements. The extra call
is a small stack tradeoff for removing duplicated code, not a stack optimization.

The refreshed ZIP is 61,163 bytes, contains seven payload files plus its checksum
manifest, and matches the directly transferable folder and final binary.
Final SHA-256:

```text
67a52f116c0c5018cb1a97f53f246c3037bbdb5606e2e422afcdb588e7dcbfa7  CNTAGION.8xp
7f196b4310aead78a9c29b5efce69b6cc7b1f65d79529ad16c152e39703a4728  CONTAGION-CE-2.0.zip
```

Three GPT-6 Luna agents at max reasoning reviewed events, saves/UI, and tests.
Root owns production integration and final acceptance. Two-pass loading,
recoverable FileIOC replacement, cycle-boundary cache refresh, and historical
OPTIX code were retained deliberately; a broader rewrite has no demonstrated
benefit for this cleanup. No commits, pushes, or firmware downloads were made.
Physical TI-84 Plus CE OS 5.7 verification, real power loss/archive GC, stack
high-water, and on-device performance remain unverified.

## September 24, 2026: lightweight news ticker (historical checkpoint)

`bin/CNTAGION.8xp`: **29,685 bytes**, SHA-256
`b3033ba328cf75d71d3b2bf05a5969f51c0558b5122cac852ddb592d12831c5f`.
`bin/CONTAGION-CE-2.0.zip`: **43,817 bytes**, SHA-256
`c162b5e694dbc41ddd48a4b264aca76d2df79a5cad5633099c1d10b8d53cd22a`.

Ticker-only validation was deliberately scoped to this change:

```sh
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk sh tests/host/run.sh test_ticker
export CEDEV=/tmp/contagion-cedev-mount/CEdev
export PATH="$CEDEV/bin:$PATH"
make OUTPUT_MAP=YES
sh tests/ticker-native/build.sh
TI84CE_ROOT=/tmp/ti84ce-eb90c33cfaebd19fbd0fea9c06a359e3efaf54c2 \
AUTOTESTER_ROM=/tmp/contagion-ti84ce.rom CE_LIBRARIES=bin/CONTAGION-CE-2.0 \
CONTAGION_PROGRAM=tests/cemu/artifacts/ticker-bin/CNTAGION.8xp \
CONTAGION_MAP=tests/cemu/artifacts/ticker-bin/CNTAGION.map \
TI84CE_OUTPUT=/tmp/contagion-ticker node tests/ti84ce/ticker.mjs
CE_LIBRARIES=bin/CONTAGION-CE-2.0 python3 tests/package/build.py
shasum -a 256 bin/CNTAGION.8xp bin/CONTAGION-CE-2.0.zip
```

PASS: sanitizer-enabled host checks for priorities/overflow, duplicate suppression,
cure coalescing, stationary and scrolling timing, bounded formatting, milestone
aggregation, quiet report rotation, and reset/load snapshots. PASS: native fixture
checks for urgent ordering, short and longest supported headlines, clipping outside
the strip, final hold, and pause/resume through the actual Actions menu. Captures
were visually inspected at 320x240. The widest tested headline was 337 pixels;
its final offset was 25 pixels. The fixture needed normal boot settling, the same
text transparency initialization as the game, and LCD settling before captures.
Those corrections affected the diagnostic only. This is a synthetic UI fixture,
not a natural playthrough; full disease runs were not repeated for a ticker change.

Native build passed with the existing toolchain/OPTIX warnings. Program growth:
1,862 bytes. Ticker storage: 134 bytes versus the former 387-byte queue/counters.
Linker initialized data remains 10,843 bytes; total BSS is now 487 bytes. No heap
allocation, map scans, simulation randomness, balance, or save-format changes.
Package readback verifies the native binary and included files; the extracted
transfer folder is refreshed from the same ZIP. No diagnostic or firmware is shipped.

Coverage remains CEmu reference core / OS 5.3.0.0037. Physical OS 5.7 verification
is outstanding. Evidence below describes previous builds.

## September 24, 2026: visible actions and spore bursts

Current candidate: `bin/CNTAGION.8xp`, **27,823 bytes**, SHA-256
`b5bfba00894f80ca286261fa66cb31e72a98dcf614678b93a2cb3ffe7418d756`.
Transfer ZIP: **41,865 bytes**, SHA-256
`b60baed6c26f9bbfbaca32ae00c6179c5f15d3c7d6a82cb5d9005a3532c4273a`.
The ZIP and extracted transfer folder contain the exact tested game binary.
Disease rules and the version-2 save codec are unchanged.

Validation used CE Toolchain v15 (macOS arm64) and ti84ce commit
`eb90c33cfaebd19fbd0fea9c06a359e3efaf54c2`, executing its CEmu reference core
with TI-OS 5.3.0.0037. Firmware and screenshots remain outside the transfer ZIP.

Commands (from repository root, with the toolchain `bin` on PATH):

```sh
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk make test-host
CEDEV=/tmp/contagion-cedev-mount/CEdev make OUTPUT_MAP=YES
export TI84CE_ROOT=/tmp/ti84ce-eb90c33cfaebd19fbd0fea9c06a359e3efaf54c2
export AUTOTESTER_ROM=/tmp/contagion-ti84ce.rom
export CE_LIBRARIES=bin/CONTAGION-CE-2.0
for disease in 0 1 2; do
  DISEASE_TYPE=$disease TI84CE_OUTPUT=/tmp/contagion-menu-verified$disease \
    node tests/ti84ce/smoke.mjs
done
DISEASE_TYPE=2 TI84CE_OUTPUT=/tmp/contagion-menu-play2 \
  node tests/ti84ce/playthrough.mjs
sh tests/native/build.sh
CONTAGION_PROGRAM=tests/cemu/artifacts/native-bin/CNTAGION.8xp \
CONTAGION_MAP=tests/cemu/artifacts/native-bin/CNTAGION.map \
ARCHIVE_FIXTURE=/tmp/contagion-menu-native/archive-fixture.8xv \
TI84CE_OUTPUT=/tmp/contagion-menu-verified-native node tests/ti84ce/native-save.mjs
python3 tests/package/build.py
shasum -a 256 bin/CNTAGION.8xp bin/CONTAGION-CE-2.0.zip
```

All six host groups passed: 4,410 land cells, 10,923-byte saves. Native build
passed; existing toolchain GNU-stack linker warnings remain. An initial build
with an absolute OBJDIR failed because the toolchain prefixes that path with
the repository path; the normal build above succeeded. Linker initialized data
is 10,843 bytes, BSS 741 bytes; these are static totals, not measured peak RAM.
Menus use bounded local arrays, with no new full-map or save-sized stack buffer.

All three disease starts/save/quit/relaunch/continue sequences passed. The tests
read calculator RAM to assert the requested type and exact disease restoration.
The full Fungus run won at 421 cycles with 13 purchases, one spore burst, 4,410
dead cells and 76.44% cure; result pause/reopen and clean New Game also passed.
The separate native UI fixture passed all 39 purchases, held Enter, duplicate
purchases, three bursts, cancellation/exhausted charges, prerequisite devolution
rejection, Virus leaf devolution, and all three outcome screens. These funded
and outcome fixtures are not natural playthroughs. Actions, Region Details and
trait screens were visually inspected at 320x240.

The final expanded diagnostic also passed archived save replacement, paused
Region Details/travel toggle, insufficient-DNA and no-healthy-land spore rejection,
save failure retry, default-safe confirmation, Clear cancellation, and explicit
Quit Without Saving. Spore rejection screens were visually inspected. During
test development the artificial no-land fixture was unsuitable for save encoding;
the save-failure stage now starts a separate valid seeded run. A 60-frame modal
delay also proved too short for save preparation; the storage checks now allow
600 frames. Both were diagnostic corrections, not production gameplay changes.
The complete corrected sequence reached native stage 2000 successfully.

Package readback and SHA-256 manifest verification passed. OS 5.7.0.0021 and
physical calculator execution remain unverified; use the short acceptance check
in `TRANSFER.md`. Older evidence below applies to earlier builds unless noted.

Implementation verification: September 15–16, 2026. This is an uncommitted working
copy; no commit, push, or hardware/emulator gameplay verification is claimed.
All six implementation checkpoints are present. Physical calculator verification
remains the final release gate.

## Native build and artifact

Built with the official **CE Toolchain v15.0, macOS arm64**, obtained from its
[release](https://github.com/CE-Programming/toolchain/releases/tag/v15.0). No firmware
was downloaded. The toolchain image was mounted read-only for this session at
`/tmp/contagion-cedev-mount/CEdev`. That temporary location is not an installed
system dependency; use your own installed CEDEV path for subsequent builds.

```sh
export CEDEV=/tmp/contagion-cedev-mount/CEdev
export PATH="$CEDEV/bin:$PATH"
make OUTPUT_MAP=YES
```

Artifact: **`bin/CNTAGION.8xp`**, native eZ80, ZX7 compressed, **26,107 bytes**.

SHA-256:

```text
55b484f2146c9e807f205dda4f80fae519fa6d0b74ae2b780ff8e555ec142777
```

New gameplay sources compile without warnings under `-Oz -Wall -Wextra`.
The retained, now-unused OPTIX source produces eight legacy warnings on a full
build; its source was not cosmetically rewritten. The toolchain linker also
warns about missing `.note.GNU-stack` metadata in its assembly objects. The
build completes successfully. These warnings are not claims of runtime testing.

The stabilized starting worktree was captured in `/tmp/contagion-baseline` before
edits. Its sources were built with the same v15 toolchain; only that temporary
copy's legacy Makefile include was adapted to v15's location. This preserves the
actual uncommitted stabilization baseline instead of comparing against Git HEAD.

## Resource comparison

Values below come from each native artifact and its linker map, not host `sizeof`.

| Measurement | Stabilized baseline | Overhaul | Change |
|---|---:|---:|---:|
| Compressed `.8xp` | 16,967 B | 26,107 B | +9,140 B |
| `.text` | 24,340 B | 35,964 B | +11,624 B |
| `.rodata` | 1,425 B | 6,200 B | +4,775 B |
| `.data` | 10,846 B | 10,843 B | −3 B |
| `.bss` | 576 B | 741 B | +165 B |
| Configured heap address gap | 60,114 B | 59,949 B | −165 B |
| Encoded save payload | 10,858 B | 10,923 B | +65 B |

Writable static `.data + .bss` grows by 162 bytes. Code and constants also occupy
calculator program memory when loaded; the BSS delta alone is **not** the total
RAM cost. The linker heap gap is not a measurement of free OS RAM, stack high-water
usage, or space available to AppVars. The original seven sprites remain unchanged;
no second full-world buffer exists. A save replacement can temporarily require
three 10,923-byte AppVars plus OS metadata.

The codec's pixel scratch buffer is 32 bytes. Its candidate disease/session structs
are 58/9 native bytes, respectively. UI previews use small stack-local copies and
80-byte text buffers. Maximum nested stack/printf usage has not been measured on
a calculator. Simulation/rendering have no explicit allocations. Host CPU timings
were not used as calculator performance measurements; no frame-rate or latency
improvement is claimed.

## Host checks actually run

The local default SDK resolves to macOS 27, whose `.tbd` files were rejected by
the installed linker (`unknown architecture arm64e.x1-macos`). Selecting the
already installed macOS 26.5 SDK resolves that host-build mismatch:

```sh
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk make test-host
```

On a normally configured host, `make test-host` requires only Clang and its
AddressSanitizer/UndefinedBehaviorSanitizer runtimes, not CE Toolchain or a ROM.
The test runner compiles with C99, `-Wall -Wextra -Werror -pedantic`, ASan and UBSan,
and cleans its temporary executable. All six test groups pass:

- All 39 trait purchases, exact/insufficient DNA, each prerequisite, duplicate
  ownership, combination prerequisites, leaf devolution, and one-time reshuffles.
- Probability bounds, zero lethality, maximum ownership, monotonic spread/resistance,
  exact counts for behind-cursor spread, edge/ocean infection safety, and seven-region cadence.
- One-time economy, silent and forced discovery, research delay, maximum hardening
  progress, all outcomes including victory precedence, and Virus mutation eligibility.
- Actual sprite/port validation, compatible/closed/unavailable routes, dead-only
  sources, exact/insufficient spore costs, charge limits, no-healthy destinations,
  migration cadence/closure bypass, and permanent restrictions.
- All-disease save round trips, every byte individually corrupted, truncated lengths,
  checksum-repaired invalid semantic fields, short reads, early/discovered/research/
  completed states, reward persistence, and reset defaults.
- Reachability of every evolution node, all four navigation edges per node, category
  containment, and fixed node coordinate bounds.

These compile the actual production rules, codec, world transitions, and original
sprites. There is no fake GraphX/keypadc/FileIOC runtime or desktop game. Pure tests
cannot verify pixels rendered on the calculator screen, actual key timing, or
FileIOC/OS storage semantics.

## Headless balance diagnostics actually run

```sh
# Use the same SDKROOT assignment as above on this host.
sh tests/host/run.sh balance 10
sh tests/host/run.sh balance 3 4410
sh tests/host/run.sh balance 3 0 1
sh tests/host/run.sh balance 3 0 2
```

Arguments are seeds per disease, healthy-cell threshold at which to buy lethal
symptoms, and opening policy 0/1/2. Each trial uses production simulation logic
and map data with a deterministic host RNG and scripted decisions.

- Default delayed-lethality policy: 30/30 wins, spanning all three disease types.
  Bacteria 335–417 cycles / 13–14 paid nodes; Virus 314–375 / 11–13 paid nodes plus
  spontaneous mutations; Fungus 389–489 / 13–14 paid nodes.
- Premature-lethality policy: 9/9 active-extinction defeats, with healthy survivors.
- Livestock/Insects-first opening: 9/9 wins across the three types.
- Rodents/Blood-first opening: 9/9 wins across the three types.

This demonstrates plausible winning paths, multiple openings, and a real cost to
premature lethality. It does **not** establish typical human difficulty, the
15–25-minute duration target, universal seed success, or 12–20 purchases for every
player. Mutation can reduce paid purchases. No successful human playthrough is
claimed.

## Emulator and hardware blocker

`make test-cemu OUTPUT_MAP=YES` rebuilt the native program and then stopped with:

```text
CEmu was not found. Set CEMU to the executable path; see tests/cemu/README.md.
make: *** [test-cemu] Error 1
```

The bundled headless `cemu-autotester` exists. No GUI CEmu executable was found on
PATH or in the checked application locations. `AUTOTESTER_ROM` is unset. Existing
CEmu preferences refer to
`/Users/carmelodalio/Library/Preferences/cemu-dev/CEmu/cemu_image.ce`, which is absent.
No configured, legally supplied ROM is available for these checks. There are no
invented framebuffer CRCs or zero-assertion emulator test files.

Remaining runtime work is explicitly listed in `tests/cemu/smoke-test.md`:
actual 320×240 rendering/text, held-key/debouncing behavior, all disease playthroughs,
all menu paths, prolonged timing/memory behavior, FileIOC failure/replacement and
archived AppVars, then the same artifact on physical supported hardware.

## Requirement audit

| Checkpoint | Implementation evidence | Verification boundary |
|---|---|---|
| State/economy/outcomes | `disease.c`, `world.c`, `main.c`, result screen | Pure counts, rewards, precedence and cycle tests pass; result rendering remains runtime |
| Regional attributes/transport | Static ratings, cached effects, 22 validated endpoints, neighbor masks | Actual sprite geometry and route/spore/migration rules tested |
| Traits/discovery/cure | 39 stable definitions, ownership words, devolution, response/research | All traits and core arithmetic cases tested; player readability remains runtime |
| Disease types | Type selection, Virus mutation, Fungus spore UI/actions | Shared action rules and sampled winning paths tested; real controls remain runtime |
| Evolution/persistence/reset | Fixed UI positions/neighbors; streaming v2 codec and FileIOC adapter | Navigation graph and codec tested; device save adapter and UI remain runtime |
| Build/tests/docs | Native artifact, host suite, diagnostics, CEmu checklist, balance/save/audit docs | Native build and static memory measured; emulator/hardware/performance gates pending |

No core requested feature is a placeholder. Unverified runtime gates are reported
under the request's explicit allowance for an unavailable emulator/ROM; they must
be completed before treating this as a calculator-tested release.

## Runtime bug-fix follow-up (September 19, 2026)

This supersedes the earlier claim that no ROM/emulator runtime was available.
The user explicitly authorized loading ti84ce's bundled ROM after the initial
no-firmware instruction. Firmware remains outside this repository.

Fixed `main.c` to inspect completed keypad scans instead of calling `kb_AnyKey`
after `kb_Scan`. Found and patched ti84ce's keypad mirror decoding separately;
the patch is preserved under `tests/ti84ce`, not incorporated into the game.
The independent Rust core still loses inputs and is not a supported test baseline.

Fixed the reproducible save crash in `persistence.c`: FileIOC v15 `ti_Rename`
archives its source. Both Rust and CEmu reference cores failed during that step.
The replacement uses a 32-byte handle-based copy, validates the backup before
replacing the primary, and validates the primary before removing the temporary.
Saving, returning to TI-OS (Done), relaunching, continuing the map, and a second
save were observed working in the reference core after this change.

Native build command:
`PATH=/tmp/contagion-cedev-mount/CEdev/bin:$PATH CEDEV=/tmp/contagion-cedev-mount/CEdev make OUTPUT_MAP=YES`
passed. Current artifact: 26,258 bytes; SHA-256
`433c423939eee2d9ec5587a7f42c6e104eff30a2e13fa757ce88c38d9f92c8fb`.
Linker sections: text 36,232, rodata 6,200, data 10,843, BSS 741 bytes.
The copy adds a 32-byte stack buffer; no whole-map stack buffer was introduced.

Runtime command (repeat DISEASE_TYPE 0/1/2):
`TI84CE_ROOT=/tmp/contagion-ti84ce AUTOTESTER_ROM=/tmp/contagion-ti84ce.rom CE_LIBRARIES=/tmp/contagion-clibs/clibs DISEASE_TYPE=0 node tests/ti84ce/smoke.mjs`
uses ti84ce's CEmu reference WASM and the real native binary. The Continue screen
baseline was visually inspected before adding a SHA-256 assertion. Tests cover
start, save, exit, relaunch, continue and repeat save for each selected type.
Interactive reference-core checks confirmed New Game, naming, seeding, evolution
category navigation, Cough purchase (17 -> 12 DNA), and devolution (12 -> 8 DNA).

Host command:
`SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk make test-host`
passes all production rules and codec test groups. None of these results establish
physical-device behavior, complete emulator playthroughs, 15–25 minute human runs,
or all failure-injection paths. The original physical release gate remains open.

## Calculator transfer candidate — September 21, 2026

Target supplied by the user: **TI-84 Plus CE, OS 5.7.0.0021, arTIfiCE installed**.
No OS update, commits, pushes, or unrelated-work cleanup was performed. This
pass added native verification and packaging; no additional production gameplay
fix was needed after the earlier input/save corrections.

Commands and actual results:

- `SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk make test-host`:
  PASS, all six production rules/codec/navigation groups with ASan/UBSan.
- `PATH=/tmp/contagion-cedev-mount/CEdev/bin:$PATH CEDEV=/tmp/contagion-cedev-mount/CEdev make -B OUTPUT_MAP=YES`:
  PASS; 26,258 bytes. Existing toolchain assembly objects emit GNU-stack warnings.
- Final `.8xp` SHA-256:
  `b8f49ce8344b482c8fba426a569434404dad62aea11ee59134b5c55cf0d1fe88`.
  The file header's build timestamp changed. Its complete 26,184-byte native
  variable payload matches the previously tested ROM byte-for-byte (offset
  1,968,739 in `/tmp/contagion-preloaded.rom`). Code/static totals are unchanged:
  text 36,232; rodata 6,200; data 10,843; BSS 741 bytes. No new runtime buffers.
- Final artifact `smoke.mjs`: PASS for disease types 0/1/2, each with start,
  save, exit, relaunch, continue and second save.
- `playthrough.mjs`: natural native victories for Bacteria at cycle 370
  (13 purchases, cure 66.48%), Virus at 342 (11 purchases plus mutations,
  cure 68.73%), and Fungus at 440 (13 purchases, one spore, cure 78.92%).
  Every run ended with 4,410 dead / zero healthy / zero active cells. Paused
  results, result reopening and New Game reset passed for all three.
- `SCENARIO=cure ... playthrough.mjs`: natural cure defeat at cycle 713,
  zero deaths, nine purchases; pause/reopen/reset passed. An experimental
  early-lethality policy also lost to cure, so it is **not** evidence of natural
  extinction defeat and was removed from the supported test scenarios.
- `sh tests/native/build.sh` and `native-save.mjs`: native diagnostic, separate
  from the shipped game, uses real FileIOC. PASS for exact disease/session
  roundtrip including partial-cycle position, corrupt/missing primary recovery,
  both-invalid reset, insufficient RAM preserving the previous save, a truncated
  primary representing interrupted replacement, and archived primary load/copy.
- Explicit native outcome/UI fixtures: all result screens including extinction,
  victory precedence at 100% cure, all 39 trait purchases, held Enter, duplicate
  purchases, three spore prices, cancellation/exhaustion, blocked prerequisite
  devolution, and Virus leaf removal passed. These are funded/constructed tests,
  not natural playthrough evidence. Result/detail/spore screens were inspected.

Reproduction environment for emulator commands:

```sh
export TI84CE_ROOT=/tmp/ti84ce-eb90c33cfaebd19fbd0fea9c06a359e3efaf54c2
export AUTOTESTER_ROM=/tmp/contagion-preloaded.rom
export CE_LIBRARIES=/tmp/contagion-clibs/clibs
# smoke.mjs: DISEASE_TYPE=0/1/2, separate TI84CE_OUTPUT per process
# playthrough.mjs: same types, plus SCENARIO=cure for the nonlethal policy
# Native diagnostic commands are fully documented in tests/ti84ce/README.md.
CE_LIBRARIES=/tmp/contagion-clibs/clibs python3 tests/package/build.py
```

Runtime is the pinned ti84ce **CEmu reference** WASM core with TI-OS 5.3.0.0037,
boot 5.1.5.0014 and CE libraries v15.0. The Rust core is used only for its existing
file injector, never to execute the game. No further Rust-core repair was done.
The injected ROM cannot currently allocate an archive variable above 226 bytes;
TI-OS returns `ERR:ARCHIVE FULL`. Archived-load testing therefore reinjects an
actual production-encoded save as an archived AppVar. This tests the game path,
not manual archive allocation or garbage collection.

The ZIP contains only the actual game, libload/graphx/keypadc/fileioc v15.0,
transfer instructions, the library license, and a SHA-256 manifest. Its contents
are read back and compared to source files; no firmware, test program, fixture,
or developer tool is included. See `TRANSFER.md` for the physical acceptance check.

Remaining release boundary: **no physical device or OS 5.7 run was performed**.
Real power interruption, archive/GC, user timing/performance and exhaustive manual
name/navigation edge cases remain hardware checks. Automated runs establish
native functionality, not a measured 15–25-minute human playthrough. The transfer
candidate is available now; physical calculator verification remains the release gate.

Transfer ZIP: `bin/CONTAGION-CE-2.0.zip`, 40,151 bytes; SHA-256
`dee101fd618213ff86d570da9d74a67017a5c32be0f60dc0147678acbced4cc2`.
Final build, full-run, smoke and native-diagnostic logs are retained locally under
`tests/cemu/artifacts/release/` (ignored by Git, no firmware). The final rebuilt
native diagnostic also passed the complete save/outcome/39-node UI sequence with
its freshly exported archived-save fixture.

## September 26: 200 mechanical events

Delivered 100 standalone entries and 20 branching five-entry storylines, fixed
four-slot event scheduling, paused World Events details, six-row Actions
scrolling, and v3 event persistence with explicit v2 import. Catalog content,
generated C, and the readable reference are checked together. No firmware was
downloaded, and no commits or pushes were made.

Commands run from the repository (all final checks passed):

```sh
python3 tools/generate_events.py --check
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk sh tests/host/run.sh test_rules
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk sh tests/host/run.sh test_ticker
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk sh tests/host/run.sh test_events
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk sh tests/host/run.sh test_event_saves
SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk sh tests/host/run.sh event_balance
PATH=/tmp/contagion-cedev-mount/CEdev/bin:$PATH CEDEV=/tmp/contagion-cedev-mount/CEdev make OUTPUT_MAP=YES
PATH=/tmp/contagion-cedev-mount/CEdev/bin:$PATH CEDEV=/tmp/contagion-cedev-mount/CEdev sh tests/event-native/build.sh
TI84CE_ROOT=/tmp/ti84ce-eb90c33cfaebd19fbd0fea9c06a359e3efaf54c2 AUTOTESTER_ROM=/tmp/contagion-ti84ce.rom CE_LIBRARIES=bin/CONTAGION-CE-2.0 CONTAGION_PROGRAM=tests/cemu/artifacts/event-bin/CNTAGION.8xp CONTAGION_MAP=tests/cemu/artifacts/event-bin/CNTAGION.map TI84CE_OUTPUT=/tmp/contagion-events node tests/ti84ce/events.mjs
CE_LIBRARIES=bin/CONTAGION-CE-2.0 python3 tests/package/build.py
```

Host tests use AddressSanitizer/UndefinedBehaviorSanitizer. Event checks cover
all 200 entries with and without effect traits, exact regional contributions,
modifier bounds/stacking, private deterministic RNG, expiry, cancellation,
branches, Reshuffle delays, permanent/temporary closures, reset, and ticker text.
Save checks cover active stages one cycle before branching, both continuations,
recomputed-checksum semantic corruption, partial-cycle position, and v2 grace.
The existing production rules and ticker suites also passed.

The native fixture passed actual FileIOC backup recovery, v2 import with the
old file hash unchanged, v3 reloads, both severity branches, timed expiry, chain
cancellation, and permanent closures. Read-only emulator assertions passed
World Events/detail navigation, paused disease/event state, Actions scrolling,
and return paths. Inspected 320x240 captures showed readable text without
overlap. Initial observer attempts used too little boot/save time and an
ambiguous RAM locator; the final harness identifies RAM by the real map counts
and waits for the diagnostic completion marker. These are targeted fixtures,
not natural calculator playthroughs. Reference-core coverage is OS 5.3; physical
OS 5.7, real hardware performance, and power-loss behavior remain unverified.

Small actual-map policy comparison (two seeds per disease, 600-cycle limit):

| Disease | Events off: winning cycles | Events on: winning cycles | Event starts |
|---|---|---|---|
| Bacteria | 348, 335 | 357, 346 | 11, 11 |
| Virus | 352, 362 | 332, 335 | 10, 10 |
| Fungus | 423, 402 | 465, 399 | 14, 14 |

All twelve runs won; event-enabled runs used 13–15 purchases. This catches gross
pacing failures for one automated policy, not human balance or run duration.
No balance constants were retuned. Full disease/keypad playthroughs were not
repeated for this feature.

Final native artifact: 47,960 bytes (previous ticker build 29,685; +18,275).
ZIP: 62,120 bytes; builder verified seven payload files plus the checksum
manifest, and the directly transferable folder matches. Linker totals: text
55,133 bytes; read-only data 34,268; initialized data 10,843 (unchanged); BSS
587 (previous 487). Native event state is 50 bytes and modifier cache 48 bytes;
the remaining BSS difference is alignment. Save size is 10,973 bytes (+50).
Save streaming buffers remain 32 bytes, UI text buffers 80 bytes, with no new
heap allocation or duplicate map. Stack high-water and native speed were not
measured. Build warnings remain in legacy optix.c and SDK executable-stack notes.

SHA-256:

```text
f620a8aee5a57ca00db2fc414b3738cc5b112e0f0a7a43585ce3fb72dbe42642  CNTAGION.8xp
6bfb6873634861cb1b098c5d0d300fb8ad722394ae0a802f7f4898fc40bd411c  CONTAGION-CE-2.0.zip
```

Three GPT-6 Luna agents with max reasoning contributed catalog generation,
save/native fixtures, and event tests. Root reviewed and completed remaining
catalog/test fixes after delegated workers reached their usage limit.
