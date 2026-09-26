# Save format 3

New runs use **CNTGN3**. **CNTGN3T** is the temporary write and **CNTGN3B** is
the last validated backup. The older **CNTGNDAT** AppVar is never read or
changed. Version-2 saves (**CNTGN2** and **CNTGN2B**) remain readable only for
the explicit legacy-import offer; new saves are always version 3.

All integers are explicitly little-endian. The file contains no native structs,
pointers, padding, or compiler-specific integer widths. Trait IDs remain stable
in `disease.h`; two 32-bit words store ownership of the 39 traits. Map pixels
remain authoritative, while counts, effects, and event modifiers are rebuilt
from saved state on load.

## Byte layout

| Offset | Size | Field |
|---:|---:|---|
| 0 | 4 | ASCII `CNTG` |
| 4 | 1 | Version = 3 |
| 5 | 4 | Total encoded length including checksum |
| 9 | 8 | Two ownership words; only the low 7 bits of the second are valid |
| 17 | 4 | Completed cycles |
| 21 | 4 | Discovery cycle (0 when undetected) |
| 25 | 4 | Accumulated discovery pressure |
| 29 | 2 | DNA |
| 31 | 2 | Cure basis points, 0–10,000 |
| 33 | 2 | Cure remainder, 0–199 units of 1/200 basis point |
| 35 | 2 | Nine affected milestone flags |
| 37 | 1 | Six death milestone flags |
| 38 | 1 | Seven rewarded-region flags |
| 39 | 1 | Seven ever-infected-region flags, including pending rewards |
| 40 | 1 | Four cure-news milestone flags |
| 41 | 1 | Disease type: Bacteria 0, Virus 1, Fungus 2 |
| 42 | 1 | Started flag |
| 43 | 1 | Result: playing 0, won 1, active extinction 2, cure 3 |
| 44 | 1 | Response: undetected 0, discovered 1, research 2, escalating 3 |
| 45 | 1 | Spore charges consumed, 0–3 |
| 46 | 20 | Printable ASCII name, NUL-terminated and zero-padded |
| 66 | 4 | Saturating elapsed timer ticks (32,768 per second) |
| 70 | 1 | Selected region |
| 71 | 1 | Next region to update, 0–6 |
| 72 | 2 | Cursor x/y, within 160×120 |
| 74 | 1 | Map view, 0–1 |
| 75 | 3 | 22 closed-port flags; upper two bits must be zero |
| 78 | 4 | Event scheduler RNG state |
| 82 | 4 | Last cycle processed by the event scheduler |
| 86 | 4 | Earliest cycle for another event |
| 90 | 25 | 200 event-occurrence flags, bit 0 first in each byte |
| 115 | 1 | Reshuffle traits observed, bits 0–1 |
| 116 | 12 | Four active-event records: ID, region, remaining cycles |
| 128 | variable | Seven map records: width, height, x, y, then width×height pixels |
| final 4 | 4 | FNV-1a checksum of all preceding bytes |

The region order is Africa, Asia, Europe, Greenland, North America, South
America, Oceania. Current map geometry makes a v3 save **10,973 bytes**; v2 was
10,923 bytes. FNV-1a detects accidental corruption and is not authentication.

## Validation and replacement

The reader checks the exact file length, magic and version, checksum, map
geometry, land/ocean topology, pixel values, disease state, UI bounds, port flags,
and event scheduler state before applying anything. Event validation enforces a
nonzero RNG state, a scheduler cycle at or immediately before the disease cycle,
the 24-cycle maximum start window, reshuffle ownership, valid occurrence-chain
flags, and canonical active slots. Only healthy, infected, and dead values are
valid at existing land positions; only empty is valid at ocean positions. The
map is read through a 32-byte buffer and region counts are rebuilt after loading.

Saving streams to `CNTGN3T` and validates it. A validated primary is copied to
`CNTGN3B` with a 32-byte buffer before the temporary save is copied to
`CNTGN3`; each copy is validated after its handle closes. The temporary file is
removed after primary validation. If replacement fails, loading falls back to
the validated backup. The flow does not use FileIOC rename, which invokes
TI-OS archiving and previously failed during the GraphX save flow.

On launch, an invalid or missing primary falls back to the v3 backup; if neither
validates, gameplay state resets. Version-2 files are not loaded automatically.
The import offer checks `CNTGN2` first and then `CNTGN2B`; accepting it decodes
the v2 state, initializes the event scheduler with a deterministic nonzero seed,
and grants 24 cycles before the first event can start. The next save is v3.
Import never modifies or deletes the original v2 AppVar.

AppVars are written in RAM, matching the previous workflow. Budget room for the
primary, backup, and temporary copy during replacement (up to 32,919 data bytes,
plus OS metadata). A user may archive the primary with the calculator OS;
archived load/copy behavior remains a physical-hardware check. No automatic
archive operation or garbage-collection callback runs during play.

Save on returning from gameplay and on quitting. Partial-cycle position
persists; loading does not award rewards, mutate symptoms, or advance research.
New Game resets pixels, disease and economy state, port closures, event
scheduler, UI state, and derived effects. A previous v3 generation may remain
as the recovery backup. Selecting New Game does not delete older AppVars.

The focused host save checks cover active chain records saved immediately
before either branch, continuation after decode, repaired-checksum corruption
cases, partial-cycle position, and v2 decode with the import grace period. The
native FileIOC fixture checks v3 roundtrip and backup recovery, v2 import without
changing the legacy bytes, both chain branches, event expiry and cancellation,
and closed-port persistence. Archive allocation and power-loss behavior still
require calculator or emulator integration checks.
