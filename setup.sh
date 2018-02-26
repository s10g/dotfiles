#!/bin/sh

# This script will symlink dotfiles and set up Vim/Neovim with plugins. It can 
# target cygwin, linux and openbsd.
#
# Cygwin: sets up mintty and bash and vim
# Linux: sets up bash and Neovim
# OpenBSD: sets up ksh, X server stuff, Neovim
#
# The script can be run interactively (if ran without arguments) or with one of
# [cygwin|linux|openbsd] as argument.


### CONSTANTS
VIMPLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
VIMPLUG_VIM_INSTALL_LOCATION=$HOME/.vim/autoload/plug.vim
VIMPLUG_NEOVIM_INSTALL_LOCATION=$HOME/.local/share/nvim/site/autoload/plug.vim

VIM_BINARY_LINUX=/usr/bin/vim
NVIM_BINARY_LINUX=/usr/bin/nvim

VIM_BINARY_OPENBSD=/usr/local/bin/vim
NVIM_BINARY_OPENBSD=/usr/local/bin/nvim

VIM_TYPE=""


### FUNCTIONS
install_vimplug() {
    # Check for installed *vim type and prioritise Neovim over Vim

    if [ -e ${NVIM_BINARY_LINUX} ]; then
        VIM_TYPE=${NVIM_BINARY_LINUX}
        curl -fLo $VIMPLUG_NEOVIM_INSTALL_LOCATION --create-dirs $VIMPLUG_URL

    elif [ -e ${NVIM_BINARY_OPENBSD} ]; then
        VIM_TYPE=${NVIM_BINARY_OPENBSD}
        curl -fLo $VIMPLUG_NEOVIM_INSTALL_LOCATION --create-dirs $VIMPLUG_URL
        echo "Found NeoVim on openbsd"

    elif [ -e ${VIM_BINARY_LINUX} ]; then
        VIM_TYPE=${VIM_BINARY_LINUX}
        curl -fLo $VIMPLUG_VIM_INSTALL_LOCATION --create-dirs $VIMPLUG_URL

    elif [ -e ${VIM_BINARY_OPENBSD} ]; then
        VIM_TYPE=${VIM_BINARY_OPENBSD}
        curl -fLo $VIMPLUG_VIM_INSTALL_LOCATION --create-dirs $VIMPLUG_URL
        echo "Found Vim on openbsd"

    else
        echo "Neither Neovim nor Vim found. Exiting..."
        exit 1
    fi
}


prompt() {
cat <<EOF
Select which system to set up for
=================================
1. cygwin
2. linux
3. openbsd
0. exit
EOF

    echo -n "Enter choice: "
    read _choice
    case ${_choice} in
        1) setup cygwin;;
        2) setup linux;;
        3) setup openbsd;;
        0) exit 0;;
        *) echo ""; echo "Choice not recognized."; echo ""; prompt;;
    esac
}

setup() {
    case $1 in
        cygwin)
            # symlinks
            echo "Installing symlinks..."
            ln -sf $(pwd)/minttyrc ${HOME}/.minttyrc
            ln -sf $(pwd)/bashrc.cygwin ${HOME}/.bashrc
            ln -sf $(pwd)/vimrc ${HOME}/.vimrc
            

            # vimplug
            echo "Installing vim-plug..."
            install_vimplug

            # Run Vim/Neovim to install plugins
            echo "Installing plugins..."
            ${VIM_TYPE} +PlugInstall +qall

            # exit
            echo "Done..."
            ;;

        linux)
            # symlinks
            echo "Installing symlinks..."
            ln -sf $(pwd)/bashrc.linux ${HOME}/.bashrc
            mkdir -p ${HOME}/.config/nvim/
            ln -sf $(pwd)/init.vim ${HOME}/.config/nvim/init.vim

            # vimplug
            echo "Installing vim-plug..."
            install_vimplug

            # Run Vim/Neovim to install plugins
            echo "Installing plugins..."
            ${VIM_TYPE} +PlugInstall +qall

            # exit
            echo "Done..."
            ;;

        openbsd)
            # symlinks
            if [ -d ${HOME}/.config/nvim ]; then
                echo "Directory found. Symlinking *vim config file..."
                ln -sf $(pwd)/init.vim ${HOME}/.config/nvim/init.vim
            else
                echo "Directory not found. Creating directory..."
                mkdir -p ${HOME}/.config/nvim
                ln -sf $(pwd)/init.vim ${HOME}/.config/nvim/init.vim
            fi

            # vimplug
            echo "Installing vim-plug..."
            install_vimplug

            # Run Vim/Neovim to install plugins
            echo "Installing plugins..."
            ${VIM_TYPE} +PlugInstall +qall
            ;;

        *)
            echo "Not a valid setup target. Exiting..."
            exit 1
    esac
}




# MAIN
# Check if we are running interactively or not. Control the flow accordingly.

# Preliminary checks goes here: check for vim or nvim exit if neither is found with informational 
# message, check for curl > v7.24.0 exit if neither is found with informational message


if [ $# -eq 0 ]; then
    prompt
elif [ $# -eq 1 ]; then
    setup $1
else
    echo 'Usage: ./setup.sh [cygwin|linux|openbsd]'
    exit 1
fi
