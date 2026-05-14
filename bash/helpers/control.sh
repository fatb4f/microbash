#!/usr/bin/env bash
# shellcheck shell=bash

ctrl_return() {
  local status="$1"
  local msg="${2-}"
  probe_return "$status" "$msg"
}

ctrl_exit() {
  local status="$1"
  local msg="${2-}"
  probe_exit "$status" "$msg"
}

ctrl_fail() {
  local status="$1"
  local msg="${2-}"
  if ctx_can_return; then
    ctrl_return "$status" "$msg"
  else
    ctrl_exit "$status" "$msg"
  fi
}

ctrl_die() {
  local status="${1:-1}"
  shift || true
  local msg="${*:-fatal error}"
  err_line "$msg"
  ctrl_fail "$status" "$msg"
}
