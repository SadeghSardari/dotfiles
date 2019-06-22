call plug#begin('~/.local/share/nvim/plugged')
Plug 'tomasiser/vim-code-dark'
call plug#end()
filetype plugin on
syntax on
colorscheme codedark
let mapleader = "-"
let maplocalleader = "\\"

set number

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python'
let g:python_host_prog = '/usr/bin/python2'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Ctrl-P previews markdown in Chrome
autocmd Filetype markdown nmap <c-p> :!chromium %<cr>

set expandtab
set shiftwidth=2
set softtabstop=2

inoremap jk <esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>fw :%s/\s\+$//<cr>
nnoremap <leader>- ddp
nnoremap <leader>_ ddkkp
nnoremap H ^
nnoremap L $
nnoremap <leader>b, f,a<cr><esc>==
nnoremap <leader>a ggVG
nnoremap <leader><esc> :noh<cr>
nnoremap ;; :%s:::cg<left><left><left><left>

