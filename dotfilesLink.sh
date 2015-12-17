#!/bin/bash

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vim ~/.vim
#ln -sf ~/dotfiles/colors ~/.vim/colors
ln -sf ~/dotfiles/.bashrc ~/.bashrc

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
