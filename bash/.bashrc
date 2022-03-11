#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='LC_COLLATE=C ls -al --group-directories-first --color=auto'
alias pac='sudo pacman -Syu'
alias v='nvim'
alias orphans='sudo pacman -Qtd'

git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# color
# \[\033[37m\]
PS1="\[\033[35m\]\u@\h\[\033[34m\][\w]\[\033[32m\]\$(git_branch)\[\033[37m\]\$ "
PS2='>'

export PATH=$PATH:~/.config/rofi/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

neofetch
