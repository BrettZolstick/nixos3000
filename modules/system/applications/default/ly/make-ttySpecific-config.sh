#!/usr/bin/env bash
set -euo pipefail

tty="$1" # nix passes this argument to the script (e.g. tty3)

# get rid of any prexisting save_file_location and save a copy of the config to /run
grep --invert-match '^save_file_dir' /etc/ly/config.ini > "/run/ly/$tty/config.ini" 

# make the new config put the save file in /var/lib/ly/$tty
echo "save_file_dir=/var/lib/ly/$tty" >> "/run/ly/$tty/config.ini"
