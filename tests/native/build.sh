#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
# Keep the actual game and its artifacts untouched. Same calculator program
# name allows the isolated emulator's verified launch sequence to be reused.
make SRCDIR=tests/native OBJDIR=tests/cemu/artifacts/native-obj \
 BINDIR=tests/cemu/artifacts/native-bin OUTPUT_MAP=YES \
 EXTRA_C_SOURCES="src/disease.c src/evolution.c src/persistence.c src/savecodec.c src/traits.c src/world.c src/ticker.c src/ticker_draw.c $(printf '%s ' src/sprites/*.c)"
