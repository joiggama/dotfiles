#!/bin/zsh

# packages
sudo apt-get install -y \
  bat \
  exuberant-ctags \
  fzf \
  kafkacat \
  neovim \
  silversearcher-ag

# bat
sudo ln -fs /usr/bin/batcat /usr/local/bin/bat


# neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/shared/nvim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/shared/nvim ~/.vimrc
nvim -es -u ~/.config/nvim/init.vim -i NONE -c "PlugInstall" -c "qa"

# starship
sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --force
ln -sf ~/dotfiles/shared/starship ~/.config/starship.toml

# tmux
ln -sf ~/dotfiles/shared/tmux ~/.tmux.conf
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/bin/install_plugins
fi

# shell
if [[ -z "$(grep \~/dotfiles/shared/shell ~/.zshrc)" ]]; then
  echo "source ~/dotfiles/shared/shell" >> ~/.zshrc
fi

exec $SHELL
