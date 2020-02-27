call plug#begin(stdpath('data') . '/plugged')
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

set number
set hidden
set list
set splitright
set splitbelow
set ignorecase
set smartcase
set guicursor=
set autowrite
set nobackup
set nowritebackup
set noswapfile
set clipboard=unnamed

inoremap jj <ESC>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
