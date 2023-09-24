
root="${${(%):-%x}:a:h}"

plugins=(
  config
  gh
  git_fn
)

for plugin ($plugins); do
  source "$root/$plugin.sh"
done
