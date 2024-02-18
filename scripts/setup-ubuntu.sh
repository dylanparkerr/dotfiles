#! /bin/bash

# download neovim
if [[ ! -d "$HOME/tools" ]]; then
	mkdir $HOME/tools
	mkdir $HOME/tools/nvim
	mkdir $HOME/tools/lazygit
fi
wget https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz -C $HOME/tools/nvim
rm nvim-linux64.tar.gz

# packages
sudo apt install build-essential npm unzip tmux ripgrep fzf

# dotfile sym links
ln -sf $HOME/repos/dotfiles/scripts/bash/.bashrc $HOME/.bashrc
ln -sf $HOME/repos/dotfiles/nvim $HOME/.config/nvim
ln -sf $HOME/repos/dotfiles/lazygit/config.yml $HOME/.config/lazygit/config.yml

