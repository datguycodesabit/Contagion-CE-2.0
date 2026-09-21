# CEmu autotester regression framework

This directory is reserved for small deterministic CEmu autotester JSON tests.
No pass/fail JSON is committed yet: the native v2 program now builds with CE Toolchain v15 and the bundled headless
autotester is available, but no legally supplied ROM or configured GUI CEmu
is available. A trustworthy framebuffer CRC cannot be generated or verified. A test with a guessed CRC—or a script that runs
zero hash assertions—would report misleading success.

## Supported format

Each JSON configuration must contain:

- `rom`: a local ROM path, normally overridden with `AUTOTESTER_ROM`;
- `transfer_files`: usually `../../../bin/CNTAGION.8xp` from this directory;
- `target`: `{ "name": "CNTAGION", "isASM": false }`;
- `sequence`: commands such as `action|launch`, `delay|1000`, `key|graph`,
  `keys|down,delay:100,graph`, and `hashWait|main_menu`;
- `hashes`: named address/size/expected-CRC definitions.

The upstream format also provides named hash regions including `vram_start`,
`vram_8_size`, `ram_start`, and `ram_size`. Prefer stable framebuffer or narrow
state hashes. Avoid screenshot-coordinate automation.

## Adding the first baseline

1. Build the exact calculator program with `make`.
2. Use a documented CEmu release and ROM/OS version.
3. Create `boot-menu.json` that transfers `../../../bin/CNTAGION.8xp`, launches
   `CNTAGION`, waits for the main menu, and hashes the 8-bpp framebuffer.
4. Run the test initially with `cemu-autotester -d` to obtain and inspect the
   actual CRC. Do not accept a CRC until the displayed state is manually verified.
5. Commit the verified CRC with the CEmu and ROM/OS baseline documented beside it.
6. Add mutation-input and save/reload tests only when their end states can be
   asserted with stable hashes or exported variable contents.

Run a committed test with:

```sh
make
AUTOTESTER_ROM=/legal/path/to/your/rom.rom \
  cemu-autotester tests/cemu/autotests/boot-menu.json
```

The GUI can also load a JSON test with `CEmu --auto-test <file>`, but the
standalone runner is preferred for regression exit codes. Firmware is always a
developer-owned local prerequisite and must never be committed.

## Runtime follow-up

A user-authorized local ROM and ti84ce's bundled CEmu WASM reference core are now
available. `tests/ti84ce/smoke.mjs` supplies the first visually verified framebuffer
assertions for save/relaunch/continue; see that directory's README. The absence of
JSON baselines here no longer means that all native runtime verification is blocked.
