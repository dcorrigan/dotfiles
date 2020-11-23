#! /bin/bash

rm -f ~/.zshrc && ln -s ~/dotfiles/zshrc ~/.zshrc
rm -f ~/.gitconfig && ln -s ~/dotfiles/gitconfig ~/.gitconfig
rm -f ~/.gitignore && ln -s ~/dotfiles/gitignore ~/.gitignore
rm -f ~/.tmux.conf && ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

