# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=10000
HISTFILESIZE=20000

# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth

# idk i fthis is needed
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#unsure of this too
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias ls='LC_COLLATE=C ls -al --group-directories-first --color=auto'
alias v='nvim'
alias vdot='nvim ~/repos/dotfiles/nvim/init.lua'
alias bdot='nvim ~/repos/dotfiles/bash/.bashrc'
alias tdot='nvim ~/repos/dotfiles/tmux/tmux.conf'
alias python='python3'
alias azrun='mvn clean package && mvn azure-functions:run'
alias fman='compgen -c | fzf | xargs man'
alias gb='git branch | fzf | xargs git checkout'

# ideally things could be added to path in other ways 
PATH=$PATH:/usr/local/go/bin

eval "$(starship init bash)"
