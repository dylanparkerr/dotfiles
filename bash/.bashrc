#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=10000
HISTFILESIZE=20000
# append to the history file, don't overwrite it
shopt -s histappend
# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth

# prompt
git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# \[\033[COLORm\]
# colors
# Black: 30
# Blue: 34
# Cyan: 36
# Green: 32
# Purple: 35
# Red: 31
# White: 37
# Yellow: 33

#one dark themed prompt
# PS1="\[\033[35m\]\u@\h\[\033[34m\][\w]\[\033[32m\]\$(git_branch)\[\033[37m\]\$ "

# gruvbox themed prompt
PS1="\[\033[33m\]\u@\h\[\033[32m\][\w]\[\033[31m\]\$(git_branch)\[\033[37m\]\$ "
PS2='>'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias ls='LC_COLLATE=C ls -al --group-directories-first --color=auto'
alias v='nvim'
alias vdot='nvim ~/repos/dotfiles/nvim/init.lua'
alias bdot='nvim ~/repos/dotfiles/bash/.bashrc'

PATH=$PATH:/usr/local/go/bin
