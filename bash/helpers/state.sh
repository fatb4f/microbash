#!/usr/bin/env bash
# shellcheck shell=bash

declare -ag MICROBASH_SET_STACK=()

state_local_set() {
  local __name="$1"
  local __value="${2-}"
  local -n __ref="$__name"
  __ref="$__value"
  __probe_emit "state" "state.write" "{\"scope\":\"local\",\"name\":\"$(__probe_json_escape "$__name")\"}"
}

state_global_set() {
  local __name="$1"
  local __value="${2-}"
  printf -v "$__name" '%s' "$__value"
  declare -g "$__name"
  __probe_emit "state" "state.write" "{\"scope\":\"global\",\"name\":\"$(__probe_json_escape "$__name")\"}"
}

state_export_set() {
  local __name="$1"
  local __value="${2-}"
  export "$__name=$__value"
  __probe_emit "state" "state.export" "{\"name\":\"$(__probe_json_escape "$__name")\"}"
}

state_push_option() {
  local option="$1"
  local mode="+"

  [[ "$-" == *"$option"* ]] && mode="-"
  MICROBASH_SET_STACK+=("${mode}${option}")
  __probe_emit "state" "state.option_push" \
    "{\"option\":\"$(__probe_json_escape "$option")\",\"mode\":\"$mode\"}"
}

state_pop_option() {
  local option="$1"
  local len=${#MICROBASH_SET_STACK[@]}
  local last

  (( len > 0 )) || return 64
  last="${MICROBASH_SET_STACK[$((len - 1))]}"
  [[ "${last#?}" == "$option" ]] || return 64

  unset 'MICROBASH_SET_STACK[$((len - 1))]'
  set "$last"
  __probe_emit "state" "state.option_pop" \
    "{\"option\":\"$(__probe_json_escape "$option")\",\"mode\":\"${last:0:1}\"}"
}
