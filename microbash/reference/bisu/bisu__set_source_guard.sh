Bisu::set_source_guard() {
    # Only install once
    if declare -F __source_guard &>/dev/null; then
        return 0
    fi

    # Global registry for loaded scripts
    declare -gA __loaded_scripts

    # Core guard implementation
    __source_guard() {
        local target="$1"
        local abs_target

        # Resolve absolute path (fallback to raw path if readlink fails)
        abs_target=$(readlink -f "$target" 2>/dev/null) || abs_target="$target"

        # Skip if already loaded
        if [[ -n "${__loaded_scripts[$abs_target]}" ]]; then
            return 0
        fi

        # Mark as loaded and perform actual source
        __loaded_scripts[$abs_target]=1
        builtin source "$target" 2>/dev/null

        return 0
    }

    # Override source and dot transparently
    source() { __source_guard "$@"; }
    .() { __source_guard "$@"; }

    return 0
}
