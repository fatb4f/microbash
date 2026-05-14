# bash/helpers/

This directory contains the `microbash` foundation helpers.

These are thin shell wrappers, not a convenience framework. Each file owns one semantic area:

- [`context.sh`](/home/chronos/.local/share/src/bash/microbash/bash/helpers/context.sh): sourced vs executed checks and stream/context detection
- [`control.sh`](/home/chronos/.local/share/src/bash/microbash/bash/helpers/control.sh): return, exit, and context-aware failure signaling
- [`output.sh`](/home/chronos/.local/share/src/bash/microbash/bash/helpers/output.sh): stdout data vs stderr diagnostics
- [`args.sh`](/home/chronos/.local/share/src/bash/microbash/bash/helpers/args.sh): argv count checks and argument extraction
- [`state.sh`](/home/chronos/.local/share/src/bash/microbash/bash/helpers/state.sh): explicit local/global/export writes and shell-option stack handling
- [`words.sh`](/home/chronos/.local/share/src/bash/microbash/bash/helpers/words.sh): scalar, array, emptiness, and join behavior
- [`file.sh`](/home/chronos/.local/share/src/bash/microbash/bash/helpers/file.sh): minimal file predicates and guarded sourcing

## What belongs here

- wrappers around real Bash behavior
- explicit side effects
- small, composable functions
- probe-backed intent when the helper crosses a meaningful semantic edge

## What does not belong here

- UI formatting
- retries and orchestration flows
- app-specific workflow helpers
- vague “do everything” wrappers

Good helper names should tell you what kind of shell effect they perform. If a helper hides scope, control flow, or word semantics, it is too broad for this layer.
