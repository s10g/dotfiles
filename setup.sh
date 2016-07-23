#!/bin/bash

# Declaring some constants...
PIP="https://bootstrap.pypa.io/get-pip.py"
VUNDLE=https://github.com/VundleVim/Vundle.vim.git
OURDIR=$(pwd)
VUNDLEDIR=~/.vim/bundle/Vundle.vim


# Making sure we want to run this script...
echo -e "\e[31mThis script will set up Vim and plugins for you and symlink some .dotfiles (.vimrc, .bashrc, .dir_colors, .minttyrc) in your home. Hit Ctrl-c to abort or Enter to continue...\e[0m"
read -p ""


# Creating symlinks...
echo -e "\e[31mCreating symlinks...\e[0m"
echo "Creating symlink: ~/.vimrc -> $(pwd)/vimrc"
ln -sf $(pwd)/vimrc ~/.vimrc
echo "Creating symlink: ~/.bashrc -> $(pwd)/bashrc"
ln -sf $(pwd)/bashrc ~/.bashrc
echo "Creating symlink: ~/.dir_colors -> $(pwd)/dir_colors"
ln -sf $(pwd)/dir_colors ~/.dir_colors
echo "Creating symlink: ~/.minttyrc -> $(pwd)/minttyrc"
ln -sf $(pwd)/minttyrc ~/.minttyrc


# Cloning Vundle...
echo -e "\e[31mCloning or pulling Vundle from github.com so we can install Vim plugins...\e[0m"
if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
    git clone "$VUNDLE" "$VUNDLEDIR"
else
    echo ""$VUNDLEDIR" already exists. Changing directory to "$VUNDLEDIR"..."
    cd "$VUNDLEDIR"; echo "Now in $(pwd)..."; echo "Pulling..."; git pull; echo "Our work here is done. Going back..."; cd "$OURDIR"; echo "Now in $(pwd)...";
fi


# Installing Vim plugins...
echo -e "\e[31mInstalling plugins using Vim (Vundle). Vim will complain about missing color scheme wombat256mod. Ignore and just press Enter...\e[0m"
vim +PluginInstall +qall


# Finished...
echo -e "\e[31mFinished...\e[0m"
