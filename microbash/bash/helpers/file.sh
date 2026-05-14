#!/usr/bin/env bash
# shellcheck shell=bash

file_exists() {
  [[ -f "${1:-}" ]]
}

file_source_if_exists() {
  local file
  for file in "$@"; do
    if [[ -f "$file" ]]; then
      __probe_emit "context" "context.source_file" \
        "{\"path\":\"$(__probe_json_escape "$file")\"}"
      # shellcheck disable=SC1090
      source "$file"
    fi
  done
}

file_is_newer_than() {
  local first="${1:-}"
  local second="${2:-}"
  [[ -n "$first" && -n "$second" ]] || return 64
  [[ "$first" -nt "$second" ]]
}

file_exists_and_newer_than() {
  local file="${1:-}"
  local minutes="${2:-}"
  [[ -n "$file" && -n "$minutes" ]] || return 64
  [[ -n "$(find "$file" -mmin "-$minutes" -print 2>/dev/null)" ]]
}
