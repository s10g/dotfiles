set nocompatible

"# Vundle settings
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    "## Plugins for basic Vim functionality including plugin management
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tpope/vim-sensible'

    "## Plugins for looks
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'itchyny/lightline.vim'


    "## Plugins not decided on yet
    "Plugin 'tpope/vim-vinegar'
    "Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on


"# Look and theme settings
set background=dark
set shortmess+=I
colorscheme solarized


"# Searching and wildmenu settings
set path+=**
set wildmode=list:longest,full
set incsearch
set ignorecase
set smartcase
set hlsearch


"# General behaviour settings
set ttyfast
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set cursorline
set showmatch
set clipboard=unnamed
set number
set relativenumber
set scrolloff=10


"# File recovery settings (most disabled because version control anyway)
set nobackup
set nowritebackup
set noswapfile


"# Keyboard remaps
inoremap jj <ESC>
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>
nnoremap <Space> /
nnoremap <NUL> ?


"# Plugin specific settings
"## Lightline
let g:lightline = { 'colorscheme': 'solarized' }
