call plug#begin('~/.local/share/nvim/plugged')
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'tpope/vim-surround'
Plug 'ruby-formatter/rufo-vim'
Plug 'gabrielelana/vim-markdown'
Plug 'honza/vim-snippets'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
call plug#end()

let g:vim_jsx_pretty_colorful_config = 1

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
endif

" <leader>ld to go to definition
autocmd FileType javascript nnoremap <buffer> <c-]> :call LanguageClient_textDocument_definition()<cr>
" <leader>lh for type info under cursor
autocmd FileType javascript nnoremap <buffer> <leader>i :call LanguageClient_textDocument_hover()<cr>
" <leader>lr to rename variable under cursor
autocmd FileType javascript nnoremap <buffer> <leader>lr :call LanguageClient_textDocument_rename()<cr>
" <leader>lf to fuzzy find the symbols in the current document
autocmd FileType javascript nnoremap <buffer> <leader>lf :call LanguageClient_textDocument_documentSymbol()<cr>

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set scrolloff=2

syntax on

colorscheme codedark
highlight Error cterm=undercurl ctermfg=DarkMagenta ctermbg=Black
highlight Search ctermbg=DarkGray

let mapleader = "-"
let maplocalleader = "\\"

set number
set hidden

let g:rufo_auto_formatting = 1

" deoplete settings
" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python'
let g:python_host_prog = '/usr/bin/python2'
" Skip the check of neovim module
let g:python3_host_skip_check = 1
" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" vim-go config
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_test_timeout = '10s'
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
set updatetime=100

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
"autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>i <Plug>(go-info)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" Ctrl-P previews markdown in Chrome
autocmd Filetype markdown nmap <c-p> :!open % -a Google\ Chrome.app<cr>

" syntax highlighting for js
let g:javascript_plugin_jsdoc = 1

set expandtab
set shiftwidth=2
set softtabstop=2

set autowrite

inoremap jk <esc>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>fw :%s/\s\+$//<cr>
nnoremap <leader>- ddp
nnoremap <leader>_ ddkkp
nnoremap H ^
nnoremap L $
nnoremap <leader>b, f,a<cr><esc>==
nnoremap <c-f> :FZF<cr>
nnoremap <c-g> :Ag<cr>
nnoremap <leader>a ggVG
nnoremap <leader><esc> :noh<cr>
nnoremap ;; :%s:::cg<left><left><left><left>
" remember vim maps _ to /
nnoremap <c-_> :BLines<cr>

au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

" Neosnippet configuration
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif
