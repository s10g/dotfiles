#!/bin/bash

# Declaring some constants...
VUNDLE=https://github.com/VundleVim/Vundle.vim.git
OURDIR=$(pwd)
VUNDLEDIR=~/.vim/bundle/Vundle.vim


# Making sure we want to run this script...
echo -e "\e[31mThis script will set up Vim and plugins for you and symlink .vimrc in your home. Hit Ctrl-c to abort or Enter to continue...\e[0m"
read -p ""


# Creating symlink...
echo -e "\e[31mCreating symlinks...\e[0m"
echo "Creating symlink: ~/.vimrc -> $(pwd)/vimrc"
ln -sf $(pwd)/vimrc ~/.vimrc


# Cloning Vundle...
echo ""
echo -e "\e[31mCloning or pulling Vundle from github.com so we can install Vim plugins...\e[0m"
if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
    git clone "$VUNDLE" "$VUNDLEDIR"
else
    echo ""$VUNDLEDIR" already exists. Changing directory to "$VUNDLEDIR"..."
    cd "$VUNDLEDIR"; echo "Now in $(pwd)..."; echo "Pulling..."; git pull; echo "Our work here is done. Going back..."; cd "$OURDIR"; echo ""; echo "Now in $(pwd)...";
fi


# Installing Vim plugins...
echo ""
echo -e "\e[31mInstalling plugins. Vim might complain about missing color scheme. Ignore and just press Enter...\e[0m"
vim +PluginInstall +qall
echo "Plugins installed..."

# Finished...
echo ""
echo -e "\e[31mFinished...\e[0m"
