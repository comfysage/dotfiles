alias list="eza -l --group-directories-first --no-user --no-time"
alias ls="list -a"
alias tree="list --tree --level 3"
alias less="$PAGER"

alias batl='bat --paging=never -l log --plain'
alias bat-open='(){ [[ -f "$1" ]] && tail -f "$1" | batl }'

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}
