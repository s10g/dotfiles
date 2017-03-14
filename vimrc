set nocompatible

"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    "-------------------=== Vundle itself ===-----------------------
    Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required


    "-------------------=== Code/Project navigation ===-------------
    Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files
    Plugin 'tpope/vim-vinegar'                  " tpope's directory explorer
    "Plugin 'tpope/vim-fugitive'                 " tpope's fugitive


    "-------------------=== Other ===-------------------------------
    Plugin 'altercation/vim-colors-solarized'   " Theme
    Plugin 'vim-airline/vim-airline'            " Lean & mean status/tabline for vim
    "Plugin 'vim-airline/vim-airline-themes'     " Themes for airline


    "-------------------=== Snippets support ===--------------------


    "-------------------=== Languages support ===-------------------


    "-------------------=== Python  ===-----------------------------


call vundle#end()                           " required
filetype on
filetype plugin on
filetype plugin indent on


"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight
set background=dark                         " sets the background to dark (for use with solarized theme)
colorscheme solarized                       " the solarized theme
set t_Co=256                                " set 256 colors
set encoding=utf-8                          " utf-8 by default
set number                                  " show line numbers
set ruler                                   " is this needed with airline bar?
set ttyfast                                 " terminal acceleration
set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code
set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}
set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files
set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?
set scrolloff=10                            " let 10 lines before/after cursor during scroll
set clipboard=unnamed                       " use system clipboard
set laststatus=2                            " which statusline mode we use


"=====================================================
"" Keyboard remaps
"=====================================================
inoremap jj <ESC>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


"=====================================================
"" Search settings
"=====================================================
set incsearch	                            " incremental search
set ignorecase                              " ignores case in searches unless...
set smartcase                               " ... your search contains an upper case character
"set hlsearch	                            " highlight search results


"=====================================================
"" Airline settings
"=====================================================
let g:airline#extensions#tabline#enabled=1
