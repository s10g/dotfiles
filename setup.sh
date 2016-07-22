#!/bin/bash

VUNDLE="https://github.com/VundleVim/Vundle.vim.git"
VIMDIR=~/vim

if [ ! -d "$VIMDIR" ]; then
    mkdir -p "$VIMDIR"
    echo "Created directory: "$VIMDIR""
fi

#if [ ! -d "$VIMDIR/vim" ]; then
#    mkdir -p "$VIMDIR/vim"
#    echo "Created directory: "$VIMDIR""
#fi

git clone "$VUNDLE" "$VIMDIR/bundle/Vundle.vim"

ln -sf "$(pwd)/vimrc" ~/.vimrc
echo "Created symlink: ~/.vimrc -> $(pwd)/vimrc"

vim +PluginInstall +qall
