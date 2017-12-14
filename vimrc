set nocompatible

"# Acquire Vimplug automatically
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"# Vimplug settings
call plug#begin('~/.vim/plugged')

    "## Plugins for basic Vim functionality including plugin management
    Plug 'VundleVim/Vundle.vim'
    Plug 'tpope/vim-sensible'

    "## Plugins for looks
    Plug 'romainl/Apprentice'
    Plug 'Yggdroot/indentLine'

    "## Plugins that augment functionality
    Plug 'tpope/vim-surround'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'alvan/vim-closetag'
    Plug 'Townk/vim-autoclose'
    Plug 's10g/vim-syncr'
    Plug 'scrooloose/nerdtree'
    Plug 'vimwiki/vimwiki'

    "## Plugins not decided on yet
    "Plug 'tpope/vim-vinegar'

call plug#end()

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
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap j gj
nnoremap k gk
nnoremap <leader>cl :set cursorline!<cr>
nnoremap fg <C-z>
nnoremap <leader>c <ESC>I<!-- <ESC>A --><ESC>

"# Plugin specific settings
"## AutoClose settings
let g:AutoCloseExpandEnterOn="{"
