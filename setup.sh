#!/bin/bash

VUNDLE="https://github.com/VundleVim/Vundle.vim.git"
VIMDIR=~/.vim

if [ ! -d "$VIMDIR" ]; then
    mkdir -p "$VIMDIR"
    echo "Created directory: "$VIMDIR""
fi


git clone "$VUNDLE" "$VIMDIR/bundle/Vundle.vim"

ln -sf vimrc ~/.vimrc
echo "Created symlink: ~/.vimrc -> $(pwd)/vimrc"

read -p "About to install the vim plugins. Vim will complain when it does this because the color scheme isn't installed yet. Just hit enter."
vim +PluginInstall +qall
