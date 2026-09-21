# Save format 2

New runs use **CNTGN2**. The old **CNTGNDAT** AppVar is never read, renamed,
overwritten, or deleted. Version-1 runs cannot be continued under the new rules.
`CNTGN2T` is a temporary write and `CNTGN2B` is the last validated backup.

All integers are explicitly little-endian; no native structs, pointers, `int`,
`long`, padding, or compiler-specific 24-bit values are stored. Trait IDs are
stable in `disease.h`; 39 ownership bits occupy two 32-bit words. Pixel buffers
remain the authoritative state. Derived counts and effects are rebuilt on load.

## Byte layout

| Offset | Size | Field |
|---:|---:|---|
| 0 | 4 | ASCII `CNTG` |
| 4 | 1 | Version = 2 |
| 5 | 4 | Total encoded length including checksum |
| 9 | 8 | Two ownership words (only low 7 bits of second word valid) |
| 17 | 4 | Completed cycles |
| 21 | 4 | Discovery cycle (0 when undetected) |
| 25 | 4 | Accumulated discovery pressure |
| 29 | 2 | DNA |
| 31 | 2 | Cure basis points, 0–10,000 |
| 33 | 2 | Cure remainder, 0–199 units of 1/200 basis point |
| 35 | 2 | Nine affected milestone flags |
| 37 | 1 | Six death milestone flags |
| 38 | 1 | Seven rewarded region flags |
| 39 | 1 | Seven ever-infected region flags, including pending rewards |
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
| 78 | variable | Seven records: width, height, x, y (one byte each), then width×height pixels |
| final 4 | 4 | FNV-1a checksum of all preceding bytes |

Region order is Africa, Asia, Europe, Greenland, North America, South America,
Oceania. The current total is **10,923 bytes**, versus 10,858 for stabilized v1.
FNV-1a detects accidental corruption; it is not an authentication mechanism.

## Validation and replacement

A validation pass checks exact length, magic/version, checksum, geometry,
land/ocean topology, cell palette values, enum ranges, field bounds, prerequisite
ownership, canonical names, milestone masks, DNA bounded by earned income,
region reward consistency, discovery state, spore type/limit, and completed
outcome consistency. Only healthy/infected/dead values are valid at existing
land positions; only empty is valid at existing ocean positions. The full file
is checked before any live pixel is changed. A second streaming pass applies it
using a 32-byte pixel buffer and rebuilds counts. No duplicate map is allocated.

Saving writes and validates `CNTGN2T`, copies a validated primary to `CNTGN2B`
with a 32-byte buffer, validates that backup, and only then copies the temporary
file to `CNTGN2`. The completed primary is validated before deleting the temporary
file. Handles are closed before validating each copy. If primary replacement fails,
loading falls back to the validated backup. If backup copying fails, the old primary
is retained. No rename is used: FileIOC v15 rename invokes TI-OS archiving, which
crashed during the GraphX save flow in both tested emulator cores.
On launch, an invalid/missing primary falls back to the validated backup; otherwise
all gameplay state resets. Temporary incomplete files are never loaded.

AppVars are written in RAM, matching the previous workflow. Budget room for the
primary, backup, and temporary copy during replacement (up to 32,769 data bytes,
plus OS metadata). A user may archive the primary with the calculator OS; archived
load/copy behavior remains on the physical-hardware checklist. No automatic
archive operation or garbage-collection callback runs during play.

Save on returning from gameplay and on quitting. Partial-cycle position persists;
loading does not award rewards, mutate symptoms, or advance research. New Game
resets pixels, disease/economy/response markers, port closures, scheduler, UI
state, and effects. The previous generation may remain as a recovery backup;
selecting New Game does not delete unrelated or version-1 AppVars.

September 21 native FileIOC diagnostics passed low-RAM failure, corrupt/missing
primary backup recovery, both-invalid reset, exact partial-cycle roundtrip, and
load/replacement of a production save injected as an archived AppVar. A truncated
primary is an interruption fixture; actual power cuts and manual archive/GC
remain physical checks. The tested ROM reports ARCHIVE FULL when asked to archive
through TI-OS, so this does not establish archive-allocation behavior.
