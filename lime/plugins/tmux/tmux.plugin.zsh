
is_tmux() {
  echo $TMUX > /dev/null 2>&1
}

session_name() {
  is_tmux || return
  echo "$(tmux display-message -p '#S')"
}
