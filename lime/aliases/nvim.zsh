
alias vl='nvim --listen $VISERVER'
alias vs='nvim --server $VISERVER --remote-send '
alias v='(){ f "$1" && nvim --server $VISERVER --remote "$1" }'
alias vt='nvim --server $VISERVER --remote-tab '
alias vc='(){ nvim --server $VISERVER --remote-send ":$1<CR>" }'

if command -v neovide 1>/dev/null; then
  alias nv='neovide'
fi
