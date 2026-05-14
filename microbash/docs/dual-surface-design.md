# Dual-surface design

## Contract

`microbash` treats Bash and CUE as complementary, not competing, surfaces.

- Bash owns runtime semantics.
- CUE owns plane taxonomy, invariants, and exportable structure.

## Surface split

### Bash surface
The Bash surface remains small and concrete:

- `bash/helpers/*.sh` are thin wrappers around actual shell semantics.
- `bash/subject/*.sh` are stimulus functions, not framework APIs.
- `bash/runner/*.sh` dispatches scenarios without analysis logic.
- `specs/*.sh` prove small contracts directly.

### CUE surface
The CUE surface exists to prevent semantic drift:

- define the planes explicitly
- inventory helper-to-plane ownership
- document tool coverage and gaps
- provide a machine-readable surface for projection into JSON/YAML/docs later

## Plane model

The repo uses these planes:

1. context
2. control
3. output
4. args
5. state
6. words
7. file

The **word plane** is intentionally first-class because it is where Bash's
quoting, splitting, joining, emptiness, globbing, and membership hazards show up.

## Guidance

- Keep Bash arrays as arrays.
- Do not encode argv into a single string.
- Prefer exact-element membership helpers over substring tests.
- Keep stdout/stderr intent explicit.
- Model learning surfaces in CUE, not in ad hoc README prose alone.

## Expected extension path

- add more ShellSpec examples before adding more helper layers
- add more CUE contracts before adding more policy prose
- export the CUE surface to JSON/YAML when integrating with other tooling
