# CONTAGION CE 2.0 initial balance

This is an original, simplified strategy ruleset. Climate/settlement ratings are
mixed gameplay weights, **not demographic or scientific claims**. The target is
15–25 minutes and roughly 12–20 purchases in a successful run. Calculator timing
and typical human difficulty have not been established by playtesting.

## Units and scheduling

One iteration updates one continent, in x-major/y-minor scan order, in place.
It then attempts one human journey. Every seventh iteration completes a world
cycle: migration, possible Virus mutation, rewards, discovery/research, outcomes,
and permanent travel restrictions. Menus pause the simulation. A cell infected
behind the scan cursor waits until next cycle to spread; one ahead may spread
this cycle. Counts change immediately with each pixel transition.

Probabilities use integers out of 10,000. `Roll(0)` always fails and `Roll(10000)`
always succeeds without calling the RNG. Effects are computed when ownership
changes, never by walking the trait tree inside the pixel loop. Zero lethality
means no deaths. All percentages use land cells, not the rectangular sprite area.
The current assets contain 4,410 land cells in 10,813 pixel slots.

`src/traits.c` owns costs, prerequisite chains, symptom effects, text, fixed node
positions, and navigation. `src/balance.h` owns tunable mechanics constants; `src/disease.c` owns ratings,
reward thresholds, one-time action values, and formulas. `src/world.c` owns port/neighbor tables
and applies those cached effects. Changing numeric balance does not change the
save's meaning unless trait IDs or field semantics change.

## Regional ratings (0–4)

| Region | Heat | Cold | Humid | Dry | Urban | Rural | Healthcare |
|---|---:|---:|---:|---:|---:|---:|---:|
| Africa | 4 | 0 | 2 | 3 | 2 | 4 | 1 |
| Asia | 3 | 3 | 3 | 3 | 4 | 3 | 3 |
| Europe | 1 | 3 | 2 | 1 | 4 | 2 | 4 |
| Greenland | 0 | 4 | 1 | 3 | 1 | 1 | 3 |
| North America | 2 | 3 | 2 | 3 | 4 | 3 | 4 |
| South America | 3 | 1 | 4 | 1 | 2 | 4 | 2 |
| Oceania | 3 | 1 | 3 | 4 | 3 | 2 | 3 |

Baseline infectivity is 12; severity, lethality, and cure resistance start at 0.
Spread starts at `100 × infectivity` basis points, subtracts 100 per heat rating,
180 per cold rating, and 100 per healthcare rating, then adds transmission
bonuses below. Heat/Cold/Medical adaptation reduces its corresponding penalty by
45% per owned level (90% at level II). The final probability is clamped to
100–10,000: a 1% foothold prevents a climate from becoming an absolute barrier.

## Evolution: 39 shared nodes

All level II nodes require their level I. Transmission I costs 6 DNA; II costs
10. Bonuses listed here are **per purchased node**, so both levels stack.

| Branch | Effect per level |
|---|---|
| Air | +1,200 bp air travel; +220 bp local spread per dry rating |
| Water | +1,200 bp sea travel; +220 bp per humidity rating |
| Livestock | +280 bp per rural rating |
| Rodents | +280 bp per urban rating |
| Insects | +280 bp per heat rating |
| Birds | +2 infectivity; migration chance +100 bp |
| Blood | +1 infectivity; +50 bp spread, plus 100 bp for each missing healthcare rating below 4 |

Combinations cost 16 DNA each:

- **Aerosol Persistence**, Air II + Water II: +1,000 bp to each human travel mode
  and +300 bp local spread.
- **Animal Reservoirs**, Livestock II + Rodents II: +600 bp local spread, plus
  `100 × (8 − urban − rural)` bp, bridging areas with sparse settlement weights.
- **Vector Adaptation**, Insects II + Birds II: +280 bp per cold rating and
  +200 bp migration chance, extending the warm/vector branch into cold regions.

Each symptom branch is a four-node chain. Effects are additive; lethality is the
percentage chance an active cell dies on its region update, after attempting
spread. Final nodes are deliberately dangerous before all land is affected.

| Tier | Respiratory | Digestive | Systemic | Cost | Infectivity | Severity | Lethality |
|---|---|---|---|---:|---:|---:|---:|
| 1 | Cough | Nausea | Rash | 5 | +5 | +2 | 0 |
| 2 | Sneezing | Vomiting | Fever | 8 | +8 | +4 | 0 |
| 3 | Pneumonia | Diarrhea | Immune Suppression | 12 | +6 | +10 | +1% |
| 4 | Respiratory Failure | Systemic Collapse | Organ Failure | 18 | +2 | +24 | +5% |

A symptom can be devolved only if no owned node depends on it. This costs 4 DNA
(7 for Virus), gives no refund, and removes that node's effects immediately.
It does not undo discovery, cure milestones, or port closures.

| Ability pair | I/II costs | Effect per level |
|---|---|---|
| Heat Adaptation | 8 / 14 | Remove 45% of original heat penalty |
| Cold Adaptation | 8 / 14 | Remove 45% of original cold penalty |
| Medical Resistance | 8 / 14 | Remove 45% of original healthcare penalty |
| Genetic Hardening | 8 / 14 | Remove 30% of research speed (60% total) |
| Genetic Reshuffle | 16 / 24 | Immediately subtract 1,500 / 2,500 cure basis points |

Reshuffle requires discovery and positive cure progress, floors cure at zero,
and clears the fractional remainder when reaching zero. Each level is consumed
permanently; it cannot be devolved or repurchased. Its UI shows cure reduction as
well as derived characteristics.

