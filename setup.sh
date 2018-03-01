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
VIM_BINARY=


# FUNCTIONS
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
            echo "Installing symlinks."
            install_symlinks cygwin
            
            echo "Installing vim-plug."
            install_vimplug

            echo "Installing plugins."
            ${VIM_BINARY} +PlugInstall +qall

            echo "Done."
            ;;

        linux)
            echo "Installing symlinks."
            install_symlinks linux

            echo "Installing vim-plug."
            install_vimplug

            echo "Installing plugins."
            ${VIM_BINARY} +PlugInstall +qall

            echo "Done."
            ;;

        openbsd)
            echo "Installing symlinks."
            install_symlinks openbsd

            echo "Installing vim-plug."
            install_vimplug

            echo "Installing plugins."
            ${VIM_BINARY} +PlugInstall +qall

            echo "Done."
            ;;

        *)
            echo "Not a valid setup target. Exiting."
            exit 1
    esac
}

install_symlinks() {
    case ${1} in
        cygwin)
            ln -sf $(pwd)/vimrc ${HOME}/.vimrc
            ln -sf $(pwd)/minttyrc ${HOME}/.minttyrc
            ln -sf $(pwd)/bashrc.cygwin ${HOME}/.bashrc
            ;;

        linux)
            ln -sf $(pwd)/bashrc.linux ${HOME}/.bashrc
            if [ -d ${HOME}/.config/nvim ]; then
                ln -sf $(pwd)/init.vim ${HOME}/.config/nvim/init.vim
            else
                mkdir -p ${HOME}/.config/nvim
                ln -sf $(pwd)/init.vim ${HOME}/.config/nvim/init.vim
            fi
            ;;

        openbsd)
            ln -sf $(pwd)/Xdefaults ${HOME}/.Xdefaults
            ln -sf $(pwd)/xsession ${HOME}/.xsession
            ln -sf $(pwd)/profile ${HOME}/.profile
            if [ -d ${HOME}/.config/nvim ]; then
                ln -sf $(pwd)/init.vim ${HOME}/.config/nvim/init.vim
            else
                mkdir -p ${HOME}/.config/nvim
                ln -sf $(pwd)/init.vim ${HOME}/.config/nvim/init.vim
            fi
            ;;

        *)
            echo "Unrecognized target to install symlinks for. Exiting."
            exit 1
            ;;
    esac
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

    # Check for installed *vim type and prioritize Neovim over Vim
    if [ -e ${LINUX_NVIM_BINARY} ]; then
        VIM_BINARY=${LINUX_NVIM_BINARY}
        curl ${CURL_OPTIONS} ${VIMPLUG_NVIM_INSTALL_LOCATION} --create-dirs ${VIMPLUG_URL}
    elif [ -e ${OPENBSD_NVIM_BINARY} ]; then
        VIM_BINARY=${OPENBSD_NVIM_BINARY}
        curl ${CURL_OPTIONS} ${VIMPLUG_NVIM_INSTALL_LOCATION} --create-dirs ${VIMPLUG_URL}
    elif [ -e ${LINUX_VIM_BINARY} ]; then
        VIM_BINARY=${LINUX_VIM_BINARY}
        curl ${CURL_OPTIONS} ${VIMPLUG_VIM_INSTALL_LOCATION} --create-dirs ${VIMPLUG_URL}
    elif [ -e ${OPENBSD_VIM_BINARY} ]; then
        VIM_BINARY=${OPENBSD_VIM_BINARY}
        curl ${CURL_OPTIONS} ${VIMPLUG_VIM_INSTALL_LOCATION} --create-dirs ${VIMPLUG_URL}
    else
        echo "Neither Neovim nor Vim found. Ex(c)iting."
        exit 1
    fi
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
