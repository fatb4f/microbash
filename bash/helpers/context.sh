#!/usr/bin/env bash
# shellcheck shell=bash

ctx_is_sourced() {
  [[ "${BASH_SOURCE[${#BASH_SOURCE[@]}-1]:-}" != "${0:-}" ]]
}

ctx_is_pipe_stdout() {
  [[ -p /dev/stdout ]]
}

ctx_is_stdout_redirected() {
  [[ ! -t 1 && ! -p /dev/stdout ]]
}

ctx_has_stdin() {
  [[ ! -t 0 ]]
}

ctx_can_return() {
  ctx_is_sourced
}

ctx_can_exit() {
  ! ctx_is_sourced
}
