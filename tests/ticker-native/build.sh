#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
make SRCDIR=tests/ticker-native OBJDIR=tests/cemu/artifacts/ticker-obj \
 BINDIR=tests/cemu/artifacts/ticker-bin OUTPUT_MAP=YES \
 EXTRA_C_SOURCES="src/disease.c src/evolution.c src/persistence.c src/savecodec.c src/traits.c src/world.c src/ticker.c src/ticker_draw.c $(printf '%s ' src/sprites/*.c)"
