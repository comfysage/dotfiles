#!/usr/bin/env bash

export SHELL="$(grep "^$USER" /etc/passwd | grep -oE '(/[^:]*)+$')"
[[ -f "$HOME/.config/user-dirs.dirs" ]] && . ~/.config/user-dirs.dirs

source ~/.comfy_env


if [ -e /home/comfy/.nix-profile/etc/profile.d/nix.sh ]; then . /home/comfy/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
. "$HOME/.cargo/env"
