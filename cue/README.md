# cue/

This directory holds the contract surface for `microbash`.

It is not a replacement runtime. Its job is to make the learning planes explicit,
machine-readable, and exportable.

Current contents:

- `planes/plane_schema.cue`: base contract vocabulary
- `planes/bash_surface.cue`: helper inventory and Bash runtime ownership
- `planes/tooling_surface.cue`: tooling coverage and rough equivalence matrix
- `examples/learning_track.cue`: a small learning-oriented projection

Suggested commands:

```bash
cue fmt --files cue
cue vet ./cue/...
cue export ./cue/planes:microbash -e tooling --out yaml
```
