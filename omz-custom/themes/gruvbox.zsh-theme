if [ $UID -eq 0 ]; then NCOLOR="white"; else NCOLOR="green"; fi

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
ignition=${PREFIXS[2]}

# PROMPT='{ _ %{$fg[$NCOLOR]%}%B%n%b%{$reset_color%} _ : _ %{$fg[red]%}%30<...<%~%<<%{$reset_color} _ }%(!.#.$)'
# PROMPT=$(echo "" '\033[38;5;11m%30<...<%~%<<%{${NONE}$reset_color $(git_prompt_info)%{$fg[$NCOLOR]%}%(!.#.$)%{$reset_color%} ' )
# PROMPT=$(echo "" '\033[38;5;11m%30<...<%~%<<%{${NONE}$reset_color $(git_prompt_info)%{$fg[$NCOLOR]%}' "$ignition" '%{$reset_color%} ' )
PROMPT=$(echo "" '%{$fg[yellow]%}$( shorten_path )%{${NONE}$reset_color %{$fg_no_bold[yellow]%}$(git_prompt_info)$(git_ahead)%{$fg[$NCOLOR]%}' '$ignition' '%{$reset_color%} ' )
RPROMPT=''

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[gray]%}(%{$fg_no_bold[yellow]%}%B"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[gray]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"

# vim: ft=zsh
