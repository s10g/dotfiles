# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return


# Functions to quickly take me to often used directories
function home()
{
    cd ~
}

function work()
{
    cd /cygdrive/c/Users/stig/Desktop/projects/
}

export -f home
export -f work

# Aliases
alias ll="ls -l"

# Colored ls output
alias ls="ls --color"
