alias isup="ping -s 64 -c 1"
alias isalive='(){ [[ -z "$1" ]] && isup $SERVERIP || isup $1 }'
alias nettest="isup 1.1.1.1"
alias untar="tar -xvf"

# alias cc="cc $CFLAGS"
# alias make="make $MAKEOPTS"