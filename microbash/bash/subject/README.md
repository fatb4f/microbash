# bash/subject/

This directory contains tiny subject functions used to exercise the `microbash` foundation.

The current subject library lives in [`subject_lib.sh`](/home/chronos/.local/share/src/bash/microbash/bash/subject/subject_lib.sh). These functions are intentionally small and exist to trigger specific helper behavior under controlled conditions.

Current subjects cover:

- stdout emission
- context-aware failure signaling
- local state mutation

## Purpose

Subjects are not public helpers and not application code. They are shell stimuli used by:

- the scenario runner
- ShellSpec examples
- ad hoc shell testing while the foundation evolves

## Rules

- keep functions short
- prefer one sharp behavior per function
- call the foundation helpers directly
- avoid unrelated branching or workflow logic

When a subject starts looking like a reusable helper, move that logic into `helpers/`. When it starts looking like a script, it belongs outside this tree.
