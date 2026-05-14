set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

default:
  @just --list

bash-n:
  find bash specs -type f \( -name '*.sh' -o -name '*_spec.sh' \) -print0 | xargs -0 -n1 bash -n

scenario scenario_id='output.stdout.line':
  bash bash/runner/scenario_runner.sh "{{scenario_id}}"

cue-fmt:
  cue fmt --files cue

cue-vet:
  cue vet ./cue/...

cue-export-tooling:
  cue export ./cue/planes:microbash -e tooling --out yaml

dual-check:
  just bash-n
  cue fmt --check --files cue
  cue vet ./cue/...
