# bash/helpers/

This directory contains the candidate helper implementations being evaluated by the workbench.

These files are **not** a finished framework.
They are the smallest plausible semantic helper layer used to discover:

- which helper boundaries are justified
- which helpers are too broad
- which helpers fail under generated pressure

---

## Required implementation style

### 1. One dominant semantic surface per helper

A helper should have one primary surface.
If it spans too many surfaces, it should probably be split.

### 2. Wrap a real shell effect

A helper should perform a meaningful shell operation and, where appropriate, emit probe-backed intent.

### 3. No generic convenience wrappers

Avoid vague helpers such as `emit`, `set_value`, or `handle_error`.
Helper names should expose shape, scope, or control mode.

---

## Initial files

The skeleton includes one file per family:

- `control.sh`
- `output.sh`
- `args.sh`
- `state.sh`
- `words.sh`
- `context.sh`

These files contain only minimal placeholders.
They should remain small enough to serve as a foundation layer:

- context detection
- control signaling
- stream discipline
- argv handling
- state mutation
- word and array boundaries
- minimal file predicates

Everything above that belongs in a higher-level workflow layer, not here.
