#!/bin/bash

VUNDLE="https://github.com/VundleVim/Vundle.vim.git"
VIMDIR=~/.vim
PIP="https://bootstrap.pypa.io/get-pip.py"

if [ ! -d "$VIMDIR" ]; then
    mkdir -p "$VIMDIR"
    echo "Created directory: "$VIMDIR""
fi


git clone "$VUNDLE" "$VIMDIR/bundle/Vundle.vim"

ln -sf vimrc ~/.vimrc
echo "Created symlink: ~/.vimrc -> $(pwd)/vimrc"

read -p "About to install the vim plugins. Vim will complain when it does this because the color scheme isn't installed yet. Just hit enter."
vim +PluginInstall +qall

echo "###"
echo "# Don't forget to install pip: curl -O "$PIP" && python get-pip.py"
echo "# After you have pip, install flake8: pip install flake8"
echo "###"
