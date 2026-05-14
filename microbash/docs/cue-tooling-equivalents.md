# CUE tooling equivalents

CUE does not need exact one-for-one clones of Bash tooling because it does not
inherit Bash's word splitting and globbing model. The closest matches are by role.

## Rough equivalence matrix

| Shell tool | Primary role | Closest CUE analogue | Notes |
| --- | --- | --- | --- |
| ShellCheck | static analysis / semantic warnings | `cue vet` plus evaluator errors | Validates data/schema conformance, not shell-style lint guidance |
| Shellharden | semi-automatic safer rewrites | `cue fix` | Migrates syntax and APIs; not a safety hardener in the shell sense |
| shfmt | canonical formatter | `cue fmt` | Standard formatting |

## Important differences

### `cue fmt`
This is the direct equivalent to `shfmt` in role.
It standardizes layout, simplifies review, and is appropriate as a CI gate.

### `cue vet`
This is only a partial equivalent to `shellcheck`.
It validates CUE and non-CUE data against schemas and concreteness rules.
It does not act like an advisory style linter for everyday CUE authoring.

### `cue fix`
This is only a partial equivalent to `shellharden`.
It rewrites older syntax and APIs to newer standards and can apply experimental migrations.
It is not a semantic hardener for quoting or data-channel safety because those hazards are not central in CUE.

### `cue export`
This has no close shell analogue.
It is a projection step: turn validated constraints into concrete JSON, YAML, TOML, CUE, or text.

### `cue trim`
This also has no close shell analogue.
It removes values that are implied by constraints so the concrete surface stays minimal.

## Practical posture

Use this combination:

- `cue fmt` for format gates
- `cue vet` for validation gates
- `cue fix` during upgrades and experimental migrations
- `cue export` as the projection boundary into Bash or other tools
