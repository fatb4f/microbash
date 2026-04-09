# bash/

This directory is the shell runtime for `microbash`.

It contains the small Bash foundation under test:

- `probe.sh`: structured event emission for shell-side evidence
- `init.sh`: bootstrap that sources the probe and helper families
- `helpers/`: thin wrapper functions around sharp Bash behaviors
- `subject/`: tiny subject functions used to exercise those helpers
- `runner/`: scenario entrypoints that execute subjects deliberately

`microbash` is not trying to be a full shell framework here. The point of this tree is to keep the Bash side small, explicit, and easy to reason about.

## Load order

[`init.sh`](/home/chronos/.local/share/src/bash/microbash/bash/init.sh) is the entrypoint for most shell-side use. It loads:

1. the probe
2. context helpers
3. control helpers
4. output helpers
5. argv helpers
6. state helpers
7. word helpers
8. file helpers

That gives specs and runner scripts one stable bootstrap instead of hand-sourcing individual files.

## Design constraints

- Bash stays the runtime authority.
- Helpers should sharpen Bash semantics, not hide them.
- Subjects should stay tiny and stimulus-oriented.
- The runner should execute scenarios, not perform analysis.
- Probe output should make important shell effects visible without turning every helper into a framework.

If a behavior needs orchestration, UI, or app-specific policy, it belongs above this layer.
