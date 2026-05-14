Bisu::time_sec() {
    local ts sec

    # Prefer Bash 5+ built-ins for performance and zero external calls
    if [[ -n $EPOCHSECONDS ]]; then
        printf '%d\n' "$EPOCHSECONDS"
        return 0
    fi

    # GNU date fallback
    ts=$(date +%s 2>/dev/null || true)
    # Validate timestamp length (10 digits for seconds)
    if [[ $ts =~ ^[0-9]{10}$ ]]; then
        printf '%s\n' "$ts"
        return 0
    fi

    printf ''
    return 1
}
