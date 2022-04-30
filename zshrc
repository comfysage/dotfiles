# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:/mnt/d/bin:/home/linuxbrew/.linuxbrew/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/comfy/.oh-my-zsh"
export ZSH_CUSTOM="/mnt/d/home/kitchen/config/omz-custom"

ZSH_THEME="gruvbox"
ZSH_THEME_FILE="$ZSH_CUSTOM/themes/$ZSH_THEME.zsh-theme"

# ZSH config
zstyle ':omz:update' frequency 12
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Highlighting
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[main]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[command]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'

ZSH_HIGHLIGHT_STYLES[assign]='fg=cyan'

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green'

ZSH_HIGHLIGHT_STYLES[comment]='fg=gry'

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow'

# Plugins
plugins=(
 git
 zsh-syntax-highlighting
)

ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=false

# Dont check file permissions
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_CA.UTF-8
export LC_ALL="C"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
  export PAGER='less'
  export MANPAGER=$PAGER
else
  export EDITOR='nvim'
  export PAGER='nvim +Man!'
  export MANPAGER=$PAGER
fi

export VISERVER="/tmp/vi.pipe"
source /mnt/d/home/kitchen/config/nvim/server.sh

# Sound
export HOST_IP="$(ip route |awk '/^default/{print $3}')"
export PULSE_SERVER="tcp:$HOST_IP"
#export DISPLAY="$HOST_IP:0.0"

# fzf
export FZF_DEFAULT_OPTS='--height=40% --margin=0,2 --prompt="$ " --info=hidden --color=bw'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
 --color=fg:#e0def4,hl:#6e6a86
 --color=fg+:#908caa,hl+:#908caa
 --color=info:#9ccfd8,prompt:#f6c177,pointer:#c4a7e7
 --color=marker:#ebbcba,spinner:#eb6f92,header:#ebbcba"

source /mnt/d/home/kitchen/.wall # get WALL variable
source /mnt/d/home/kitchen/config/git/config.sh # basic git aliases
source /mnt/d/home/kitchen/config/git/gh.sh # gh cli aliases

# ENV
export KITCHEN="/mnt/d/home/kitchen"
export NOTES="$KITCHEN/Dropbox/notes"
export CONFIGPATH="$KITCHEN/config"
export ZSHRC="$CONFIGPATH/zshrc"

# Aliases
alias zshconfig="$EDITOR $ZSHRC"
alias rezsh="source $ZSHRC"
alias so='(){ source $1 > /dev/null 2>&1 &; }'
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

alias ls="exa -al --group-directories-first --no-user --no-time --git"
alias tree="ls --tree --level 3"
alias less="nvim +Man!"

alias rn="ranger"
alias np="ncmpcpp"
alias vi="$EDITOR"

alias psh="cmd.exe /c powershell.exe -NoLogo"
alias bat="\\bat --pager less"
alias stew="node $KITCHEN/pan/stew"

alias fvi="$EDITOR \$(fzf - )"
alias ff='$EDITOR "$(\ls -a | fzf)"'

alias lolcat='lolcat -p 16.0'
alias llc='lolcat -S 72'

# Screensaver
alias matrix='cmatrix -u 6'
alias bonsai='cbonsai -li -t 0.04 -w 0.01 -L 64 -M 8'
# alias fetch='neofetch --config /mnt/d/home/kitchen/config/neofetch/fetch.conf'

# tmux
alias s="tmux new-session -s"
alias l="tmux list-sessions"
alias a="tmux attach"
alias ta="tmux attach -t"

eval "$(rbenv init - zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

