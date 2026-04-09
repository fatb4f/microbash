# bash/subject/

This directory contains small subject functions that deliberately exercise Bash semantic surfaces.

The subject layer is not a general library.
It is a controlled stimulus set used by:

- the scenario runner
- ShellSpec examples
- Hypothesis-generated runs

---

## Design rules

### 1. Keep functions tiny

Each function should exercise one or two semantic surfaces only.

### 2. Prefer focused edge cases

A good subject function reveals something meaningful about:

- return vs exit
- local vs global mutation
- stdout vs stderr separation
- scalar vs array behavior
- context changes such as subshell or sourced execution

### 3. Avoid building application logic here

If a function is long or has multiple unrelated branches, it belongs somewhere else.
