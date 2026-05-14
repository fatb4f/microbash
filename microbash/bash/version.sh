#!/usr/bin/env bash
# shellcheck shell=bash

bash_require_min_version() {
  local required_major="${1:?}"
  local required_minor="${2:?}"

  local major="${BASH_VERSINFO[0]:-0}"
  local minor="${BASH_VERSINFO[1]:-0}"

  if (( major < required_major || (major == required_major && minor < required_minor) )); then
    printf 'microbash requires Bash %s.%s or newer (found %s.%s)\n' \
      "$required_major" "$required_minor" "$major" "$minor" >&2
    return 2
  fi
}
