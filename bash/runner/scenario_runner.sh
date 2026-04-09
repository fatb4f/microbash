#!/usr/bin/env bash
# shellcheck shell=bash
set -u

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd -- "$SCRIPT_DIR/../.." && pwd)"

# shellcheck source=../init.sh
source "$ROOT_DIR/bash/init.sh"
# shellcheck source=../subject/subject_lib.sh
source "$ROOT_DIR/bash/subject/subject_lib.sh"

run_scenario() {
  local scenario_id="$1"
  shift || true
  __probe_emit "context" "scenario.start" "{\"scenario_id\":\"$(__probe_json_escape "$scenario_id")\"}"

  case "$scenario_id" in
    output.stdout.line)
      subject_emit_line "${1-hello}"
      ;;
    control.return.when.sourced)
      subject_fail_contextually
      ;;
    state.local.leak.check)
      subject_local_write
      ;;
    *)
      err_line "unknown scenario: $scenario_id"
      return 64
      ;;
  esac

  local status=$?
  __probe_emit "context" "scenario.end" "{\"scenario_id\":\"$(__probe_json_escape "$scenario_id")\",\"status\":$status}"
  return "$status"
}

main() {
  probe_bootstrap
  probe_invocation_init

  local scenario_id="${1:-}"
  if [[ -z "$scenario_id" ]]; then
    err_line "usage: scenario_runner.sh <scenario_id> [args...]"
    return 64
  fi
  shift || true

  run_scenario "$scenario_id" "$@"
}

main "$@"
