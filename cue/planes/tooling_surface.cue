package microbash

cueSurface: #Surface & {
    name:      "cue"
    authority: "contract"
    purpose:   "Plane contracts, helper inventory, tooling coverage, and exportable projections"
}

tooling: {
    bash: [...#ToolingEntry] & [
        {
            name:    "shellcheck"
            surface: "bash"
            role:    "linter"
            coverage: [
                "quoting and expansion mistakes",
                "word-splitting and globbing hazards",
                "many sourcing and control-flow mistakes",
            ]
            gaps: [
                "does not reformat files",
                "does not rewrite code by default",
                "does not model full repo policy",
            ]
        },
        {
            name:    "shellharden"
            surface: "bash"
            role:    "rewriter"
            coverage: [
                "semi-automatic quoting hardening",
                "safer idiom rewrites",
            ]
            gaps: [
                "not a formatter-first tool",
                "not a full static analyzer",
            ]
        },
        {
            name:    "shfmt"
            surface: "bash"
            role:    "formatter"
            coverage: [
                "canonical shell formatting",
                "parser-backed normalization",
            ]
            gaps: [
                "not a semantic linter",
                "does not prove safety by itself",
            ]
        },
    ]
    cue: [...#ToolingEntry] & [
        {
            name:    "cue fmt"
            surface: "cue"
            role:    "formatter"
            coverage: [
                "canonical CUE formatting",
            ]
            gaps: [
                "not a semantic linter",
            ]
        },
        {
            name:    "cue vet"
            surface: "cue"
            role:    "validator"
            coverage: [
                "schema and data validation",
                "concreteness checks",
                "cross-format validation of YAML and JSON inputs",
            ]
            gaps: [
                "not a shell-style advisory linter",
            ]
        },
        {
            name:    "cue fix"
            surface: "cue"
            role:    "rewriter"
            coverage: [
                "syntax migration",
                "API migration",
                "experiment migration support",
            ]
            gaps: [
                "not a safety hardener in the shell sense",
            ]
        },
        {
            name:    "cue export"
            surface: "cue"
            role:    "exporter"
            coverage: [
                "project validated values into JSON, YAML, TOML, CUE, text, or binary",
            ]
        },
    ]
}
