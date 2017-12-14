# My dotfiles
Clone the repo into i.e. ~/.dotfiles, cd into .dotfiles, run setup.sh

## setup.sh
A simple shell script which symlinks .minttyrc, .dir_colors, .bashrc and .vimrc in your ~ with the files in this repo


### The script creates the following symlinks
```
ln -sf $(pwd)/minttyrc ~/.minttyrc
ln -sf $(pwd)/dir_colors ~/.dir_colors
ln -sf $(pwd)/bashrc ~/.bashrc
ln -sf $(pwd)/vimrc ~/.vimrc
```


### The script then runs Vim with the new .vimrc to install plugins and then exits.
