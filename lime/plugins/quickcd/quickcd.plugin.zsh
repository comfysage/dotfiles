QUICKCD_FILE="$HOME/.quick.dirs"

__cd() {
  builtin cd $@
  pwd >> $QUICKCD_FILE
  new=$(cat $QUICKCD_FILE | uniq)
  [[ -z "$new" ]] || echo "$new" > $QUICKCD_FILE
}

__cj() {
  dir=$(cat $QUICKCD_FILE | fzf -q "$1" -1)
  builtin cd $dir
}

__quick_cj() {
  dir=$(cat $QUICKCD_FILE | fzf -f "$1" | tail -n 1)
  builtin cd $dir
}

alias cd=__cd
alias cj=__cj
alias j=__quick_cj

compdef _gnu_generic __cd
compdef _gnu_generic __cj
compdef _gnu_generic __quick_cj
