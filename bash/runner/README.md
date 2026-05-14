# bash/runner/

This directory contains shell entrypoints that execute named scenarios.

Right now that means [`scenario_runner.sh`](/home/chronos/.local/share/src/bash/microbash/bash/runner/scenario_runner.sh), which does four things:

1. source [`bash/init.sh`](/home/chronos/.local/share/src/bash/microbash/bash/init.sh)
2. source [`subject/subject_lib.sh`](/home/chronos/.local/share/src/bash/microbash/bash/subject/subject_lib.sh)
3. emit scenario start and end probe events
4. dispatch a small set of scenario IDs to subject functions

The runner is a stimulus harness. It should stay boring.

## Responsibilities

- accept a scenario id plus optional arguments
- execute one subject path intentionally
- preserve the shell semantics of that path
- emit enough probe evidence to correlate the run later

## Non-responsibilities

- no heavy analysis
- no reporting
- no policy engine
- no application logic

If a scenario needs complex branching, the subject layer is already too large or the helper boundary is not sharp enough yet.
