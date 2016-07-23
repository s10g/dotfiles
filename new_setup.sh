#!/bin/bash

#VIMDIR=~/.vim
PIP="https://bootstrap.pypa.io/get-pip.py"

if [ ! -d "$VIMDIR" ]; then
    echo ""$VIMDIR" directory not found. Creating directory: "$VIMDIR""
    mkdir -p "$VIMDIR"
fi


echo "Creating symlink: ~/.vimrc -> $(pwd)/vimrc"
ln -sf $(pwd)/vimrc ~/.vimrc

echo "Creating symlink: ~/.vim -> $(pwd)/vim"
ln -sf $(pwd)/vim ~/.vim

echo "Creating symlink: ~/.bashrc -> $(pwd)/bashrc"
ln -sf $(pwd)/bashrc ~/.bashrc

echo "Creating symlink: ~/.dir_colors -> $(pwd)/dir_colors"
ln -sf $(pwd)/dir_colors ~/.dir_colors

echo "Creating symlink: ~/.minttyrc -> $(pwd)/minttyrc"
ln -sf $(pwd)/minttyrc ~/.minttyrc

echo ""
echo "###"
echo "Don't forget to install pip: (sudo) curl -O "$PIP" && python get-pip.py"
echo "After you have pip, install flake8: (sudo) pip install flake8"
