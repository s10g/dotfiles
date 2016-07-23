#!/bin/bash

PIP="https://bootstrap.pypa.io/get-pip.py"
VUNDLE=https://github.com/VundleVim/Vundle.vim.git


echo "Cloning Vundle to ~/.vim/bundle/Vundle.vim"
git clone "$VUNDLE" ~/.vim/bundle/Vundle.vim

echo "Creating symlink: ~/.vimrc -> $(pwd)/vimrc"
ln -sf $(pwd)/vimrc ~/.vimrc

echo "Creating symlink: ~/.bashrc -> $(pwd)/bashrc"
ln -sf $(pwd)/bashrc ~/.bashrc

echo "Creating symlink: ~/.dir_colors -> $(pwd)/dir_colors"
ln -sf $(pwd)/dir_colors ~/.dir_colors

echo "Creating symlink: ~/.minttyrc -> $(pwd)/minttyrc"
ln -sf $(pwd)/minttyrc ~/.minttyrc

echo -e "\e[4mInstalling plugins using Vim (Vundle). Vim will complain about missing color scheme wombat256mod. Ignore and just press Enter.\e[0m"
read -p "Press Enter."
vim +PluginInstall

echo ""
echo "###"
echo "Don't forget to install pip: (sudo) curl -O "$PIP" && python get-pip.py"
echo "After you have pip, install flake8: (sudo) pip install flake8"

