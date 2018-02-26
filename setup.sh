#!/bin/sh


# CONSTANTS
VIMPLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
VIMPLUG_VIM_INSTALL_LOCATION=$HOME/.vim/autoload/plug.vim
VIMPLUG_NVIM_INSTALL_LOCATION=$HOME/.local/share/nvim/site/autoload/plug.vim
LINUX_VIM_BINARY=/usr/bin/vim
LINUX_NVIM_BINARY=/usr/bin/nvim
OPENBSD_VIM_BINARY=/usr/local/bin/vim
OPENBSD_NVIM_BINARY=/usr/local/bin/nvim
CURL_OPTIONS="-sSfLo"
VIM_TYPE=


# FUNCTIONS
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

    # Check for installed *vim type and prioritize Neovim over Vim
    if [ -e ${LINUX_NVIM_BINARY} ]; then
        VIM_TYPE=${LINUX_NVIM_BINARY}
        curl ${CURL_OPTIONS} ${VIMPLUG_NVIM_INSTALL_LOCATION} --create-dirs ${VIMPLUG_URL}
    elif [ -e ${OPENBSD_NVIM_BINARY} ]; then
        VIM_TYPE=${OPENBSD_NVIM_BINARY}
        curl ${CURL_OPTIONS} ${VIMPLUG_NVIM_INSTALL_LOCATION} --create-dirs ${VIMPLUG_URL}
    elif [ -e ${LINUX_VIM_BINARY} ]; then
        VIM_TYPE=${LINUX_VIM_BINARY}
        curl ${CURL_OPTIONS} ${VIMPLUG_VIM_INSTALL_LOCATION} --create-dirs ${VIMPLUG_URL}
    elif [ -e ${OPENBSD_VIM_BINARY} ]; then
        VIM_TYPE=${OPENBSD_VIM_BINARY}
        curl ${CURL_OPTIONS} ${VIMPLUG_VIM_INSTALL_LOCATION} --create-dirs ${VIMPLUG_URL}
    else
        echo "Neither Neovim nor Vim found. Ex(c)iting."
        exit 1
    fi
}

prompt() {
cat <<EOF
Select which system to set up for

1. Cygwin
2. Linux
3. OpenBSD

0. Exit
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
    case ${1} in
        cygwin)
            # symlinks
            echo "Installing symlinks."
            ln -sf $(pwd)/minttyrc ${HOME}/.minttyrc
            ln -sf $(pwd)/bashrc.cygwin ${HOME}/.bashrc
            ln -sf $(pwd)/vimrc ${HOME}/.vimrc
            
            # vimplug
            echo "Installing vim-plug."
            install_vimplug

            # Run Vim/Neovim to install plugins
            echo "Installing plugins."
            ${VIM_TYPE} +PlugInstall +qall

            # exit
            echo "Done."
            ;;

        linux)
            # symlinks
            echo "Installing symlinks."
            ln -sf $(pwd)/bashrc.linux ${HOME}/.bashrc
            if [ -d ${HOME}/.config/nvim ]; then
                ln -sf $(pwd)/init.vim ${HOME}/.config/nvim/init.vim
            else
                mkdir -p ${HOME}/.config/nvim
                ln -sf $(pwd)/init.vim ${HOME}/.config/nvim/init.vim
            fi

            # vimplug
            echo "Installing vim-plug."
            install_vimplug

            # Run Vim/Neovim to install plugins
            echo "Installing plugins."
            ${VIM_TYPE} +PlugInstall +qall

            # exit
            echo "Done."
            ;;

        openbsd)
            # symlinks
            echo "Installing symlinks."
            ln -sf $(pwd)/Xdefaults ${HOME}/.Xdefaults
            ln -sf $(pwd)/xsession ${HOME}/.xsession
            ln -sf $(pwd)/profile ${HOME}/.profile
            if [ -d ${HOME}/.config/nvim ]; then
                ln -sf $(pwd)/init.vim ${HOME}/.config/nvim/init.vim
            else
                mkdir -p ${HOME}/.config/nvim
                ln -sf $(pwd)/init.vim ${HOME}/.config/nvim/init.vim
            fi

            # vimplug
            echo "Installing vim-plug."
            install_vimplug

            # Run Vim/Neovim to install plugins
            echo "Installing plugins."
            ${VIM_TYPE} +PlugInstall +qall

            # exit
            echo "Done."
            ;;

        *)
            echo "Not a valid setup target. Exiting."
            exit 1
    esac
}


# MAIN
if [ $# -eq 0 ]; then
    prompt
elif [ $# -eq 1 ]; then
    setup ${1}
else
    echo 'Usage: ./setup.sh [cygwin|linux|openbsd]'
    exit 1
fi
