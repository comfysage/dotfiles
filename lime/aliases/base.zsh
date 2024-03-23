alias list="eza -l --group-directories-first --no-user --no-time"
alias ls="list -a"
alias tree="list --tree --level 3"
alias less="$PAGER"

alias batl='bat --paging=never -l log --plain'
alias bat-open='(){ [[ -f "$1" ]] && tail -f "$1" | batl }'

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}
alias gitdoc='git show HEAD:README.md | glow -'

alias topen='(){ [[ -f ~/.tmux.dirs ]] || return 1; p=$(cat ~/.tmux.dirs | fzf -f "$1" | head -n 1); tmux new-session -s "$(basename $p)" -c "$p" }'

alias 'gopass-get'='(){ query=$(gopass list -f | fzf); [[ ! -z "$query" ]] && gopass show -c $query }'

alias 'docker-clean'="docker images | fzf -m | xargs -I{} -l echo {} | cut -d ' ' -f4 | xargs -I{} docker image rm -f {}"

alias 'pacman-clean'="paru -Qdt | xargs -I{} echo {} | cut -d ' ' -f1 | xargs -I{} paru -Rs {}"
