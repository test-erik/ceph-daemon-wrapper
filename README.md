# ceph-daemon-wrapper
A wrapper for the command: `ceph daemon`

This command involves a considerable amount of typing, particularly since the dockerized Ceph 15 (Octopus) moved the sockets away from `/var/run/ceph`. This wrapper, with its focus on the bash completion part, should simplify the process.

## Installation

Copy `ceph-daemon.sh` into your $PATH and `ceph-daemon-completion.bash` in the directory `/etc/bash_completion.d/`.
