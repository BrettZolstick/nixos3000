# shellcheck shell=bash

target="$1" # accept a tty number as in input

# do nothing if already on the selected tty
if [ "$(cat /sys/class/tty/tty0/active)" = "tty$target" ]; then
  exit 0
fi

# lock the current noctalia session, then switch
noctalia msg session lock
sleep 0.85 
busctl --system call org.freedesktop.login1 /org/freedesktop/login1/seat/seat0 \
  org.freedesktop.login1.Seat SwitchTo u "$target"
