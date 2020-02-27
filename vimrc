if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
call plug#end()

set expandtab
set tabstop=4
set shiftwidth=4
set noshowmatch
set hlsearch
set clipboard=unnamed
set hidden
set splitbelow
set splitright
set nobackup
set nowritebackup
set noswapfile
set number
set list
set background=dark

inoremap jj <ESC>
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType go setlocal noexpandtab shiftwidth=8 tabstop=8
