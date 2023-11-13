#!/usr/bin/env bash

WALLPAPERS_DIR="$HOME/.wallpapers"

cd $WALLPAPERS_DIR

# find image size to display (very slow)
#echo $(identify -format '%[fx:w]x%[fx:h]\' ~/Pictures/$A 2>/dev/null)

build_theme() {
    rows=$1
    cols=$2
    icon_size=$3

    echo "element{orientation:vertical;}element-text{horizontal-align:0.5;}element-icon{size:$icon_size.0000em;}listview{lines:$rows;columns:$cols;}"
}

theme="$HOME/.config/rofi/wallpaper.rasi"
selector="$HOME/.config/rofi/select.rasi"

ROFI_CMD="rofi -dmenu -i -show-icons -theme-str $(build_theme 3 5 6) -theme ${theme}"
SELECT_CMD="rofi -dmenu -i -theme ${selector}"

dir=""
dir_selection=false
wal_selection=false

while ! $wal_selection; do
  if $dir_selection; then
    choice=$(\
        ls --escape "$dir" | \
            while read A; do echo -en "$A\x00icon\x1f$dir/$A\n"; done | \
            $ROFI_CMD -p "󰸉  Wallpaper" \
    )

    [[ -z "$choice" ]] && exit 1

    case $choice in
      ..) dir_selection=false;;
      *) wallpaper="$dir$choice"; wal_selection=true;;
    esac
  else
    choice=$(\
        ls --escape -d */ | \
            $SELECT_CMD -p "  Folders" \
  )

    [[ -z "$choice" ]] && exit 1

    dir="$WALLPAPERS_DIR/$choice"
    dir_selection=true
  fi
done

wallctl set $wallpaper

