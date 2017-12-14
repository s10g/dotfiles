#!/bin/bash

# Declaring some constants...
VIMPLUG=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
OURDIR=$(pwd)
VIMPLUGDIR=~/.vim/autoload/plug.vim


# Making sure we want to run this script...
echo -e "\e[31mThis script will set up bash and vim according to my taste. Hit Ctrl-c to abort or Enter to continue...\e[0m"
read -p ""


# Creating symlink...
echo -e "\e[31mCreating symlinks...\e[0m"
echo "Creating symlink: ~/.minttyrc -> $(pwd)/minttyrc"
ln -sf $(pwd)/minttyrc ~/.minttyrc
echo "Creating symlink: ~/.dir_colors -> $(pwd)/dir_colors"
ln -sf $(pwd)/dir_colors ~/.dir_colors
echo "Creating symlink: ~/.bashrc -> $(pwd)/bashrc"
ln -sf $(pwd)/bashrc ~/.bashrc
echo "Creating symlink: ~/.vimrc -> $(pwd)/vimrc"
ln -sf $(pwd)/vimrc ~/.vimrc



# Installing Vim plugins...
echo ""
echo -e "\e[31mInstalling plugins. Vim might complain about missing color scheme. Ignore and just press Enter...\e[0m"
vim +PlugInstall +qall
echo "Plugins installed..."


# Finished...
echo ""
echo -e "\e[31mFinished...\e[0m"
echo -e "\e[31mLogout from this terminal and start a new terminal to activate the new changes...\e[0m"
