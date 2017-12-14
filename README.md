# My dotfiles
Clone the repo into i.e. ~/.dotfiles, cd into .dotfiles, run setup.sh

## setup.sh
A simple shell script which symlinks .minttyrc, .dir_colors, .bashrc and .vimrc in your ~ with the files in this repo


### The script creates the following symlinks
```
ln -sf $(pwd)/minttyrc ~/.minttyrc
ln -sf $(pwd)/bashrc ~/.bashrc
ln -sf $(pwd)/vimrc ~/.vimrc
```


### The script then runs Vim with the new .vimrc to install plugins and then exits.

# stuff i need to decide on
```
#eval `dircolors ~/.dir_colors`

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
```
