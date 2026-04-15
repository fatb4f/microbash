# microbash

`microbash` is a small Bash 5.3 learning workbench organized as an **integrated dual-surface**:

- **Bash surface**: runtime helpers, subjects, and specs that exercise sharp shell behavior directly.
- **CUE surface**: machine-readable contracts that describe planes, helper ownership, tooling coverage, and learning-oriented invariants.

The design goal is to keep Bash as the runtime authority while using CUE as the contract and projection surface.

## Why dual-surface?

Bash has a set of semantic planes that learners repeatedly trip over:

- context: sourced vs executed, stdin/stdout state
- control: return vs exit
- output: stdout data vs stderr diagnostics
- args: scalar vs argv capture
- state: local/global/export and option stacks
- words: emptiness, joining, arrays, membership
- file: existence, guarded sourcing, freshness

The Bash side should expose these directly.
The CUE side should make the planes explicit, inspectable, and exportable.

## Repository layout

- `bash/`: runtime helpers, subjects, runner, and probe emission
- `specs/`: ShellSpec examples for the Bash surface
- `cue/`: CUE contracts for planes, helper inventory, and tooling coverage
- `cue.mod/`: CUE module metadata
- `docs/`: learning notes, OSS patterns, and tooling matrices
- `reference/`: external snippets and comparative material
- `justfile`: one command surface across Bash and CUE workflows

## Suggested learning loop

1. Read the plane contract in `cue/planes/`.
2. Inspect the corresponding helper in `bash/helpers/`.
3. Run or extend the ShellSpec example under `specs/`.
4. Export or inspect the CUE surface to keep the taxonomy explicit.

## Bash surface

Entry point:

```bash
source bash/init.sh
```

Scenario runner:

```bash
bash bash/runner/scenario_runner.sh output.stdout.line
```

Syntax check all Bash files:

```bash
just bash-n
```

## CUE surface

Format and validate the CUE contracts when `cue` is installed:

```bash
just cue-fmt
just cue-vet
just cue-export-tooling
```

## Tooling posture

Bash:
- `shellcheck`: static analysis and semantic warnings
- `shellharden`: rewrite assistance, mainly around quoting and safer idioms
- `shfmt`: parser-backed formatting

CUE:
- `cue fmt`: canonical formatting
- `cue vet`: schema/data validation
- `cue fix`: syntax and API migration rewrites
- `cue export`: surface projection for other tools

See:
- `docs/dual-surface-design.md`
- `docs/oss-patterns-and-tooling.md`
- `docs/cue-tooling-equivalents.md`
