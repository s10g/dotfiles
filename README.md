# My dotfiles
---
## setup.sh
Simple shell script to symlink the files in this repo in your ~home and set up Vim complete with plugins.


### The script creates the following symlinks
```
ln -sf $(pwd)/minttyrc ~/.minttyrc
ln -sf $(pwd)/dir_colors ~/.dir_colors
ln -sf $(pwd)/bashrc ~/.bashrc
ln -sf $(pwd)/vimrc ~/.vimrc
```


### The script then runs Vim with the new .vimrc to install plugins and then exits.
