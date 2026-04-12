Bisu::set() {
    local name=$(Bisu::trim "$1")
    shift
    Bisu::is_valid_var_name "$name" || return 1
    printf -v "$name" '%s' "$@" 2>/dev/null || return 1
    return 0
}
