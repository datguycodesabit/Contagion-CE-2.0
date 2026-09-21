#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
output_dir=$(mktemp -d "${TMPDIR:-/tmp}/contagion-tests.XXXXXX")
trap 'rm -rf "$output_dir"' EXIT HUP INT TERM
test_source=${1:-test_rules}
case "$test_source" in test_rules|balance) ;; *) echo "Use test_rules or balance" >&2; exit 2;; esac
if [ "$#" -gt 0 ]; then shift; fi
${CC:-clang} -std=c99 -g -O1 -Wall -Wextra -Werror -pedantic \
  -fsanitize=address,undefined -fno-omit-frame-pointer \
  -Isrc "tests/host/$test_source.c" src/disease.c src/traits.c src/world.c src/savecodec.c \
  src/sprites/africa.c src/sprites/asia.c src/sprites/europe.c src/sprites/greenland.c \
  src/sprites/northamerica.c src/sprites/southamerica.c src/sprites/oceania.c \
  -o "$output_dir/test_rules"
"$output_dir/test_rules" "$@"
