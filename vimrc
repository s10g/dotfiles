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
    Plugin 'romainl/Apprentice'
    Plugin 'Yggdroot/indentLine'

    "## Plugins that augment functionality
    Plugin 'tpope/vim-surround'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'alvan/vim-closetag'
    Plugin 'Townk/vim-autoclose'
    Plugin 's10g/vim-syncr'

    "## Plugins not decided on yet
    "Plugin 'tpope/vim-vinegar'

call vundle#end()
filetype plugin indent on

"# Auto commands
"## Change indentation levels for certain file types
"autocmd FileType html setlocal shiftwidth=2 tabstop=2
"autocmd FileType yaml setlocal shiftwidth=2 tabstop=2


"# Look and theme settings
set shortmess+=I
colorscheme apprentice

"# GUI stuff
set guifont=Consolas:h11:cANSI:qDRAFT
set guioptions-=m
set guioptions-=T
set guioptions-=r
set linespace=4

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
"set cursorline
set noshowmatch
set clipboard=unnamed
set number
set splitbelow
set splitright
set hidden
set lazyredraw
set ttyfast


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
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>m :messages<cr>

"# Plugin specific settings
"## AutoClose settings
let g:AutoCloseExpandEnterOn="{"
