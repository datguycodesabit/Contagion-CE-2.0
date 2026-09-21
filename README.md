# CONTAGION CE
Contagion CE is a Plague Inc. inspired game written in C for the TI-84 Plus CE calculator.

Version 2.0 is a local development overhaul; published historical releases may still contain version 1.x. See [verification status](VERIFICATION.md) before release.

### Transfer this build

Use **[bin/CONTAGION-CE-2.0.zip](bin/CONTAGION-CE-2.0.zip)**, which includes the
native game, its four required runtime libraries, license notices and transfer
instructions. See [TRANSFER.md](TRANSFER.md) for TI-84 Plus CE OS 5.7 with arTIfiCE.
The ZIP is generated locally; historical GitHub releases may still be version 1.

## Historical version-1 screenshots
![Progress Bar](https://user-images.githubusercontent.com/59743315/88998471-1ec4f700-d2c0-11ea-9d27-805e5e90abde.png)
![Transportation View](https://user-images.githubusercontent.com/59743315/88999438-92680380-d2c2-11ea-9f43-c8621404f8f5.png)

## How to play 2.0

Start **New Game** with Y= (or Zoom when no run exists). Choose Bacteria, Virus,
or Fungus, enter a name with the on-screen character picker, and seed healthy
land. Bacteria is the recommended introduction. Spread quietly, collect DNA,
then evolve lethal symptoms before the cure finishes. Victory requires every
land cell to be dead; zero active infection with healthy survivors or a completed
cure loses. The result screen explains the outcome.

There are seven regions and 39 shared traits across Transmission, Symptoms, and
Abilities. Regional ratings make branches useful in different places. Virus can
mutate symptoms for free; Fungus has three paid spore bursts. Genetic Reshuffle
is a permanent, one-time purchase per level. Symptoms can be devolved only from
the leaves, for a cost and no refund.

| Context | Controls |
|---|---|
| Main menu | Y=: New Game; Zoom: start/continue/results; Graph/Clear: save and quit |
| Name picker | Arrows: character; Enter: add; Del: erase; Zoom: finish; Clear: cancel |
| Initial seed | Arrows: one map cell; Enter: seed; Clear: cancel |
| World | Arrows: spatial region selection; Enter: region info; Mode: travel view; Graph: evolve; Clear: save and return to menu |
| Evolution | Y=/Window: previous/next category; arrows: connected-node selection; Enter: details; Graph/Clear: return |
| Trait details | Enter: purchase; Del: devolve an eligible owned symptom; Graph/Clear: back |
| Fungus abilities page | Zoom: spore menu; Up/Down: destination; Enter: buy/release; Graph/Clear: cancel |

Evolution symbols: `*` owned, `+` available, `L` locked, `$` insufficient DNA.
Selection has an outline; color is not the sole indication. Release a key before
another action. All menus pause gameplay. Travel markers use a triangle for air,
a square for sea, and a slash when closed. A line shows a successful arrival.
The region panel shows mixed ratings and closed endpoint counts.

## Saves and reset

New saves use **CNTGN2**, with a validated previous generation in **CNTGN2B**.
Version-1 **CNTGNDAT** saves remain untouched and cannot continue under the new
rules. Saves are explicit, checksummed, validated before applying, and restore
partial-cycle scheduling. New Game clears all new progression and derived state.
If saving fails, the old valid save is retained; the quit screen offers an explicit
exit without saving. See [SAVE_FORMAT.md](SAVE_FORMAT.md) for layout and memory needs.

## Build and development testing

Install the official [CE Toolchain](https://github.com/CE-Programming/toolchain/releases).
Set `CEDEV` to its installation and put its `bin` directory on PATH. The Makefile
supports both the older `include/.makefile` layout and version 15's `meta/makefile.mk`.

```sh
make OUTPUT_MAP=YES
make test-host
make test-cemu
```

The native artifact is `bin/CNTAGION.8xp`. Transfer it and the GraphX/keypadc/FileIOC
runtime libraries appropriate to your OS with TI-Connect CE or a configured CEmu.
The program and its simulation are calculator-native; host tests use the same
pure rules and original sprites without providing a desktop game or fake CE UI.

Read [BALANCE.md](BALANCE.md), [ENGINE_AUDIT.md](ENGINE_AUDIT.md), and
[VERIFICATION.md](VERIFICATION.md). Emulator setup and remaining runtime checks
are in [tests/cemu/README.md](tests/cemu/README.md) and its smoke checklist.
No ROM is bundled or downloaded. Real calculator verification is the release gate.

## Credits
Coding & Graphics: ![epsilon5](https://www.cemetech.net/downloads/users/epsilon5)
This program was made possible by the OPTIX graphics library made by epsilon5, a stable release not available.

The runtime follow-up fixes keypad release scanning and a FileIOC save-replacement
crash. A native start/save/quit/relaunch/continue test now passes for all three
disease types using ti84ce's **CEmu reference core** (no desktop CEmu GUI required).
See [the reproducible smoke test](tests/ti84ce/README.md) and the latest section of
[VERIFICATION.md](VERIFICATION.md). The independent Rust core still has input
issues, and physical-calculator validation remains the release gate.
