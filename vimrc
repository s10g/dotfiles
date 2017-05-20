set nocompatible

"# Vundle settings
filetype off

if has('win32') || has('win64')
    set rtp+=~/_vim/bundle/Vundle.vim
else
    set rtp+=~/.vim/bundle/Vundle.vim
endif

call vundle#begin()

    "## Plugins for basic Vim functionality including plugin management
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tpope/vim-sensible'

    "## Plugins for looks
    Plugin 'altercation/vim-colors-solarized'

    "## Plugins that augment functionality
    Plugin 'tpope/vim-vinegar'
    Plugin 'tpope/vim-surround'
    Plugin 'kien/ctrlp.vim'

    "## Plugins not decided on yet

call vundle#end()
filetype plugin indent on

"# Auto commands
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType yml setlocal shiftwidth=2 tabstop=2


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
set splitbelow
set splitright
set hidden


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
