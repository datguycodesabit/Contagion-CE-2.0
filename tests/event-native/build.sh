#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
make SRCDIR=tests/event-native OBJDIR=tests/cemu/artifacts/event-obj \
 BINDIR=tests/cemu/artifacts/event-bin OUTPUT_MAP=YES \
 EXTRA_C_SOURCES="src/disease.c src/evolution.c src/persistence.c src/savecodec.c src/traits.c src/world.c src/ticker.c src/ticker_draw.c src/events.c src/event_catalog.c src/event_ui.c $(printf '%s ' src/sprites/*.c)"
