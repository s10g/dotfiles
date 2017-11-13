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

function fuck()
{
    echo "fuck"
}

export -f home
export -f work
export -f fuck

# Aliases
alias ll="ls -l"


# Colored ls output
eval `dircolors ~/.dir_colors`
alias ls="ls --color"


# Get current branch in git repository, if in a git repostory directory
# function parse_git_branch() {
#        BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
#        if [ ! "${BRANCH}" == "" ]
#        then
#                echo "[${BRANCH}]"
#        else
#                echo ""
#        fi
#}

# the prompt
#export PS1="\[\e[35m\]\u\[\e[m\]\[\e[35m\]@\[\e[m\]\[\e[35m\]\h\[\e[m\]\[\e[36m\]:\[\e[m\]\[\e[36m\]\w\[\e[m\] \[\e[33m\]\`parse_git_branch\`\[\e[m\]\\$ "
#export PS1="\[\e[35m\]\u\[\e[m\]\[\e[35m\]@\[\e[m\]\[\e[35m\]\h\[\e[m\]\[\e[36m\]:\[\e[m\]\[\e[36m\]\w\[\e[m\] \[\e[33m\]\`parse_git_branch\`\[\e[m\]\[\e[32m\]\\$\[\e[m\] "

