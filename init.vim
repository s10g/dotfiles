call plug#begin(stdpath('data') . '/plugged')
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  "Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme default

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
set termguicolors
set noshowmode

inoremap jj <ESC>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

"let g:lightline = {
"      \ 'colorscheme': 'one',
"      \ }
"
highlight LineNr term=bold cterm=NONE ctermfg=DarkGreen ctermbg=NONE gui=NONE guifg=DarkGreen guibg=NONE
