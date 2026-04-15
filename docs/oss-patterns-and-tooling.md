# OSS patterns and tooling

This repo centers on the Bash planes that most often fail under pressure.
The community pattern is usually to reduce exposure to the shell word plane
rather than become increasingly clever inside it.

## Plane-by-plane patterns

### context plane
Patterns:
- explicit `source` bootstrap files
- thin runner scripts
- side-effect-free probes

Tools:
- `shellcheck` catches some sourcing and control mistakes
- `shfmt` keeps control structures readable

### control plane
Patterns:
- wrap `return` vs `exit`
- centralize fatal-path emission
- keep trap behavior small and reviewable

Tools:
- `shellcheck` covers unreachable logic, quoting mistakes, and several footguns
- `shfmt` improves reviewability, not semantics
- `shellharden` can move code toward safer idioms

### output plane
Patterns:
- separate stdout data from stderr diagnostics
- keep data channels parseable
- prefer line-oriented output helpers

Tools:
- `shellcheck` catches some unsafe `echo` and expansion patterns
- `shfmt` only formats
- `shellharden` helps with quoting on emission paths

### args plane
Patterns:
- preserve argv in arrays
- refuse scalar fallback for array capture
- use `"$@"` / `"${array[@]}"`, not interpolated command strings

Tools:
- `shellcheck` has strong coverage here
- `shellharden` is especially useful here
- `shfmt` helps code stay inspectable

### state plane
Patterns:
- explicit local/global/export helpers
- option push/pop stacks
- side effects recorded by probe events

Tools:
- `shellcheck` catches many accidental globals and expansion errors
- no formatter can prove state discipline
- CUE can model the allowed state transitions as contracts

### words plane
Patterns:
- arrays for argv
- NUL-delimited workflows for filenames
- delegate joins, filters, and set logic to jq/CUE/Python when structure matters
- exact element membership helpers instead of regex or substring guesses

Tools:
- `shellcheck`: strongest static coverage for quoting/splitting hazards
- `shellharden`: best available rewrite-oriented helper for quoting hardening
- `shfmt`: syntax-preserving formatter only

### file plane
Patterns:
- guarded sourcing
- existence checks before source
- freshness checks delegated to purpose-built tools if policy gets richer

Tools:
- `shellcheck` helps with dynamic sourcing warnings
- `shfmt` helps review dynamic-source call sites
- CUE is better for declaring freshness policy than executing it

## Cue-centric alternatives

When the shell plane gets too string-heavy, move structure up:

- use `cue vet` to validate incoming YAML/JSON instead of shell regex checks
- use `cue export` to generate concrete JSON/YAML/text for downstream scripts
- use `cue trim` to remove redundant values after policy/default application
- use `cue fix` when evolving syntax or experiments across a repo
- keep Bash as the last-mile runner, not the main data-shaping engine

## Recommended split

- Bash: process control, exit status, environment handoff, small probes
- CUE: contracts, defaults, admissibility, export projections
- jq/Python: heavy transforms when text streams stop being sufficient