At maximum ownership the shared characteristics are infectivity 81, severity
120, lethality 18%, and resistance 60%. Regional probabilities still clamp.
The entire shared tree costs 417 DNA, well beyond the 179-DNA economy; completion
is unnecessary and not the progression objective.

## Travel, migration, and disease types

Every iteration selects air or sea with equal probability. A bounded reservoir
scan selects an open compatible source with active infections, then an open
compatible endpoint in another region. No compatible endpoints means no journey.
Base chance is 800 bp for either mode, plus the corresponding upgrades. Multiply
this by the source's **active count / land count**, using a 32-bit product.
Dead-only regions cannot travel. A successful arrival seeds one healthy cell
found by a bounded scan from a random offset in the destination region. This
allows disconnected islands to be reached without a second map representation.
A displayed route line represents a successful infection seed.

Air/sea capabilities and closure thresholds are explicit in the 22-entry static
port table. Three original Oceania endpoints were on ocean pixels; they were
moved from (132,66), (126,68), (154,94) to (141,68), (142,68), (153,94).
Every endpoint is tested against its authoritative sprite.

Birds attempt migration every 8 cycles. A randomly selected active source must
pass its cached migration probability scaled by active prevalence. It then
selects a neighbor with healthy land and seeds one cell. Base probabilities at
Birds I/II are 1%/2% per attempt; Vector Adaptation raises II to 4%. This lower
chance and cadence keep migration less reliable than open human journeys.
Closures do not affect it. Neighbors are:

- Africa: Asia, Europe, South America.
- Asia: Africa, Europe, North America, Oceania.
- Europe: Africa, Asia, Greenland.
- Greenland: Europe, North America.
- North America: Asia, Greenland, South America.
- South America: Africa, North America.
- Oceania: Asia.

Bacteria has no automatic mutation. Virus checks every 12 cycles with a 15%
chance of a free eligible symptom, selected uniformly from the eligible set.
It cannot mutate transmissions or abilities. A devolved symptom can mutate again.
Fungus halves normal air/sea probabilities after bonuses; its three spore charges
cost 10, 16, and 24 DNA. A player-selected healthy destination is validated and
seeded before DNA or the charge is consumed; invalid choices and cancellation
spend nothing. Spores ignore port restrictions and cannot target non-land cells.

## DNA, detection, research, and restrictions

Start with 12 DNA. First infection of each region earns 5 at the next cycle
boundary. A region seeded and then exhausted before that boundary still earns
its one-time reward. Affected milestones 1/5/10/20/35/50/70/90/100% give 8 each;
death milestones 1/10/25/50/75/90% give 10 each. Each bit is persistent. Spending,
devolution, menus, and reload never recreate rewards. DNA uses `uint16_t`, capped
at the entire attainable economy of 179.

Let A/D be global integer active/death percentages, S severity, and N the number
of regions with active infection. Each cycle, undetected discovery pressure adds:

`floor(sum(regional healthcare × regional active %) / 8) + A + 2S + 8D`.

Discovery becomes permanent at accumulated pressure 12,000, active prevalence
65%, or global deaths 5%. Research starts 8 cycles later. Each research cycle adds
`(20 + floor(A/2) + D + 2S + 3N) × (100 − resistance)` fractional units. There are
200 units per cure basis point and 100 basis points per displayed percent.
The remainder persists. Resistance never stops research while infection remains.
At 25% cure, severity 30, or 10% deaths, research advances to escalating response.
Milestone news reports discovery, research, escalation, and cure 25/50/75/90% once.

After discovery, each open port compares its threshold with
`floor(regional active % / 10) + regional dead % + severity + escalation bonus`.
The escalation bonus is 10. A qualifying port closes with 8% chance per cycle
and never reopens that run. Prevalence alone does not immediately shut down every
route; severe disease creates stronger restrictions. First restrictions per
region generate news; persisted closed ports also serve as that event's marker.

After the cycle's migration, mutation, rewards, and research, zero living cells
wins even if cure reaches 100% simultaneously. Otherwise, zero active infections
with healthy survivors loses; completing cure also loses. No result is evaluated
before the initial seed or halfway through a cycle.

## Diagnostic evidence and remaining tuning

`tests/host/balance.c` runs the actual rules and sprites without a UI. Its default
policy starts in Africa, buys Water I, Air I, Livestock I, Insects I, Water II,
Air II, Cold I, and both Hardening levels as funds allow, then the respiratory
chain after all land is affected. It devolves lethal Virus mutations early,
uses Fungus spores for otherwise uninfected regions, and reshuffles late if needed.
This uses perfect cell information and a host RNG, not a human playthrough.

The latest 10 seeds per disease all won: Bacteria 335–417 cycles with 13–14 paid
nodes; Virus 314–375 cycles with 11–13 paid nodes plus free mutations; Fungus
389–489 cycles with 13–14 paid nodes. An aggressive policy buying lethal symptoms
before full spread lost by active extinction in all 9 sampled runs. Two alternate openings (Livestock/Insects and Rodents/Blood first) also won
all 18 sampled runs, across three seeds per disease per opening. These are
feasibility evidence, not proof of the duration target, broad strategy balance,
input usability, or hardware performance. See `VERIFICATION.md` for commands.

## Native policy observations (September 21)

Actual native keypad-driven victories: Bacteria 370 cycles / 13 purchases;
Virus 342 / 11 purchases plus mutations; Fungus 440 / 13 purchases plus one spore.
Final cure was 66.48%, 68.73%, and 78.92%, respectively. A nonlethal Bacteria
policy lost to cure at cycle 713. These support functional winning paths, not
human difficulty or wall-clock run-length targets. No constants were retuned.
