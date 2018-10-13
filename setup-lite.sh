#!/bin/sh
# UNCOMMENT FOR DEBUG MODE
#set -x

# CONSTANTS
VIMPLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
VIMPLUG_VIM_INSTALL_LOCATION=$HOME/.vim/autoload/plug.vim
LINUX_VIM_BINARY=/usr/bin/vim
CURL_OPTIONS="-SfLo"
VIM_BINARY=

# FUNCTIONS
install_symlinks() {
    ln -sf $(pwd)/vimrc-lite ${HOME}/.vimrc
}

install_vimplug() {
    # Check for curl version greater than v7.24.0.
    _curl_version=$(curl --version | head -1 | cut -f 2 -d " ")
    _curl_main_version=$(echo ${_curl_version} | head -1 | cut -d . -f 1)
    _curl_release_version=$(echo ${_curl_version} | head -1 | cut -d . -f 2)

    if [ ${_curl_main_version} -ge 7 ] && [ ${_curl_release_version} -ge 24 ]; then
        :
    else
        CURL_OPTIONS=-fLo
    fi

    # Ensure we have a vim binary first, then install Plug and run PlugInstall. Exit if vim binary is not found.
    if [ -e ${LINUX_VIM_BINARY} ]; then
        VIM_BINARY=${LINUX_VIM_BINARY}
        curl ${CURL_OPTIONS} ${VIMPLUG_VIM_INSTALL_LOCATION} --create-dirs ${VIMPLUG_URL}
        ${VIM_BINARY} +PlugInstall +qall
    else
        echo "Vim not found. Ex(c)iting."
        exit 1
    fi
}

# MAIN
install_symlinks
install_vimplug