# specs/

This directory contains the ShellSpec baseline for `microbash`.

The spec suite checks the shell-side foundation directly. It is the fixed example lane for behaviors that should remain stable while the helper layer evolves.

Current specs cover:

- [`args_spec.sh`](/home/chronos/.local/share/src/bash/microbash/specs/args_spec.sh)
- [`control_spec.sh`](/home/chronos/.local/share/src/bash/microbash/specs/control_spec.sh)
- [`output_spec.sh`](/home/chronos/.local/share/src/bash/microbash/specs/output_spec.sh)
- [`state_spec.sh`](/home/chronos/.local/share/src/bash/microbash/specs/state_spec.sh)
- [`words_spec.sh`](/home/chronos/.local/share/src/bash/microbash/specs/words_spec.sh)

All specs source [`bash/init.sh`](/home/chronos/.local/share/src/bash/microbash/bash/init.sh), so they exercise the same bootstrap path the runner uses.

## What these specs should prove

- stdout vs stderr separation
- return vs exit behavior
- local vs global state discipline
- small helper contracts that must not drift

## What these specs should not become

- a second framework
- long integration scripts
- broad workflow demos

ShellSpec is most useful here when each example stays small, direct, and semantically specific.
