#!/bin/bash
fsid=$(ceph fsid)
socket_path="/var/run/ceph/${fsid}/"

if [ $# -eq 0 ]; then
    echo "Usage: ceph-daemon.sh <socket> [command]"
    echo "Hint: Use TAB for command and socket name completion."
    exit 1
elif [ $# -eq 1 ]; then
    exec ceph daemon "${socket_path}$1" help
else
    if [ "$1" = "help" ] && [ -n "$2" ]; then
        exec ceph daemon "${socket_path}$2" help
    else
        exec ceph daemon "${socket_path}$@"
    fi
fi
