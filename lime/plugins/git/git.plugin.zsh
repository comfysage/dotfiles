
root="${${(%):-%x}:a:h}"

plugins=(
  config
  gh
  git_fn
  worktree
)

for plugin ($plugins); do
  source "$root/$plugin.sh"
done
