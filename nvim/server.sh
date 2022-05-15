
alias vl="nvim --listen $VISERVER"
alias vs="nvim --server $VISERVER --remote-send "
alias vt="nvim --server $VISERVER --remote-tab "
alias v='(){ f "$1" && nvim --server $VISERVER --remote "$1" }'
alias vc='(){ nvim --server $VISERVER --remote-send ":$1<CR>" }'

