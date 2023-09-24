
root="${${(%):-%x}:a:h}"

plugins=(
  shorten_path
  )

for plugin ($plugins); do
  source "$root/$plugin.zsh"
done
