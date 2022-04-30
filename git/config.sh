
alias _status='git status --short'
alias _log='git log --oneline --graph'

alias _commit='git commit' # normal commit
alias _amend='git commit --amend' # normal commit but amend to last commit.

alias _stash='git stash push' # stash changes. use -m <message> to specify a message
alias _pop='git stash apply' # apply stash; <stash>

alias _feature='git checkout -b' # create a new branch; <branch>
alias _next='git stash branch' # create a new branch from stash; <stash>

alias _spread='git reset' # uncommit changes until commit; <commit hash>

