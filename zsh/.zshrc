if [ -f "$HOME/.zshrc_work" ]; then
    source "$HOME/.zshrc_work"
fi

alias v='nvim'
alias vdot='nvim ~/repos/dotfiles/nvim/init.lua'
alias zdot='nvim ~/repos/dotfiles/zsh/.zshrc'
alias tdot='nvim ~/repos/dotfiles/tmux/tmux.conf'
alias sdot='nvim ~/repos/dotfiles/starship/starship.toml'

alias branch='git branch | fzf | xargs git checkout '
alias ports='lsof -i -P -n | grep LISTEN'
alias tls='tmux ls'


if [[ $(uname) == "Darwin" ]]; then
    alias ls='LC_COLLATE=C gls -al --group-directories-first --color=auto'
elif [[ $(uname) == "Linux" ]]; then
    alias ls='ls -la --color=auto'
fi

eval "$(mise activate zsh)"

eval "$(starship init zsh)"
