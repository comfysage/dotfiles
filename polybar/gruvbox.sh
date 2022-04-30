#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar -c=/mnt/d/home/kitchen/config/polybar/gruvbox.ini gruvbox >>/tmp/gruvbox.log 2>&1 &
