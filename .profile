#!/usr/bin/env bash

export EDITOR="/usr/bin/nvim"
export lang=en_US.UTF-8
export LC_ALL="C"

[[ -d '/mnt/d/home/' ]] || vmhgfs-fuse .host:/d /mnt/d

if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep bspwm || startx ~/.config/X11/xinitrc &
fi

if [[ "$(tty)" = "/dev/tty2" ]]; then
  pgrep openbox || startx ~/.config/X11/xinitrc openbox &
fi
