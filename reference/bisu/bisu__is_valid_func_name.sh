Bisu::is_valid_func_name() {
    local func_name="$1"
    func_name="${func_name#"${func_name%%[![:space:]]*}"}" # Bisu::ltrim
    func_name="${func_name%"${func_name##*[![:space:]]}"}" # Bisu::rtrim
    if [[ -z "$func_name" || ! "$func_name" =~ ^[a-zA-Z_][a-zA-Z0-9_:]*$ ]]; then
        return 1
    fi
    return 0
}
