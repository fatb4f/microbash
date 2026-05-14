function @out() {
    if [[ "${1:-}" == "-" || ! -t 0 ]]; then
        [[ "${1:-}" == "-" ]] && shift
        while IFS=$'\n' read -r line; do
            builtin printf "%s\n" "${*}$line"
        done
    elif [[ "$#" -gt 0 ]]; then
        builtin printf "%s\n" "$*"
    else
        builtin printf "\n"
    fi
} 8>/dev/null
