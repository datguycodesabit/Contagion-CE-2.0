# CONTAGION CE 2.0 CEmu / hardware smoke checklist

Record toolchain, CEmu, ROM/OS, source revision, and the exact `.8xp` hash.
Unchecked items are **not** verified by the host tests. Use a debugger for exact
DNA/cure fixtures; do not add emulator-only gameplay code. Repeat release checks
on a TI-84 Plus CE or TI-83 Premium CE. Do not commit ROMs or emulator artifacts.

## Automated evidence versus physical acceptance

Keep the boxes below for **physical calculator acceptance**. September 21 native
emulator coverage now includes three natural victories, a natural cure defeat,
save/relaunch for every type, all 39 purchases, held Enter/duplicate purchases,
spores/devolution, native backup/corruption/low-RAM/archived-save handling, and
constructed outcome fixtures. Details and limitations are in `VERIFICATION.md`.
Native fixtures do not establish real power-loss/GC behavior or OS 5.7 support.

## Startup and persistence

- [ ] With no v2 AppVars, reach the menu with clean defaults.
- [ ] With only a v1 `CNTGNDAT`, start clean; confirm it remains byte-for-byte unchanged.
- [ ] Load valid `CNTGN2`; confirm all sprites, type/name, traits, DNA, closures,
      rewards, cure remainder, and scheduler position survive.
- [ ] Reject unsupported versions, wrong length/magic/checksum/geometry, invalid
      pixels, enums, bitsets, prerequisites, counters, and unterminated names.
- [ ] Reject corrupt primary and recover a valid `CNTGN2B`; reject both and reset.
- [ ] Exercise out-of-storage and interrupted replacement. The last validated
      save must survive. The failed-quit dialog must allow explicit unsaved exit.
- [ ] Load and replace a save manually archived by the calculator OS.

## New game and reset

- [ ] All three disease types are available immediately; Bacteria is the default.
- [ ] Enter 0, 1, 8, and 19-character names; erase/retype; save and reload each.
- [ ] Initial seed accepts healthy land only, including top/left pixel boundaries.
- [ ] Ocean/out-of-bounds seed attempts do not alter state.
- [ ] Cancel setup safely; start a different type.
- [ ] Start new after a progressed or completed run. All map mutations, owned
      traits, DNA/reward bits, discovery/cure/remainder/news markers, cycles,
      spore uses, closures, selection/view, and effect caches reset.

## Simulation and scheduling

- [ ] One region updates per gameplay iteration, in order; global progression
      advances only after all seven updates and the last transport attempt.
- [ ] In-place propagation retains scan-order dependence at all four sprite edges,
      coastlines, holes, and narrow land strips; no ocean corruption.
- [ ] Active/healthy/dead counts match pixels immediately, including changes behind
      the scan cursor; affected is active plus dead.
- [ ] Zero lethality produces zero deaths. Increasing spread/resistance has the
      documented direction and maximum ownership produces valid arithmetic.
- [ ] Menus pause gameplay and do not add their elapsed time to the run timer.

## Evolution navigation and purchases

- [ ] Open Transmission, Symptoms, Abilities using Y=/Window in both directions.
- [ ] Visit every node and exercise all four navigation edges from each node,
      including self edges and category wrap. Selection remains visible.
- [ ] Check all prerequisite connectors, names, costs, states, descriptions, and
      before/after previews on the actual 320×240 screen.
- [ ] Owned/available/locked/unaffordable states remain distinguishable without color.
- [ ] Buy each root and dependent node, each combination, and both reshuffles.
- [ ] Exact DNA succeeds; insufficient DNA and missing prerequisites fail unchanged.
- [ ] Duplicate purchases and held Enter never charge twice or buy another level.
- [ ] Held arrows/category keys and Graph/Clear have one action per release.
- [ ] Devolve an owned leaf symptom; reject an owned prerequisite/non-symptom.
      Confirm no refund, higher Virus cost, and unchanged discovery/closures.
- [ ] Reshuffle requires discovery and positive research, lowers cure once, cannot
      be devolved/repurchased, and does not repeat cure milestone news afterward.
- [ ] Graph/Clear exits every level without trapping the player or exiting play accidentally.

## Disease types, regions, and routes

- [ ] Bacteria never mutates automatically.
- [ ] Virus only mutates eligible unowned symptoms, for free, on its cycle cadence;
      verify its notification and later paid devolution.
- [ ] Fungus ordinary travel is weaker; all three spore charges have escalating costs.
- [ ] Spore destination selection shows healthy land counts. Invalid/full region,
      insufficient DNA, exhausted charges, and cancellation spend nothing.
- [ ] A valid burst seeds exactly one healthy cell even with all ports closed.
- [ ] Regional information matches the documented mixed ratings and effective spread.
- [ ] Air/sea endpoints only pair compatibly across regions. Mode upgrades change
      only their corresponding travel chance (except the documented combination).
- [ ] Dead-only source regions never export infection; closed endpoints never do.
- [ ] No compatible route safely skips. A route line indicates a successful seed.
- [ ] Arrivals can eventually reach disconnected healthy islands within a region.
- [ ] Birds migrate only from active sources to healthy neighboring regions, on the
      lower-frequency cycle schedule, independently of human closures.

## Response, economy, and outcomes

- [ ] Silent spread delays discovery, but extreme active prevalence forces it.
- [ ] Discovery remains after devolution. Research begins after its delay and advances
      only on cycles, including at maximum hardening with sub-percent increments.
- [ ] Discovery/research/escalation/cure milestone news is event-triggered, not frame spam.
- [ ] Restrictions close permanently under documented pressure; devolution/load does
      not reopen them or repeat their first-region news.
- [ ] Region, affected, and death rewards trigger once. Spend, save/load, reopen menus,
      and revisit regions; verify no repeated rewards.
- [ ] Win with all land dead; lose by active extinction with survivors; lose by cure.
- [ ] Arrange final death and cure completion together: victory takes precedence.
- [ ] Do not end a run from stale partial-cycle counts or before the first seed.
- [ ] Results show type/name, cycles, final percentages, and correct cause; simulation stops.

## Save stages and release gate

- [ ] Round-trip all three types before discovery, after discovery, during research,
      with fractional cure, after reshuffles/devolution/spores, with closures, and
      after each outcome. Include all seven partial-cycle scheduler positions.
- [ ] Play several different early transmission strategies and all three diseases;
      record purchases, outcome, duration, and difficulty rather than assuming targets.
- [ ] On physical hardware verify input feel, timer behavior, sustained responsiveness,
      RAM/storage behavior, archived saves, reset, and prolonged simulation.
- [ ] Compare the exact release artifact hash and resource report; no emulator-only code.
