function @stderr() {
    builtin printf "%s\n" "$@" >&2
}
