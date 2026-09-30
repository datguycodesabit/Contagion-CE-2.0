# CONTAGION CE 2.0 engine audit

## Current boundaries

- Seven original mutable sprites remain authoritative. No second world buffer,
  country grid, recovery state, per-cell population field, or heap allocation was
  added to simulation/rendering. The original coordinates, 2× scaling, and
  x-major/y-minor in-place scan behavior remain.
- `world.c` centralizes healthy → active → dead transitions. Counters update at
  the transition, fixing stale counts for infections behind the scan cursor and
  deaths on the currently processed cell. Healthy, active, dead, and derived
  active-plus-dead values have distinct uses. Geometry is counted on initialization
  and load; gameplay sums cached counts rather than rescanning the map.
- `StepWorldRegion` advances one region. `Play` attempts transport afterward and
  invokes `CompleteCycle` only on wrap. All global mechanics run once there.
  Mutation and migration occur before the cycle's consistent outcome snapshot.
  Render functions neither award DNA nor advance cure. Modal timer time is discarded.
- `disease.c` and `traits.c` hold pure rules and compact ownership. Effects are
  rebuilt after ownership changes and completed cycles, including event modifiers.
  There is no trait traversal per pixel and no repeated 64-bit arithmetic. Every probability has a bounded direct meaning.
- Source transport requires current active infection, valid compatible endpoints,
  and open routes. Three misplaced Oceania endpoints were moved to nearby land.
  Arriving carriers can seed a healthy cell elsewhere in the same region, making
  disconnected islands reachable. Migration uses seven neighbor masks; all land
  searches and route selection are bounded.
- `evolution.c` renders three fixed connected-node pages and details. Key actions
  require release, and all modals pause the simulation. The old OPTIX name helper
  wrote beyond its maximum-length buffer and retained a freed allocation pointer
  in the old call path; 2.0 uses a fixed-buffer picker and no longer calls it.
  Original OPTIX source/assets remain untouched as historical/vendor code.
- `savecodec.c` performs explicit fixed-width little-endian streaming validation,
  then application, using a 32-byte pixel buffer. `persistence.c` adapts FileIOC
  and preserves a validated previous generation during replacement. Never free
  generated sprite assets. See `SAVE_FORMAT.md` for field and compatibility details.

## Risks and verification boundaries

The native v15 build and sanitizer-backed host suites are verified. Earlier
OS 5.3 reference-core runs cover menus, held keys, FileIOC failure/recovery,
and full disease playthroughs; those historical results are recorded separately
from the current cleanup checks in `VERIFICATION.md`. Physical OS 5.7 behavior,
archive garbage collection, real power loss, stack high-water, and gameplay
performance remain unverified. Automated host policies are regression evidence,
not human playthroughs or calculator timing measurements. The scheduler remains
render-coupled intentionally; do not retune it from host CPU time.

## Historical stabilization audit (preserved)

The following describes the pre-overhaul 1.x checkpoint, not current gameplay.

### Contagion CE 1.x Engine Audit

This audit describes the stabilization state of the original engine. The seven
mutable continent sprites remain both the rendering source and authoritative
disease state. No full-world simulation buffer was added.

## Keep as-is

- GraphX double-buffered rendering and scaled continent sprites.
- One-region-per-render-iteration simulation scheduling.
- In-place, scan-order-dependent local propagation.
- Random source/destination transportation among 22 ports.
- Source-selected, permanent, stochastic port closure.
- Spatial region-selection scoring.
- Calculator-native keypad polling and timer accounting.

## Safe to refactor

- Repeated region/port counts and palette values now use named constants.
- Derived region counts are rebuilt from authoritative sprite pixels after load.
- Static port configuration is `const`; only each port's closed flag is saved.
- Initialization now clearly establishes map and port references, default state,
  derived totals, and then attempts a load.

## Bugs fixed

- Local neighbor coordinates could index before or after sprite pixel storage.
- `InfectCoordinate()` excluded the top and left edges of region rectangles.
- The mutation-menu exit expression was always true and input was not debounced.
- Mutation counters could overflow and transmission/travel RNG ranges could become
  invalid.
- DNA awards depended on unspent DNA and could be earned again after purchases.
- The hardcoded world total became stale if map sprites changed.
- Raw struct saves had no identifier, version, size, or read validation.
- Port closure state was not persisted.
- Save code freed generated static sprite assets.
- Fixed buffers were written through unbounded copies/formatting in game code.
- Reset deleted the save but did not reset the running game cleanly.
- An unused FPS formatting expression could divide by a zero timer count.

## Unfinished / future extension

