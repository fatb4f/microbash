Bisu::time_ms() {
    local ts sec ns ms

    # Prefer Bash 5+ built-ins for best performance and zero external calls.
    if [[ -n $EPOCHSECONDS ]]; then
        sec=$EPOCHSECONDS
        # Extract fractional nanoseconds padded to 9 digits, else zero
        if [[ -n $EPOCHREALTIME && $EPOCHREALTIME =~ ^[0-9]+\.(.*)$ ]]; then
            ns=$(printf '%-9s' "${BASH_REMATCH[1]}" | tr ' ' 0)
        else
            ns="000000000"
        fi
        # Convert nanoseconds to milliseconds by truncating last 6 digits
        ms=$((10#${sec} * 1000 + 10#${ns:0:3}))
        printf '%d\n' "$ms"
        return 0
    fi

    # GNU date fallback (Ubuntu, Termux)
    ts=$(date +%s%N 2>/dev/null || true)
    # Validate Bisu::output length for seconds+nanoseconds (>=19 digits)
    if [[ $ts =~ ^[0-9]{19,}$ ]]; then
        sec=${ts:0:10}
        ns=${ts:10:9}
        ms=$((10#$sec * 1000 + 10#${ns:0:3}))
        printf '%d\n' "$ms"
        return 0
    fi

    # POSIX date fallback: seconds only, pad milliseconds zero
    ts=$(date +%s 2>/dev/null || true)
    if [[ $ts =~ ^[0-9]{10}$ ]]; then
        ms=$((10#$ts * 1000))
        printf '%d\n' "$ms"
        return 0
    fi

    printf ''
    return 1
}
