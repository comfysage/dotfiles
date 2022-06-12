if [ $UID -eq 0 ]; then NCOLOR="white"; else NCOLOR="magenta"; fi

declare -a PREFIXS
PREFIXS=(
 ""
 ""
 ""
 ""
 ""
 "≎"
 "$"
 ">"
 ""
 )

shorten_path() {
  local current_path=$PWD
  current_path=${current_path/#$HOME/"~"}
  local trunc_path
  # for each parent path component find the shortest unique beginning
  # characters sequence. Source: https://stackoverflow.com/a/45336078
  if (( ${#current_path} > 1 )); then # root and home are exceptions and won't have paths
    # cheating here to retain ~ as home folder
    local home_path="$(getUniqueFolder $HOME)"
    trunc_path="$(getUniqueFolder $PWD)"
    [[ $current_path == "~"* ]] && current_path="~${trunc_path//${home_path}/}" || current_path="/${trunc_path}"
  fi

  # remove /mnt/d/home/kitchen/ from path
  local kitchen_path="/$(getUniqueFolder $KITCHEN)/"
  kitchen_shortened=${current_path/#$kitchen_path/""}
  [[ "$kitchen_shortened" == "$current_path" ]] && echo "$current_path" || echo "${PWD/#$KITCHEN/}"
}

function getUniqueFolder() {
  local trunc_path directory test_dir test_dir_length
  local -a matching
  local -a paths
  local cur_path='/'
  paths=(${(s:/:)1})
  for directory in ${paths[@]}; do
    test_dir=''
    for (( i=0; i < ${#directory}; i++ )); do
      test_dir+="${directory:$i:1}"
      matching=("$cur_path"/"$test_dir"*/)
      if [[ ${#matching[@]} -eq 1 ]]; then
        break
      fi
    done
    trunc_path+="$test_dir/"
    cur_path+="$directory/"
  done
  echo "${trunc_path: : -1}"
}

git_ahead() {
  if [[ $(git_prompt_info) ]]; then
    num=$(git log --oneline @{u}..HEAD | grep -cE ".*")
    if [[ num -gt 0 ]]
    then
      echo "~$num "
    else
      echo ""
    fi
  else
    return 0
  fi
}

# RANDOM=$$$(date +%s)
# ignition=${PREFIXS[$RANDOM % ${#RANDOM[*]}+1]}
ignition=${PREFIXS[8]}

# PROMPT='{ _ %{$fg[$NCOLOR]%}%B%n%b%{$reset_color%} _ : _ %{$fg[red]%}%30<...<%~%<<%{$reset_color} _ }%(!.#.$)'
# PROMPT=$(echo "" '\033[38;5;11m%30<...<%~%<<%{${NONE}$reset_color $(git_prompt_info)%{$fg[$NCOLOR]%}%(!.#.$)%{$reset_color%} ' )
# PROMPT=$(echo "" '\033[38;5;11m%30<...<%~%<<%{${NONE}$reset_color $(git_prompt_info)%{$fg[$NCOLOR]%}' "$ignition" '%{$reset_color%} ' )
PROMPT=$(echo "" '%{$fg[cyan]%}$( shorten_path )%{${NONE}$reset_color %{$fg_no_bold[magenta]%}$(git_prompt_info)$(git_ahead)%{$fg[$NCOLOR]%}' '$ignition' '%{$reset_color%} ' )
RPROMPT=''

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[gray]%}(%{$fg_no_bold[yellow]%}%B"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[gray]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"

# vim: ft=zsh
