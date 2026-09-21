# CONTAGION CE 2.0 — transfer and play

For TI-84 Plus CE, OS 5.7.0.0021, with arTIfiCE already installed.

## Install

1. Unzip CONTAGION-CE-2.0.zip on your computer.
2. Connect the calculator by USB and open TI Connect CE's Calculator Explorer.
3. Send CNTAGION.8xp and all four .8xv files in this package to the calculator.
   Choose Archive for these files. The .8xv files are runtime libraries, not games.
   If newer working CE libraries are already installed, keep the newer versions.
4. Open your existing arTIfiCE launcher and select CNTAGION. With arTIfiCE v2,
   run program A to open the launcher. With an existing v1 setup, use its usual
   Cabri Jr. launcher, or your already-installed shell. No OS update is required.
5. Press Y= for New Game, Enter for Bacteria, Zoom to accept the default name,
   then Enter to seed the initial land location.

Missing-library errors mean one of the four .8xv files was not transferred.
ERR:INVALID from the normal program menu means you should use arTIfiCE or your
installed native-program shell to launch CNTAGION.

## Controls

- World: Graph opens evolution; Enter opens paused region details; arrows select
  regions; Mode changes travel view; Clear saves and returns to the main menu.
- Evolution: Y=/Window switch category, arrows select a node, Enter opens its
  details, then Enter purchases. Del devolves eligible symptom leaves for DNA.
- Graph/Clear returns from a panel. Release each key before pressing it again.
- Fungus: on the Abilities page, Zoom opens the three paid spore bursts.
- Main menu: Zoom continues; Graph/Clear saves and quits to the launcher/OS.

Spread quietly first, then buy lethal symptoms once the world is infected.
Victory requires every land cell to be dead before the cure is completed.
Virus mutates symptoms; Fungus can seed distant regions with spores.

## Saves

CNTGN2 stores your run; CNTGN2B is the recovery copy. Both are created by the game.
The game needs RAM for its working data and up to about 33 KB for three save
copies during replacement. Saves remain in RAM unless you archive them yourself.
Back up important calculator files before transferring or clearing memory.
If saving fails, your previous validated save is retained. Free RAM by archiving
unrelated files through TI-OS, then retry. Do not delete your only saved copy.
A RAM reset can erase unarchived saves. Old CNTGNDAT saves remain untouched and
cannot continue as version-2 runs.

## First check on your calculator

Start Bacteria, open and close region details, then buy Water I in evolution.
Let the map advance, press Clear to save, and Clear again to quit. Relaunch
CNTAGION, press Zoom, and confirm the purchase and outbreak remain. Check that
controls respond normally and that saving produces no error. Then play a full
run before treating this as a hardware-verified release.

This build passed native emulator playthroughs for all three diseases and host
rule/codec tests. Emulator coverage uses TI-OS 5.3, not your physical OS 5.7 device.
Physical performance, OS 5.7 execution and real power-loss behavior remain to be
verified. No ROM, firmware, test fixture or emulator is included in this ZIP.

## Sources and credits

TI Connect CE: https://education.ti.com/en/products/computer-software/ti-connect-ce-sw
arTIfiCE instructions/compatibility: https://yvantt.github.io/arTIfiCE/
Official CE libraries v15.0: https://github.com/CE-Programming/libraries/releases/tag/v15.0
CE library documentation: https://ce-programming.github.io/toolchain/v14.1/libraries/index.html

Original game and map graphics: epsilon5 / EverydayCode.
CE runtime libraries: Matthew Waltz and CE-Programming contributors.
Their license notice is included as CE-LIBRARIES-LICENSE.txt.
