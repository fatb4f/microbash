Bisu::isset() {
    local name index pattern
    for arg in "$@"; do
        # Parse "name[index]" vs "name"
        case "$arg" in
        *\[*\]*)
            name="${arg%%\[*}"
            index="${arg#*\[}"
            index="${index%\]*}"
            # Strip quotes from index if present
            if [[ $index == \"*\" ]]; then
                index="${index#\"}"
                index="${index%\"}"
            fi
            ;;
        *)
            name="$arg"
            index=""
            ;;
        esac
        # Check if base variable exists
        if ! declare -p "$name" &>/dev/null; then
            return 1
        fi
        # If an index/key is given, verify it exists in the array
        if [ -n "$index" ]; then
            pattern='\["?'"$index"'"]='
            if ! [[ $(declare -p "$name" 2>/dev/null) =~ $pattern ]]; then
                return 1
            fi
        fi
    done
    return 0
}
