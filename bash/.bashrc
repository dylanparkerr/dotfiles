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
# Color	Foreground Code	Background Code
# Black	        30	40
# Red	        31	41
# Green	        32	42
# Yellow	    33	43
# Blue	        34	44
# Magenta	    35	45
# Cyan	        36	46
# Light Gray	37	47
# Gray	        90	100
# Light Red	    91	101
# Light Green	92	102
# Light Yellow	93	103
# Light Blue	94	104
# Light Magenta	95	105
# Light Cyan	96	106
# White	        97	107

#one dark themed prompt
# PS1="\[\033[35m\]\u@\h\[\033[34m\][\w]\[\033[32m\]\$(git_branch)\[\033[37m\]\$ "

# gruvbox themed prompt
# PS1="\[\033[93m\]\u@\h\[\033[92m\][\w]\[\033[91m\]\$(git_branch)\[\033[97m\]\$ "
PS1="\[\033[92m\]\u@\h\[\033[94m\][\w]\[\033[91m\]\$(git_branch)\[\033[97m\]\$ "
PS2='>'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias ls='LC_COLLATE=C ls -al --group-directories-first --color=auto'
alias v='nvim'
alias vdot='nvim ~/repos/dotfiles/nvim/init.lua'
alias bdot='nvim ~/repos/dotfiles/bash/.bashrc'
alias tdot='nvim ~/repos/dotfiles/tmux/tmux.conf'
alias python='python3'

PATH=$PATH:/usr/local/go/bin

# export REQUESTS_CA_BUNDLE=/mnt/c/Users/cap8823/dev/windows-certs-2-wsl/all-certificates/A340FE5272235DF17E05A55CD858B8DF3BA3D9EF__CN_Kroger_Root_CA.pem
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
