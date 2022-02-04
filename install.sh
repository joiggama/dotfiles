#!/bin/zsh

# packages
sudo apt-get install -y \
  bat \
  fzf \
  htop \
  neovim \
  silversearcher-ag

# bat
sudo ln -fs /usr/bin/batcat /usr/local/bin/bat

# starship
sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --force
ln -sf ~/dotfiles/starship ~/.config/starship.toml

# vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/nvim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/nvim ~/.vimrc
nvim -es -u ~/.config/nvim/init.vim -i NONE -c "PlugInstall" -c "qa"

# tmux
ln -sf ~/dotfiles/tmux ~/.tmux.conf
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# shell
if [[ -z "$(grep \~/dotfiles/shell ~/.zshrc)" ]]; then
  echo "source ~/dotfiles/shell" >> ~/.zshrc
fi

exec $SHELL
