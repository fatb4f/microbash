package microbash

#PlaneKind: "context" | "control" | "output" | "args" | "state" | "words" | "file"

#SurfaceKind: "bash" | "cue"

#Surface: {
    name:      #SurfaceKind
    authority: string
    purpose:   string
}

#HelperContract: {
    name:    string
    plane:   #PlaneKind
    surface: "bash"
    file:    string
    summary: string
    sharp?:  bool
}

#ToolRole: "formatter" | "validator" | "rewriter" | "linter" | "exporter"

#ToolingEntry: {
    name:     string
    surface:  #SurfaceKind
    role:     #ToolRole
    coverage: [...string]
    gaps?:    [...string]
}
