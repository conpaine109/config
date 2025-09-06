#!/usr/bin/env bash

cd ~/Desktop
mkdir dotfiles && cd $_
git clone git@github.com:conpaine109/config.git .

ln -sf ~/Desktop/dotfiles/.bashrc ~/.bashrc
ln -sf ~/Desktop/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/Desktop/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/Desktop/dotfiles/.vimrc ~/.vimrc
ln -sf ~/Desktop/dotfiles/.zshrc ~/.zshrc

echo "git works $(git branch -vv)"
echo "Done"
