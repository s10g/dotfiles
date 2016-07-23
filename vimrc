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

    "-------------------=== Other ===-------------------------------
    Plugin 'vim-airline/vim-airline'            " Lean & mean status/tabline for vim
    Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
    Plugin 'vim-scripts/wombat256.vim'          " The wombat256 theme

    "-------------------=== Snippets support ===--------------------


    "-------------------=== Languages support ===-------------------
    "Plugin 'scrooloose/syntastic'               " scrooloose's syntax thing
    "Plugin 'davidhalter/jedi-vim'               " code completion


    "-------------------=== Python  ===-----------------------------


call vundle#end()                           " required
filetype on
filetype plugin on
filetype plugin indent on


"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight

set t_Co=256                                " set 256 colors
colorscheme wombat256mod                    " set color scheme

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

set encoding=utf-8                          " utf-8 by default

set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard

set laststatus=2                            " which statusline mode we use


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
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'


"=====================================================
"" Jedi settings
"=====================================================
"let g:jedi#use_tabs_not_buffers = 1


"=====================================================
"" Syntastic settings
"=====================================================
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_enable_highlighting = 0
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['flake8', 'pylint', 'pycodestyle']
