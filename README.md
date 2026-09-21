<p align="center">
  <img src="icon.png" width="128" alt="CONTAGION CE icon">
</p>

<h1 align="center">CONTAGION CE</h1>

<p align="center">
  A disease-spreading strategy game for TI-84 Plus CE family calculators.
</p>

<p align="center">
  <a href="bin/CONTAGION-CE-2.0.zip">Download CONTAGION CE 2.0</a>
  ·
  <a href="https://www.cemetech.net/downloads/files/2022/x2078">Cemetech Archive</a>
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/59743315/88998471-1ec4f700-d2c0-11ea-9d27-805e5e90abde.png" alt="CONTAGION CE gameplay">
</p>

## About

CONTAGION CE is a strategy game inspired by *Plague Inc.* Spread a disease
across seven regions, evolve transmissions and symptoms, manage transportation,
and defeat the cure before the outbreak ends.

Choose between three disease types:

- **Bacteria** — the balanced starting disease
- **Virus** — can mutate symptoms during the outbreak
- **Fungus** — has three powerful spore bursts

The game includes regional conditions, air and sea transportation, discovery,
research, healthcare response, permanent restrictions, saving, and multiple
outcomes.

## Compatibility

- TI-84 Plus CE
- TI-84 Plus CE-T
- TI-83 Premium CE
- Native eZ80 calculator programs

On operating systems that restrict native programs, launch the game through
[arTIfiCE](https://yvantt.github.io/arTIfiCE/) or another native-program shell.

## Download contents

The release package includes:

- `CNTAGION.8xp`
- `libload.8xv`
- `graphx.8xv`
- `keypadc.8xv`
- `fileioc.8xv`
- Installation instructions
- Credits and license notices
- SHA-256 checksums

## Screenshots

<p align="center">
  <img src="https://user-images.githubusercontent.com/59743315/88999438-92680380-d2c2-11ea-9f43-c8621404f8f5.png" width="48%" alt="Transportation view">
  <img src="https://user-images.githubusercontent.com/59743315/88998471-1ec4f700-d2c0-11ea-9d27-805e5e90abde.png" width="48%" alt="CONTAGION CE gameplay">
</p>

## How to play

1. Press `Y=` for **New Game**.
2. Choose Bacteria, Virus, or Fungus.
3. Name your disease.
4. Select a healthy land cell to begin the outbreak.
5. Spread through the world and earn DNA.
6. Buy transmissions, symptoms, and abilities.
7. Destroy every land cell before the cure reaches completion.

Victory requires every land cell to be dead. You lose if active infection
disappears while healthy land remains or if the cure reaches completion.

## Controls

| Screen | Controls |
|---|---|
| Main menu | `Y=` New Game · `Zoom` Start/Continue · `Graph` or `Clear` Save and Quit |
| World map | Arrow keys select regions · `Enter` opens details · `Mode` changes transportation view · `Graph` opens evolution |
| Evolution | `Y=` / `Window` switch categories · Arrow keys move between connected nodes · `Enter` opens details |
| Trait details | `Enter` purchases · `Del` devolves eligible symptom leaves |
| Fungus abilities | `Zoom` opens the spore menu |
| Menus | `Graph` or `Clear` goes back |

Release each key before pressing another key.

## Saving

Games use the `CNTGN2` save format with a validated recovery copy named
`CNTGN2B`. Saves preserve your disease, DNA, traits, map state, transportation,
and current cycle position.

Version-1 `CNTGNDAT` saves remain untouched but cannot continue under the new
rules.

## Installation

1. Download and unzip [CONTAGION CE 2.0](bin/CONTAGION-CE-2.0.zip). (Found at bin/CONTAGION-CE-2.0.zip)
2. Transfer `CNTAGION.8xp` and all four `.8xv` libraries with TI Connect CE.
3. Launch `CNTAGION` through arTIfiCE or another native-program shell.
4. Start a new game with `Y=`.

See [TRANSFER.md](TRANSFER.md) for calculator-specific instructions.

## Credits

Original project, game design, and graphics:

**epsilon5** and **EverydayCode**

Graphics support:

**OPTIX**, by epsilon5

Runtime libraries:

**CE-Programming contributors**

Current repository maintainer:

**datguycodesabit**

The game source does not currently declare a separate open-source license.
The included runtime libraries retain their own license terms.

## Links

- [Cemetech archive entry](https://www.cemetech.net/downloads/files/2022/x2078)
- [Cemetech project thread](https://www.cemetech.net/forum/viewtopic.php?t=16753)
- [TI-84 Plus CE assembly games](https://www.ticalc.org/pub/84plusce/asm/games/)
- [arTIfiCE](https://yvantt.github.io/arTIfiCE/)
- [TI Connect CE](https://education.ti.com/en/products/computer-software/ti-connect-ce-sw)
