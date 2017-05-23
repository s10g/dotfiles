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
    Plugin 'romainl/flattened'

    "## Plugins that augment functionality
    Plugin 'tpope/vim-vinegar'
    Plugin 'tpope/vim-surround'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'alvan/vim-closetag'
    Plugin 'Townk/vim-autoclose'

    "## Plugins not decided on yet

call vundle#end()
filetype plugin indent on

"# Auto commands
"## Change indentation levels for certain file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"## Change the working directory to that of the currently active buffer
autocmd BufEnter * silent! lcd %:p:h

"# Look and theme settings
set shortmess+=I
colorscheme flattened_dark


"# Searching and wildmenu settings
set path+=**
set wildmode=list:longest,full
set incsearch
set ignorecase
set smartcase
set hlsearch


"# General behaviour settings
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set cursorline
set noshowmatch
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
let g:AutoCloseExpandEnterOn="{"
