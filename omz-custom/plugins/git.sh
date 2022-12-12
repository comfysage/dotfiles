is_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

has_upstream() {
  git remote > /dev/null 2>&1
}

_gb() {
  is_git_repo || return
  echo "$( git branch --show-current )"
}

_git_ahead() {
  is_git_repo || return
  has_upstream || return
  num=$(git log --oneline @{u}..HEAD | grep -cE ".*")
  if [[ num -gt 0 ]]
  then
    echo " ~$num "
  else
    echo ""
  fi
}

_git_dirty() {
  local STATUS
  local -a FLAGS
  FLAGS=('--porcelain')
  if [[ "${DISABLE_UNTRACKED_FILES_DIRTY:-}" == "true" ]]
  then
    FLAGS+='--untracked-files=no'
  fi
  STATUS=$(git status ${FLAGS} 2> /dev/null | tail -n 1)
  if [[ -n $STATUS ]]
  then
    echo "*"
  else
    echo ""
  fi
}

_git_prompt_info() {
  echo "$(_gb)$(_git_ahead)"
}
