# CEmu development workflow

CEmu is CONTAGION CE's primary development and regression environment. A real
TI-84 Plus CE or TI-83 Premium CE remains the final authority for timing,
keypad feel, hardware timers, memory behavior, and release verification.

## Existing calculator build

The root Makefile sets `NAME ?= CNTAGION` and includes the CE C/C++ Toolchain's
standard makefile. With the default toolchain settings, `make` compiles the C
sources with size optimization, links a native eZ80 program, and packages:

```text
bin/CNTAGION.8xp
```

This is a calculator program, not a desktop executable. The build does not
produce a game AppVar; `CNTGN2` (primary), `CNTGN2T` (temporary), and `CNTGN2B`
(backup) are managed at runtime by FileIOC. Old `CNTGNDAT` runs remain untouched.
See [the save format](../../SAVE_FORMAT.md).
The `obj/` and `bin/` directories are generated and ignored by Git.

## Setup

1. Install the [CE C/C++ Toolchain](https://github.com/CE-Programming/toolchain).
2. Install [CEmu](https://github.com/CE-Programming/CEmu/releases).
3. Use CEmu's ROM dump wizard to obtain firmware from your own calculator.
   Do not download or commit TI firmware.
4. Start CEmu once and complete its ROM/settings setup.
5. Ensure `CEDEV` points to the toolchain installation and its `bin` directory
   is on PATH. Both the legacy makefile layout and CE Toolchain v15 are supported.

## Build and launch

The normal production build is unchanged:

```sh
make
```

Build the same calculator program, transfer it to archive, and launch it in the
configured CEmu instance with:

```sh
make test-cemu
```

The target uses CEmu's current Qt command-line options:

```text
--send-arch bin/CNTAGION.8xp --launch CNTAGION
```

No ROM argument is supplied. CEmu continues to use the ROM and settings the
developer configured locally. Automatic transfer and program launch are
supported by current CEmu releases; ROM acquisition and initial emulator setup
remain manual.

If CEmu is not on `PATH`, set `CEMU` to its executable:

```sh
# macOS
make test-cemu CEMU=/Applications/CEmu.app/Contents/MacOS/CEmu

# Linux
make test-cemu CEMU=CEmu

# Windows (cmd.exe; quote the assignment when the path contains spaces)
make test-cemu "CEMU=C:/Program Files/CEmu/CEmu.exe"
```

If a CEmu version does not recognize `--send-arch` and `--launch`, check
`CEmu --help` and update CEmu. Do not compensate by changing calculator code.

## Normal development loop

1. Change calculator code.
2. Run `make` with the CE Toolchain.
3. Run `make test-cemu`.
4. Execute [smoke-test.md](smoke-test.md), concentrating on the changed area.
5. Run `make test-host` for shared arithmetic, trait, world, navigation, and save
   checks. Fix regressions and repeat affected build/CEmu checks.
6. Before release, transfer that same `.8xp` to a real calculator and perform
   final hardware verification.

Emulator speed is not evidence of calculator performance. Never rebalance the
simulation or change its render-coupled cadence based solely on CEmu speed.

## CEmu autotester preparation

The CE Toolchain distributes `cemu-autotester`. Its documented invocation is:

```sh
AUTOTESTER_ROM=/legal/path/to/your/rom.rom \
  cemu-autotester tests/cemu/autotests/test-name.json
```

Autotest JSON supplies `transfer_files`, a target program name and `isASM`
flag, a sequence of actions/keys/delays, and named CRC32 memory hashes. Useful
commands include `action|launch`, `delay|milliseconds`, `key|name`,
`keys|...`, `hash|name`, and `hashWait|name`. See
[autotests/README.md](autotests/README.md) for the deliberately small initial
framework and its baseline policy.

Do not store ROMs, emulator states, exported AppVars, screenshots, or logs in
version control. If local artifacts must live under this tree, place them in
`tests/cemu/local/` or `tests/cemu/artifacts/`; both are ignored.

## Current local verification status

The v2 native program and the captured stabilized baseline were both built with
CE Toolchain v15.0. The bundled headless `cemu-autotester` executable is present,
but a GUI CEmu executable was not found on PATH or in the checked application
locations. Existing preferences reference a missing `cemu_image.ce`; no
`AUTOTESTER_ROM` is configured. `make test-cemu` therefore stops with its missing
CEmu diagnostic. No emulator or hardware gameplay checks are claimed. Do not
substitute downloaded firmware. See [VERIFICATION.md](../../VERIFICATION.md) for
the exact artifact, measured resource changes, host evidence, and release gates.
