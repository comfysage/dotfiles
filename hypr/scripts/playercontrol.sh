#!/usr/bin/env bash

src=""

select_source() {
  src="-p $1"
}

focus_source() {
  current=$(cat ~/.config/hypr/scripts/current_source.ctl)
  json="$(hyprctl clients -j | tr '[:upper:]' '[:lower:]')"
  win="$(echo $json | jq "map(select(.title == \"${current}\"))[0]")"
  [[ -z "$win" ]] && exit 1
  wkspace=$(echo $win | jq ".workspace.id")

  hyprctl dispatch workspace $wkspace && sleep 0.2
  hyprctl dispatch focuswindow "address:$(echo $win | jq ".address")"
}

change_volume() {
  diff=0.05
  case $1 in
    i) playerctl $src volume "${diff}+";;
    d) playerctl $src volume "${diff}-";;
    *) ;;
  esac

  # vol="$(($(playerctl $src volume) * 10))"
  # bar=$(seq -s "/" ${vol%.*} | sed 's/[0-9]//g')
  # notify-send -a playerctl "playerctl // $(cat ~/.config/hypr/scripts/current_source.ctl)"\
  #   "volume [$bar]"
  return
}

get_meta() {
  playerctl $src metadata "$@"
}

get_state() {
  playerctl $src status
}

print_state() {
  state=$(get_state)
  case $state in
    Playing) echo "";;
    Paused) echo "";;
  esac
}

get_current() {
  title=$(get_meta title)
  artist=$(get_meta artist)

  case $1 in
    update) get_meta -F -f '{{status}} {{title}} - {{artist}}' | while read line; do
      line=$(echo $line | sed -e '{s/^Playing//}')
      line=$(echo $line | sed -e '{s/^Paused//}')
      echo $line
    done;;
    *) get_meta -f '{{title}} - {{artist}}';;
  esac
}

main() {
  select_source "$(cat ~/.config/hypr/scripts/current_source.ctl)"
  flag="$1"
  shift 1
  # [[ -z "$flag" ]] || select_source $flag

  case $flag in
    update)  get_current update;;
    current) echo "$(print_state) $(get_current)";;
    toggle)  playerctl $src play-pause;;
    prev)    playerctl $src previous;;
    next)    playerctl $src next;;
    select)  new="$(playerctl -l | rofi -dmenu -config "$HOME/.config/rofi/select.rasi")"
      [[ -z "$new" ]] && return
      echo "$new" > ~/.config/hypr/scripts/current_source.ctl
      pgrep waybar && pkill -SIGUSR2 waybar;;
    focus) focus_source;;
    volume) change_volume $@;;
    *) echo "";;
  esac
}

main $@