- Recovery (`numrecovered`, `squaresrecovered`) has no implemented cell state.
- Population density and regional infection probability are not active mechanics.
- `virus.probinfection` is legacy state; local spread currently uses `vSpeed`.
- Detailed population totals, symptoms, regional response, and cure research remain
  future virus/region-level systems rather than per-cell fields.
- The simulation is intentionally render-coupled. `UpdateSimulation()` is the
  boundary where a future fixed-timestep scheduler can call one region update.

## Dead code

- Empty `RenderView()` scaffolding and unused simulation/menu/FPS locals were
  removed. Commented debug and obsolete rendering fragments can be removed in a
  later cosmetic pass; they do not allocate runtime memory.

## Performance-sensitive

- `UpdateSimulation()`, `UpdateTransportation()`, `DrawMap()`, and the gameplay
  loop remain allocation-free.
- The world land total is counted during initialization/load/reset, never per frame.
- Save loading uses a 32-byte stack buffer only while validating pixel chunks.

## Save-format-sensitive

- `game_t` and `virus_t` are no longer serialized as raw structs.
- Save version 1 contains magic `CNTG`, a version byte, explicit fixed-width state,
  a three-byte port bitset, and the seven pixel arrays in region order.
- Runtime pointers, static port configuration, news text, and derived counts are
  not serialized.
- Original unversioned saves are rejected safely. They are not migrated because
  their raw compiler-dependent struct layout cannot be validated reliably.

## Good extension points

- `InfectCoordinate()` remains the world-to-region infection boundary.
- `RecountRegion()`/`RecountWorld()` define authoritative-to-derived rebuilding.
- `ResetGameState()` owns new-game defaults without duplicating sprite data.
- Explicit save fields can be extended behind a new save version.
- Mutation maximum constants provide a small boundary for a later table/bitmask
  mutation system.

## September 21 stabilization evidence

Native execution now covers all three natural winning runs, a natural cure loss,
all 39 purchase UI paths, spores/devolution and separate outcome fixtures. Actual
FileIOC checks cover low RAM, backup recovery, corruption and prearchived saves.
The save copy remains bounded to 32 bytes; no new game allocations or production
API/schema changes were needed. Separate test programs are excluded from the
transfer ZIP. See VERIFICATION.md for exact evidence and the OS 5.3/physical 5.7
boundary; archive allocation/GC and actual power-loss behavior are not verified.

## Mechanical event extension (September 25)

`events.c` owns bounded scheduling, validation, branch conditions, and modifiers;
`event_ui.c` owns the paused inspection UI. `data/events.json` is authoritative;
`tools/generate_events.py` emits checked-in C and `docs/EVENTS.md`. Native builds
do not invoke Python. Event calculation uses cached counts, never scans pixels,
and does not consume the simulation RNG. Candidate selection takes two bounded
catalog/region passes only when a scheduled start succeeds.

Four active records, a 25-byte occurrence mask, scheduling counters, RNG, and
Reshuffle markers serialize to 50 additional bytes. No heap allocation or second
map is introduced. The v3 codec validates before applying and preserves the
32-byte streaming buffer. Legacy v2 decoding remains available only for explicit
import; newer saves use separate CNTGN3 AppVars. The original audit's older save
layout discussion above is historical; see SAVE_FORMAT.md for current details.

Measured final linker BSS is 587 bytes: event state 50 bytes, cached modifiers
48 bytes, and two extra alignment bytes relative to the 487-byte ticker build.
Initialized data remains 10,843 bytes. Read-only data is 34,268 bytes and text
55,133 bytes. Stack high-water and native performance were not measured.

## September 29 cleanup

The v2 and v3 codecs now share header checks and map streaming/validation.
Version-specific state remains separate, including the 50-byte v3 event record;
v2 import does not allocate an event record. Both decode paths still validate
before applying. The pixel buffer remains 32 bytes; the shared map helper adds
a call frame, so this is not a claim of reduced peak stack usage.

Event eligibility skips percentage calculations for zero thresholds and returns
as soon as one meaningful effect is found. Of the 120 possible event starts,
79 have no active-percentage minimum and 117 have no death-percentage minimum.
Each such threshold now avoids its population sum and integer division when
eligibility reaches it. Catalog order, selection passes, and RNG calls stay the
same. Twelve deterministic production-rule runs matched the baseline output.

The native package shrank from 47,960 to 46,976 bytes; linker text fell from
55,133 to 53,082 bytes. Read-only data (34,268), initialized data (10,843), and
BSS (587) are unchanged. No runtime speed or stack high-water claim is made.

Retained deliberately: two-pass loading and recoverable FileIOC copying,
in-place map updates, cycle-boundary effects refresh, and legacy OPTIX sources.
These have compatibility or historical value; removing them or adding another
cache would broaden the change without demonstrated benefit. Balance, catalog
wording/IDs, controls, RNG sequencing, and save schemas were not changed.
