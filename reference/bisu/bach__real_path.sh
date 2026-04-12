function .bach.real-path() {
    declare folder name="$1"
    declare altname="${name#*|}"
    name="${name%|*}"
    for folder in "${bach_origin_paths[@]}"; do
        if [[ -x "$folder/$name" ]]; then
            builtin echo "$folder/$name"
            return 0
        elif [[ "$name" != "$altname" && -x "$folder/$altname" ]]; then
            builtin echo "$folder/$altname"
            return 0
        fi
    done
    return 1
}
