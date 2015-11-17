#!/bin/sh
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/init/*.vim ~/.vim/userautoload/init/
ln -sf ~/dotfiles/vim/plugins/*.vim ~/.vim/userautoload/plugins/
ln -sf ~/dotfiles/vim/ftplugin/*.vim ~/.vim/ftplugin/
ln -sf ~/dotfiles/neovim/init.vim ~/.config/nvim/
ln -sf ~/dotfiles/.zshrc ~/.zshrc

