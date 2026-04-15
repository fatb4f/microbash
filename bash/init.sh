#!/usr/bin/env bash
# shellcheck shell=bash

MICROBASH_BASH_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=./version.sh
source "$MICROBASH_BASH_DIR/version.sh"
if ! bash_require_min_version 5 2; then
  return 2
fi

# shellcheck source=./probe.sh
source "$MICROBASH_BASH_DIR/probe.sh"
# shellcheck source=./helpers/context.sh
source "$MICROBASH_BASH_DIR/helpers/context.sh"
# shellcheck source=./helpers/control.sh
source "$MICROBASH_BASH_DIR/helpers/control.sh"
# shellcheck source=./helpers/output.sh
source "$MICROBASH_BASH_DIR/helpers/output.sh"
# shellcheck source=./helpers/args.sh
source "$MICROBASH_BASH_DIR/helpers/args.sh"
# shellcheck source=./helpers/state.sh
source "$MICROBASH_BASH_DIR/helpers/state.sh"
# shellcheck source=./helpers/words.sh
source "$MICROBASH_BASH_DIR/helpers/words.sh"
# shellcheck source=./helpers/file.sh
source "$MICROBASH_BASH_DIR/helpers/file.sh"
