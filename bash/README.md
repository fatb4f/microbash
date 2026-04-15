# bash/

This directory is the shell runtime for `microbash`.

It contains the small Bash foundation under test:

- `version.sh`: Bash version floor guard for the runtime tree
- `probe.sh`: structured event emission for shell-side evidence
- `init.sh`: bootstrap that sources the probe and helper families
- `helpers/`: thin wrapper functions around sharp Bash behaviors
- `subject/`: tiny subject functions used to exercise those helpers
- `runner/`: scenario entrypoints that execute subjects deliberately

`microbash` is not trying to be a full shell framework here. The point of this tree is to keep the Bash side small, explicit, and easy to reason about.

The tree is written against Bash 5.x, with an explicit 5.2+ runtime floor and no 5.3-only syntax requirements.

## Load order

[`init.sh`](/home/chronos/.local/share/src/bash/microbash/bash/init.sh) is the entrypoint for most shell-side use. It loads:

1. the version floor guard
2. the probe
3. context helpers
4. control helpers
5. output helpers
6. argv helpers
7. state helpers
8. word helpers
9. file helpers

That gives specs and runner scripts one stable bootstrap instead of hand-sourcing individual files.

## Design constraints

- Bash stays the runtime authority.
- Helpers should sharpen Bash semantics, not hide them.
- Subjects should stay tiny and stimulus-oriented.
- The runner should execute scenarios, not perform analysis.
- Probe output should make important shell effects visible without turning every helper into a framework.

If a behavior needs orchestration, UI, or app-specific policy, it belongs above this layer.
