alias s='(){ name="${1:-$(basename $PWD)}"; tmux new-session -s ${name} }'
alias sa='(){ spath=${1:-$PWD}; tmux new-session -s "$(basename $spath)" -c "$(realpath $spath)" }'
alias l="tmux list-sessions"
alias a='(){ if [[ -n $1 ]]; then; tmux attach -t $1; else; tmux attach; fi }'
alias ta="tmux attach -t"
alias ts="tmux split-window -c \"#{pane_current_path}\" -p 20 \"make test; read\""

alias la='(){ name=$(tmux ls -F "#S" | fzf); [[ -z "$name" ]] || a $name; }'
alias lsa='(){ dir="$(realpath ${1:-${XDG_DEV_DIR}})"; spath=$(find "$dir" -mindepth 1 -maxdepth 1 -type d | fzf); [[ -z "$spath" ]] || sa "$spath" }'
