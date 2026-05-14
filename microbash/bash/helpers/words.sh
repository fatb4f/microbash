#!/usr/bin/env bash
# shellcheck shell=bash

word_scalar() {
  local value="${1-}"
  probe_word_scalar "$value"
  printf '%s' "$value"
}

word_array() {
  local name="$1"
  shift || true
  probe_word_array "$name" "$@"
}

word_is_set() {
  local var_name="${1:-}"
  [[ -n "$var_name" && ${!var_name+x} ]]
}

word_is_empty() {
  [[ -z "${1-}" ]]
}

word_join() {
  local sep="${1-}"
  shift || true

  local first=true
  local elem
  for elem in "$@"; do
    if ! $first; then
      printf '%s' "$sep"
    fi
    printf '%s' "$elem"
    first=false
  done
}

word_join_lines() {
  printf '%s\n' "$@"
}

word_array_contains() {
  local needle="${1-}"
  shift || true

  local elem
  for elem in "$@"; do
    [[ "$elem" == "$needle" ]] && return 0
  done
  return 1
}


word_require_nonempty() {
  local value="${1-}"
  local label="${2:-value}"
  if [[ -z "$value" ]]; then
    err_line "$label must not be empty"
    return 64
  fi
  return 0
}
