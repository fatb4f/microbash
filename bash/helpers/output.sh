#!/usr/bin/env bash
# shellcheck shell=bash

out_line() {
  local value="${1-}"
  probe_stdout_data "$value"
  printf '%s\n' "$value"
}

err_line() {
  local value="${1-}"
  probe_stderr_diag "$value"
  printf '%s\n' "$value" >&2
}

out_puts() {
  local first=true
  local value
  for value in "$@"; do
    if ! $first; then
      printf ' '
    fi
    probe_stdout_data "$value"
    printf '%s' "$value"
    first=false
  done
}

err_puts() {
  local first=true
  local value
  for value in "$@"; do
    if ! $first; then
      printf ' ' >&2
    fi
    probe_stderr_diag "$value"
    printf '%s' "$value" >&2
    first=false
  done
}
