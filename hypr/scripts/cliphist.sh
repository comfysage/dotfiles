#!/usr/bin/env sh
selector="$HOME/.config/rofi/select.rasi"
ROFI_CMD="rofi -dmenu -i -theme ${selector} -theme-str window{width:800px;}"

case $1 in
    c)  cliphist list | $ROFI_CMD -p "Copy" | cliphist decode | wl-copy
        ;; 
    d)  cliphist list | $ROFI_CMD -p "Delete" | cliphist delete
        ;;
    w)  if [ `echo -e "Yes\nNo" | $ROFI_CMD -theme-str "window{height:220px;}" -p "Clear"` == "Yes" ] ; then
            cliphist wipe
        fi
        ;;
    t)  echo ""
        echo "󰅇 clipboard history"
        ;;
    *)  echo "cliphist.sh [action]"
        echo "c :  cliphist list and copy selected"
        echo "d :  cliphist list and delete selected"
        echo "w :  cliphist wipe database"
        echo "t :  display tooltip"
        ;;
esac

