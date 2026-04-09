# specs/

This directory contains the ShellSpec baseline suite.

This is the fixed-contract lane of the workbench.
Use ShellSpec to define the shell-native examples that should remain stable while helper implementations evolve.

These specs should be:

- small
- direct
- human-readable
- semantically sharp

Each spec should focus on one helper family or one semantic surface.

---

## What ShellSpec contributes

ShellSpec is responsible for proving known behavior, such as:

- return vs exit expectations
- stdout vs stderr separation
- local vs global state discipline
- argument-count failure behavior

Probe events should be enabled during ShellSpec runs so each example also yields semantic evidence, not just pass/fail output.
