function @fail() {
    declare retval=1
    if [[ "${1:-}" =~ ^[0-9]+$ ]]; then
        retval="$1"
        shift
    fi
    if [[ "$#" -gt 0 ]]; then
        @out "${@}"
    fi
    builtin exit "${retval}"
}
