alias zshconfig="$EDITOR $ZSHRC"
alias rezsh="source $ZSHRC"
alias so='(){ source $1 > /dev/null 2>&1 &; }'
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

_lime_source "aliases/base.zsh"
_lime_source "aliases/util.zsh"
_lime_source "aliases/tmux.zsh"
_lime_source "aliases/nvim.zsh"

alias rn='$FILE_MANAGER'
alias nnn="\\nnn -e -c -C -E -H -o -Q"
alias np="ncmpcpp"
alias vi='$EDITOR'

alias cmd="/mnt/c/Windows/System32/cmd.exe"
alias psh="cmd /c powershell.exe -NoLogo"
alias start="cmd /c start.exe"
alias code='"/mnt/c/Program Files/Code/Code.exe"'
alias chrome="google-chrome --headless --hide-scollbars --remote-debugging-port=9222 --disable-gpu &"

alias stew="node $KITCHEN/pan/stew"
alias lz=lazygit

alias fvi="$EDITOR \$(fzf - )"
alias ff='(){ cd `/mnt/d/bin/f "$1"`; $EDITOR "$1" }'
alias wv='$EDITOR `wdate`'

alias lolcat='lolcat -p 16.0'
alias llc='lolcat -S 72'
alias leaf="${KITCHEN}/pan/leaffetch/leaffetch --config none --colors 1 5 1 2 1 3 --ascii_distro macos"
alias leaffetchw="fetchw '${KITCHEN}/pan/leaffetch/leaffetch' '--config none --colors 1 5 1 2 1 3 --ascii_distro macos'"

# Screensaver
alias matrix='cmatrix -u 6'
alias bonsai='cbonsai -li -t 0.04 -w 0.01 -L 36 -M 8'
alias b='cbonsai -L 36 -M 8'
alias pipes='pipes.sh -t 4 -p 3 -R -B -K'
alias clock='tty-clock -c -t -D'
alias clock-date='tty-clock -c -t -f "%a, %b %d %l:%M %p"'
# alias fetch='neofetch --config $KITCHEN/config/neofetch/fetch.conf'

alias wall='catimg $WALL'
alias cwall='zw $(dirname $WALL)'

alias go-init='(){ go mod init crispybaccoon/${1:-$(basename $(pwd))} }'

alias emerge='sudo \emerge -q'
#alias gsleep='echo mem | sudo tee /sys/power/state'
