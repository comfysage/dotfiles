
alias _status='git status --short'
alias status='git status -s -b'
alias _log='git log --oneline --graph'
alias ahead='git log --oneline @{u}..HEAD | grep -cE ".*"'
alias _push='git push -u origin $( git branch --show-current )'

alias git-changelog='git -c pager.show=false show --format=" - %C(yellow)%h%C(reset) %<(80,trunc)%s" -q @@{1}..@@{0}'
alias git-remind='git -c pager.log=false log --format=" - %C(yellow)%h%C(reset) %<(80,trunc)%s" --since "yesterday 00:00"'

alias _commit='git commit' # normal commit
alias _amend='git commit --amend' # normal commit but amend to last commit.

alias _stash='git stash push' # stash changes. use -m <message> to specify a message
alias _pop='git stash pop' # pop stash; <stash>

alias git-feature='git checkout -b' # create a new branch; <branch>
alias git-next='git stash branch' # create a new branch from stash; <stash>

alias git-spread='git reset' # uncommit changes until commit; <commit hash>

function pushw() {
  branch="$(git branch --show-current)"
  wt "${1:-mega}" && git rebase "$branch"
  push && popd
}
function gupdate() {
  git stash push -q
  git rebase "${1:-mega}"
  git stash pop -q
}

function checkg() {
  [[ $(gtea hash feat/ui) == $(gtea hash mega) ]] && echo 'up to date'
}
