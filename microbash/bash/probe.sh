#!/usr/bin/env bash
# shellcheck shell=bash

# Probe substrate skeleton.
# This file intentionally stays minimal.
# It defines event emission shape and a few placeholder helpers.

: "${PROBE_SESSION_ID:=dev-session}"
: "${PROBE_OUT:=/tmp/bash-workbench-probe.jsonl}"

PROBE_SEQ=0

__probe_now() {
  printf '%(%Y-%m-%dT%H:%M:%S%z)T' -1
}

__probe_json_escape() {
  local s=${1-}
  s=${s//\\/\\\\}
  s=${s//\"/\\\"}
  s=${s//$'\n'/\\n}
  s=${s//$'\r'/\\r}
  s=${s//$'\t'/\\t}
  printf '%s' "$s"
}

__probe_emit() {
  local surface="$1"
  local kind="$2"
  local payload="${3:-{}}"
  PROBE_SEQ=$((PROBE_SEQ + 1))

  printf '{"ts":"%s","sid":"%s","seq":%d,"surface":"%s","kind":"%s","payload":%s}\n' \
    "$(__probe_now)" \
    "$(__probe_json_escape "$PROBE_SESSION_ID")" \
    "$PROBE_SEQ" \
    "$(__probe_json_escape "$surface")" \
    "$(__probe_json_escape "$kind")" \
    "$payload" >> "$PROBE_OUT"
}

probe_bootstrap() {
  : > "$PROBE_OUT"
  __probe_emit "invocation" "invocation.start" "{\"entry\":\"$(__probe_json_escape "$0")\"}"
}

probe_invocation_init() {
  local mode="executed"
  if [[ "${BASH_SOURCE[1]:-}" != "${0:-}" ]]; then
    mode="sourced"
  fi
  __probe_emit "invocation" "invocation.mode" "{\"mode\":\"$mode\"}"
}

probe_context_enter() {
  local context_type="$1"
  __probe_emit "context" "context.enter" "{\"type\":\"$(__probe_json_escape "$context_type")\"}"
}

probe_context_exit() {
  local context_type="$1"
  __probe_emit "context" "context.exit" "{\"type\":\"$(__probe_json_escape "$context_type")\"}"
}

probe_word_scalar() {
  local value="${1-}"
  __probe_emit "word" "word.scalar" "{\"value\":\"$(__probe_json_escape "$value")\"}"
}

probe_word_array() {
  local name="$1"
  shift || true
  __probe_emit "word" "word.array" "{\"name\":\"$(__probe_json_escape "$name")\",\"count\":$#}"
}

probe_stdout_data() {
  local value="${1-}"
  __probe_emit "stream" "stream.stdout.intent" "{\"kind\":\"data\",\"value\":\"$(__probe_json_escape "$value")\"}"
}

probe_stderr_diag() {
  local value="${1-}"
  __probe_emit "stream" "stream.stderr.intent" "{\"kind\":\"diagnostic\",\"value\":\"$(__probe_json_escape "$value")\"}"
}

probe_return() {
  local status="$1"
  local msg="${2-}"
  __probe_emit "control" "control.return" "{\"status\":${status},\"message\":\"$(__probe_json_escape "$msg")\"}"
  return "$status"
}

probe_exit() {
  local status="$1"
  local msg="${2-}"
  __probe_emit "control" "control.exit" "{\"status\":${status},\"message\":\"$(__probe_json_escape "$msg")\"}"
  exit "$status"
}
