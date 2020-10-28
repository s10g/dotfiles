" To install Vim-plug on Windows, do this in cmd.exe (Win10 has curl):
" curl -fLo %USERPROFILE%\vimfiles\autoload\plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" By not providing a dir to plug#begin(), it will pick the sensible 
" default location of %USERPROFILE%\vimfiles\plugged, which is nice
call plug#begin()
    Plug 'tpope/vim-sensible'
    Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

"colorscheme darkblue

"set background=dark
set clipboard=unnamed
set colorcolumn=110
set expandtab
set hidden
set hlsearch
set nobackup
set noshowmatch
set noswapfile
set nowritebackup
set number
set shiftwidth=4
set tabstop=4

" Make Shift + Insert do the right thing
map  <silent>  <S-Insert>  "+p
imap <silent>  <S-Insert>  <Esc>"+pa

inoremap jj <ESC>
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType go setlocal noexpandtab shiftwidth=8 tabstop=8

set wildignore+=*\\AppData\\*,*\\Application\ Data\\*

let g:netrw_fastbrowse = 0

map <F2> :enew<CR>
map <F5> :!make && ./a.out<CR>
