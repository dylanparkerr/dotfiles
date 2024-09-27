#! /bin/bash

# packages
# sudo apt install -y build-essential npm unzip tmux ripgrep fzf cmake gettext openjdk-17-jdk

# ----dependencies----
# tmux
# ripgrep
# fzf
# java
# go
# node
# python
# starship

mkdir $HOME/.config/tmux/
mkdir $HOME/.config/tmux/plugins

# dotfile sym links
ln -sf $HOME/repos/dotfiles/bash/.bashrc $HOME/.bashrc
ln -sf $HOME/repos/dotfiles/bash/.zshrc $HOME/.zshrc
ln -sf $HOME/repos/dotfiles/nvim $HOME/.config/nvim
ln -sf $HOME/repos/dotfiles/lazygit/config.yml $HOME/.config/lazygit/config.yml
ln -sf $HOME/repos/dotfiles/starship/starship.toml $HOME/.config/starship.toml
ln -sf $HOME/repos/dotfiles/tmux/tmux.conf $HOME/.config/tmux/tmux.conf

# kitty themes - then select catppuccin macchitto
