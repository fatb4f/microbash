# Refactor summary

## Structural changes

- added a root `README.md`
- added `justfile` as a single command surface
- added a CUE module and contract surface under `cue.mod/` and `cue/`
- added docs for dual-surface design, OSS patterns, and CUE tooling equivalents
- added `artifacts/runs/README.md`

## Bash changes

- renamed internal `WORKBENCH_*` identifiers to `MICROBASH_*`
- sharpened `arg_take_rest_array` to reject scalar fallback and require a declared array target
- added `word_require_nonempty`
- added specs for args and words planes

## Validation performed in the container

- `bash -n` over Bash and ShellSpec files
- manual smoke checks for:
  - scenario runner stdout path
  - argv preservation in `arg_take_rest_array`
  - nonempty guard error path
  - undeclared array target error path

## Validation not performed in the container

The container did not have these tools installed:

- `cue`
- `shellcheck`
- `shellharden`
- `shfmt`
- `shellspec`

The repo includes command surfaces and docs for them, but they were not executed here.
