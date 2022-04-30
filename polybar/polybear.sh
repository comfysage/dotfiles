#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar -c=/home/comfy/.config/polybar/polybear polybear-top >>/tmp/polybear-top.log 2>&1 &
#polybar -c=/home/comfy/.config/polybar/polybear polybear-bottom >>/tmp/polybear-bottom.log 2>&1 &
polybar -c=/home/comfy/.config/polybar/polybear small-bear-window >>/tmp/small-bear-window.log 2>&1 &
polybar -c=/home/comfy/.config/polybar/polybear small-bear-utils >>/tmp/small-bear-utils.log 2>&1 &
