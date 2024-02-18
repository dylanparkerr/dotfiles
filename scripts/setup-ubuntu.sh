#! /bin/bash

# download neovim
if [[ ! -d "$HOME/tools" ]]; then
	mkdir $HOME/tools
	mkdir $HOME/tools/nvim
	mkdir $HOME/tools/lazygit
fi

# packages
sudo apt install build-essential npm unzip tmux ripgrep fzf cmake gettext

# neovim from source
# git clone https://github.com/neovim/neovim
# cd neovim
# git checkout stable
# make CMAKE_BUILD_TYPE=RelWithDebInfo
# cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb #this is for ubuntu/deb based distros

# dotfile sym links
ln -sf $HOME/repos/dotfiles/scripts/bash/.bashrc $HOME/.bashrc
ln -sf $HOME/repos/dotfiles/nvim $HOME/.config/nvim
ln -sf $HOME/repos/dotfiles/lazygit/config.yml $HOME/.config/lazygit/config.yml

