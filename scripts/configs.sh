#! /bin/bash

dirs=(
  "$HOME/.config/tmux/"
  "$HOME/.config/tmux/plugins/"
  "$HOME/.config/lazygit/"
  "$HOME/.config/ghostty/"
  "$HOME/.config/mise/"
  "$HOME/.config/mise/conf.d/" # for conditional global configs 
)

for dir in "${dirs[@]}"; do
  mkdir -p "$dir"
done

# dotfile sym links
ln -sf $HOME/repos/dotfiles/bash/.bashrc $HOME/.bashrc
ln -sf $HOME/repos/dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/repos/dotfiles/nvim $HOME/.config/nvim
ln -sf $HOME/repos/dotfiles/lazygit/config.yml $HOME/.config/lazygit/config.yml
ln -sf $HOME/repos/dotfiles/ghostty/config $HOME/.config/ghostty/config
ln -sf $HOME/repos/dotfiles/starship/starship.toml $HOME/.config/starship.toml
ln -sf $HOME/repos/dotfiles/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
ln -sf $HOME/repos/dotfiles/mise/config.toml $HOME/.config/mise/config.toml
