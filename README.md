# ceph-daemon-wrapper
A wrapper for the command: `ceph daemon`

This command requires quite a bit of typing, especially since Ceph 15 (Octopus) where the sockets are no longer in /var/run/ceph. The wrapper, especially the bash completion part, should simplify this.

## Installation

Copy `ceph-daemon.sh` into your $PATH and `ceph-daemon-completion.bash` in the directory `/etc/bash_completion.d/`.
