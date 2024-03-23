alias isup="ping -s 64 -c 1"
alias isalive='(){ [[ -z "$1" ]] && isup $SERVERIP || isup $1 }'
alias nettest="isup 1.1.1.1"
alias untar="tar -xvf"

alias dff="df -hT /boot / /home/*"
alias dir-usage="du -m --max-depth 1 . | sort -n -k 1"

# alias cc="cc $CFLAGS"
# alias make="make $MAKEOPTS"

alias help='(){ eval "$1 --help" | bat -l help -p }'
alias fntls="fc-list | grep scf | grep -oE ': (\w|\s)*' | sort -u | less"
alias dispatch='(){ nohup $@ & disown }'
