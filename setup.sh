#! /bin/bash

rm -f ~/.zshrc && ln -s ~/dotfiles/zshrc ~/.zshrc
rm -f ~/.gitconfig && ln -s ~/dotfiles/gitconfig ~/.gitconfig
rm -f ~/.gitignore && ln -s ~/dotfiles/gitignore ~/.gitignore
rm -f ~/.tmux.conf && ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
rm -f ~/.vimrc && ln -s ~/dotfiles/vimrc ~/.vimrc

mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty

rm -f ~/.config/nvim/init.vim && ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
rm -f ~/.config/alacritty/alacritty.yml && ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
