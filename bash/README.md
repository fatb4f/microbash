# bash/

This directory contains the shell-side implementation substrate for the workbench.

This is where Bash actually runs.
Everything here should be oriented around one of four responsibilities:

- instrumentation
- helper prototyping
- subject behavior under analysis
- scenario execution

---

## Subdirectories

```text
helpers/   Candidate helper implementations.
subject/   Small subject functions used to stimulate semantic surfaces.
runner/    Scenario runner entrypoints.
```

At this level, `probe.sh` is the most important file.
It is the sensor substrate that turns Bash execution into structured evidence.

---

## Execution rules

### 1. Bash is the runtime authority

Do not replace Bash semantics with clever shell abstractions.
Observe Bash closely and only wrap operations where the evidence shows the wrapper is justified.

### 2. Probe before convenience

If a helper performs a meaningful semantic effect, that effect should be observable through probe-backed events.

### 3. Keep subject functions tiny

`subject/` should contain small, semantically sharp functions.
Do not turn it into an application.

### 4. The runner is a stimulus harness

The scenario runner should intentionally exercise semantic surfaces.
It is not a demo script.
