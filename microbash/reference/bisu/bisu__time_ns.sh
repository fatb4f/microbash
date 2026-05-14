Bisu::time_ns() {
    local ts sec ns

    # Use Bash 5+ built-ins if available (preferred, no external call)
    if [[ -n $EPOCHSECONDS ]]; then
        sec=$EPOCHSECONDS
        # Use nanoseconds if fractional part exists, else zero-pad
        if [[ -n $EPOCHREALTIME && $EPOCHREALTIME =~ ^[0-9]+\.(.*)$ ]]; then
            ns=$(printf '%-9s' "${BASH_REMATCH[1]}" | tr ' ' 0) # pad right with zeros to 9 digits
        else
            ns="000000000"
        fi
        ts="${sec}${ns}"
        printf '%s\n' "$ts"
        return 0
    fi

    # GNU date fallback: expects nanoseconds appended to seconds (length >= 19)
    ts=$(date +%s%N 2>/dev/null || true)
    # Validate: must be all digits and at least 19 chars (10 for seconds + 9 nanoseconds)
    if [[ $ts =~ ^[0-9]{19,}$ ]]; then
        printf '%s\n' "$ts"
        return 0
    fi

    # POSIX date fallback: seconds only
    ts=$(date +%s 2>/dev/null || true)
    if [[ $ts =~ ^[0-9]{10}$ ]]; then
        printf '%s000000000\n' "$ts" # append zeros for nanoseconds to unify length
        return 0
    fi

    printf ''
    return 1
}
