wt() {
  dir=$(git worktree list --porcelain | grep -E 'worktree ' | awk '/'"$(echo "$1" | sed 's/\//./g')"'/ {print; exit}' | cut -d ' ' -f2-)
  [[ -z "$dir" ]] && return 1
  cd $dir
}
wtf() {
  dir=$(echo "$(git worktree list --porcelain | grep -E 'worktree ' | cut -d ' ' -f2-)" | fzf)
  [[ -z "$dir" ]] && return 1
  cd $dir
}
