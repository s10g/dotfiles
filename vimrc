"# Exit the 70s
set nocompatible


"# Vimplug settings
call plug#begin('~/.vim/plugged')

    "## Plugins for basic Vim functionality including plugin management
    Plug 'VundleVim/Vundle.vim'
    Plug 's10g/vim-sensible'
    
    "## Plugins for looks
    Plug 'romainl/Apprentice'

    "## Plugins that augment functionality
    Plug 'tpope/vim-surround'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'alvan/vim-closetag'
    Plug 'Townk/vim-autoclose'
    Plug 's10g/vim-syncr'
    Plug 'scrooloose/nerdtree'
    Plug 'pbrisbin/vim-colors-off'
    
    "## Plugins not decided on yet
    "Plug 'tpope/vim-vinegar'

call plug#end()


"# Look and theme settings
set shortmess+=I
set background=light
syntax off
colorscheme off


"# Wildmenu settings
set path+=**
set wildmode=list:longest,full


"# Search settings
set ignorecase
set smartcase
set hlsearch


"# General behaviour settings
set tabstop=4
set shiftwidth=4
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
"## Move up and down by paragraph using backspace and enter in normal mode
nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {
nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }
"## Keep selected text selected when fixing indentation
vnoremap < <gv
vnoremap > >gv



"# Plugin specific settings
"## AutoClose settings
let g:AutoCloseExpandEnterOn="{"
