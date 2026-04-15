package microbash

bashSurface: #Surface & {
    name:      "bash"
    authority: "runtime"
    purpose:   "Direct shell semantics for learning and controlled experiments"
}

bashHelpers: [...#HelperContract] & [
    {
        name:    "ctx_is_sourced"
        plane:   "context"
        surface: "bash"
        file:    "bash/helpers/context.sh"
        summary: "Detect sourced vs executed mode"
        sharp:   true
    },
    {
        name:    "ctrl_fail"
        plane:   "control"
        surface: "bash"
        file:    "bash/helpers/control.sh"
        summary: "Return when sourced, exit when executed"
        sharp:   true
    },
    {
        name:    "out_line"
        plane:   "output"
        surface: "bash"
        file:    "bash/helpers/output.sh"
        summary: "Emit stdout data with probe evidence"
    },
    {
        name:    "err_line"
        plane:   "output"
        surface: "bash"
        file:    "bash/helpers/output.sh"
        summary: "Emit stderr diagnostics with probe evidence"
    },
    {
        name:    "arg_take_rest_array"
        plane:   "args"
        surface: "bash"
        file:    "bash/helpers/args.sh"
        summary: "Capture remaining argv into an already-declared array"
        sharp:   true
    },
    {
        name:    "state_local_set"
        plane:   "state"
        surface: "bash"
        file:    "bash/helpers/state.sh"
        summary: "Perform explicit local writes through a nameref"
        sharp:   true
    },
    {
        name:    "word_join"
        plane:   "words"
        surface: "bash"
        file:    "bash/helpers/words.sh"
        summary: "Join elements without re-splitting the resulting words"
    },
    {
        name:    "word_array_contains"
        plane:   "words"
        surface: "bash"
        file:    "bash/helpers/words.sh"
        summary: "Perform exact-element membership checks"
        sharp:   true
    },
    {
        name:    "file_source_if_exists"
        plane:   "file"
        surface: "bash"
        file:    "bash/helpers/file.sh"
        summary: "Guard dynamic sourcing by existence checks"
        sharp:   true
    },
]

planes: [...#PlaneKind] & [
    "context",
    "control",
    "output",
    "args",
    "state",
    "words",
    "file",
]
