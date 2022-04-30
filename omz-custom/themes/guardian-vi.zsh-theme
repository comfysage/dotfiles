if [ $UID -eq 0 ]; then NCOLOR="green"; else NCOLOR="magenta"; fi

VIMM=""

# The plugin will auto execute this zvm_after_select_vi_mode function
function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
      VIMM="."
    ;;
    $ZVM_MODE_INSERT)
      VIMM="$"
    ;;
    $ZVM_MODE_VISUAL)
      VIMM=">"
    ;;
    $ZVM_MODE_VISUAL_LINE)
      VIMM="<"
    ;;
    $ZVM_MODE_REPLACE)
      VIMM="/"
    ;;
  esac
}

PROMPT='{ _ %{$fg[$NCOLOR]%}%B%n%b%{$reset_color%} _ : _ %{$fg[red]%}%30<...<%~%<<%{$reset_color} _ }%(!.#.$)'
PROMPT='%{$fg[red]%}%30<...<%~%<<%{$reset_color $(git_prompt_info)%{$fg[$NCOLOR]%}%B$VIMM %b%{$reset_color%}'

RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[gray]%}(%{$fg_no_bold[yellow]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[gray]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"
