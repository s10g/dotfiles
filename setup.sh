#!/bin/bash

VUNDLE="https://github.com/VundleVim/Vundle.vim.git"
VIMDIR=~/.vim
PIP="https://bootstrap.pypa.io/get-pip.py"

if [ ! -d "$VIMDIR" ]; then
    mkdir -p "$VIMDIR"
    echo "Created directory: "$VIMDIR""
fi


echo ""
echo "###"
echo "# Cloning Vundle into correct location."
echo "###"
echo ""
git clone "$VUNDLE" "$VIMDIR/bundle/Vundle.vim"


echo ""
echo "###"
echo "# Creating symlink: ~/.vimrc -> $(pwd)/vimrc"
echo "###"
echo ""
ln -sf $(pwd)/vimrc ~/.vimrc

echo ""
echo "###"
read -p "# About to install the vim plugins. Vim will complain when it does this because the color scheme isn't installed yet. Just hit enter."
echo "###"
echo ""
vim +PluginInstall +qall

echo ""
echo "###"
echo "# Don't forget to install pip: curl -O "$PIP" && python get-pip.py"
echo "# After you have pip, install flake8: pip install flake8"
echo "###"
echo ""
