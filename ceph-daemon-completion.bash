_ceph_daemon_completion() {
    local cur prev socket_path fsid
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    fsid=$(ceph fsid)
    socket_path="/var/run/ceph/${fsid}/"

    if [[ $COMP_CWORD -eq 1 ]]; then
        local sockets=$(find ${socket_path} -name '*.asok' -printf "%f ")
        COMPREPLY=( $(compgen -W "${sockets}" -- ${cur}) )
    elif [[ $COMP_CWORD -ge 2 ]]; then
        local first_command_part="${COMP_WORDS[2]}"
        local partial_command=$(echo "${COMP_WORDS[@]:2}")
        
        if [[ -z "$cur" ]]; then
            local actions=$(ceph daemon "${socket_path}${COMP_WORDS[1]}" help 2>/dev/null | jq -r 'keys[]' | awk -v cmd="$first_command_part" '$0 ~ "^" cmd { print }')
        else
            local actions=$(ceph daemon "${socket_path}${COMP_WORDS[1]}" help 2>/dev/null | jq -r 'keys[]' | awk -v cmd="$partial_command" '$0 ~ cmd { print }')
        fi
        COMPREPLY=( $(compgen -W "${actions}" -- ${cur}) )
    fi

    return 0
}

complete -F _ceph_daemon_completion ceph-daemon.sh
