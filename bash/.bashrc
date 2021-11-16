#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='LC_COLLATE=C ls -al --group-directories-first --color=auto'

PS1='\u@\h[\w]\$ '
PS2='>'

export PATH=$PATH:~/.config/rofi/bin

neofetch
