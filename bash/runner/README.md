# bash/runner/

This directory contains the Bash entrypoints used to execute scenario-based stimuli.

The runner is the shell-side coordinator.
It should:

- source the probe
- source the helper prototypes
- source the subject library
- dispatch scenario IDs to small subject functions
- emit scenario boundary events when appropriate

The runner is not responsible for heavy analysis.
It only executes scenarios and lets the probe emit evidence.
