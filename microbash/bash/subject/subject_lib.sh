#!/usr/bin/env bash
# shellcheck shell=bash

subject_emit_line() {
  out_line "${1-hello}"
}

subject_fail_contextually() {
  ctrl_fail 23 "contextual failure"
}

subject_local_write() {
  state_local_set LOCAL_VALUE "alpha"
  out_line "local write attempted"
}
