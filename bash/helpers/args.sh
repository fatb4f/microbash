#!/usr/bin/env bash
# shellcheck shell=bash

arg_require_count() {
  local actual="$1"
  local expected_min="$2"
  local expected_max="${3:-$expected_min}"

  if (( actual < expected_min || actual > expected_max )); then
    err_line \
      "argument count violation: actual=$actual expected_min=$expected_min expected_max=$expected_max"
    return 64
  fi
  return 0
}

arg_take_scalar() {
  local value="${1-}"
  probe_word_scalar "$value"
  printf '%s' "$value"
}

arg_take_rest_array() {
  local target_name="${1:-}"
  shift || true

  if [[ -z "$target_name" ]]; then
    err_line "arg_take_rest_array requires a target variable name"
    return 64
  fi

  probe_word_array "$target_name" "$@"

  if declare -p "$target_name" >/dev/null 2>&1; then
    local -n target_ref="$target_name"
    target_ref=("$@")
  else
    printf -v "$target_name" '%s' "$*"
  fi
}
