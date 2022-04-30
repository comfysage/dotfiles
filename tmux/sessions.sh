#!/usr/bin/env bash

sessions=$(tmux ls)

noteS=$( echo $sessions | grep -cE "note" )

if [[ $noteS -lt 1 ]]
then
 tmux new-session -s "note" -c /note \; detach-client -s note
 echo ' > "note" session created.'
fi
