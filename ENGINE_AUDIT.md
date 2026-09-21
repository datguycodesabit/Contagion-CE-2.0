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
  cached after ownership changes. There is no trait traversal per pixel and no
  repeated 64-bit arithmetic. Every probability has a bounded direct meaning.
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

The native v15 build and sanitizer-backed host rules/save tests are verified;
UI clipping, actual held-key behavior, FileIOC storage failure/recovery on device,
long-run timing, and the duration/balance targets still require CEmu/hardware.
A headless strategy diagnostic is evidence that each type can win under the
production rules, not a player playthrough or calculator performance measurement.
The scheduler remains render-coupled intentionally. Do not retune it from host
CPU time. Resource measurements and exact commands are in `VERIFICATION.md`.

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
