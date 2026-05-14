Bisu::is_valid_var_name() {
    local var_name="$1"
    var_name="${var_name#"${var_name%%[![:space:]]*}"}" # Bisu::ltrim
    var_name="${var_name%"${var_name##*[![:space:]]}"}" # Bisu::rtrim
    if [[ -z "$var_name" || ! "$var_name" =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]]; then
        return 1
    fi
    return 0
}
