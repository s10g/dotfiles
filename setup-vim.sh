#!/bin/bash

# Declaring some constants...
VUNDLE=https://github.com/VundleVim/Vundle.vim.git
OURDIR=$(pwd)
VUNDLEDIR=~/.vim/bundle/Vundle.vim


# Making sure we want to run this script...
echo "This script will set up Vim and plugins for you and symlink .vimrc to the correct file in your home. Hit Ctrl-c to abort or Enter to continue..."
read -p ""


# Creating symlinks...
echo "Creating symlinks..."
echo "Creating symlink: ~/.vimrc -> $(pwd)/vimrc"
ln -sf $(pwd)/vimrc ~/.vimrc


# Cloning Vundle...
echo ""
echo "Cloning or pulling Vundle from github.com so we can install Vim plugins..."
if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
    git clone "$VUNDLE" "$VUNDLEDIR"
else
    echo ""$VUNDLEDIR" already exists. Changing directory to "$VUNDLEDIR"..."
    cd "$VUNDLEDIR"; echo "Now in $(pwd)..."; echo "Pulling..."; git pull; echo "Our work here is done. Going back..."; cd "$OURDIR"; echo ""; echo "Now in $(pwd)...";
fi


# Installing Vim plugins...
echo ""
echo "Installing plugins. Vim might complain about missing color scheme. Ignore and just press Enter..."
vim +PluginInstall +qall
echo "Plugins installed..."

# Finished...
echo ""
echo "Finished..."
