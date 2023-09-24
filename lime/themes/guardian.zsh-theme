if [ $UID -eq 0 ]; then NCOLOR="green"; else NCOLOR="white"; fi

PROMPT='{ _ %{$fg[$NCOLOR]%}%B%n%b%{$reset_color%} _ : _ %{$fg[red]%}%30<...<%~%<<%{$reset_color} _ }%(!.#.$)'
PROMPT='%{$fg[red]%}%30<...<%~%<<%{$reset_color $(git_prompt_info)%{$fg[$NCOLOR]%}%B%(!.#.$)%b%{$reset_color%} '

RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[gray]%}(%{$fg_no_bold[yellow]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[gray]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"

ZSH_HIGHLIGHT_STYLES[main]='fg=green'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'

# vim: ft=zsh
