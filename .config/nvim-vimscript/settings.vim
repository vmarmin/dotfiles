" syntax
syntax on
set nocompatible

" leader key
let mapleader=" "

" filetype
filetype plugin indent on

" file management
set noswapfile
set nobackup
set nowritebackup

" undo
set undodir=~/.nvim/undodir
set undofile

" line numbers
set number relativenumber
set noerrorbells
set smartcase
set cursorline
set nowrap

" search
set nohlsearch
set incsearch

" split
set splitbelow
set splitright

" indentation
set autoindent                  " set the cursor at same indent as line above
set smartindent                 " try to be smart about indenting (c-style)
set expandtab                   " expand <tab>s with spaces; death to tabs!
set shiftwidth=4                " spaces for each step of (auto)indent
set softtabstop=4               " set virtual tab stop (compat for 8-wide tabs)
set tabstop=4                   " for proper display of files with tabs
set shiftround                  " always round indents to multiple of shiftwidth
set copyindent                  " use existing indents for new indents
set preserveindent              " save as much indent structure as possible
set clipboard=unnamedplus
autocmd FileType html,htmldjango,xml,json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType h,hpp,c,cc,hh,cpp setlocal shiftwidth=3 tabstop=3 softtabstop=3 colorcolumn=90
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=80

" trim whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" color / appearance
" set colorcolumn=80
set encoding=utf8
set t_Co=256
set showmatch                   " show matching brackets
set noshowmode
set formatoptions-=cro          " stop newline continution of comments
set termguicolors
" wildmenu
set path+=**
set wildmenu
set wildignore+=**/.git/**
set hidden
set pumheight=10
set ruler
" set mouse=a                     " allow mouse usage
set scrolloff=8                 " scroll margin

" deactivate netrw history
let g:netrw_dirhistmax=0
" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

" italics
set t_ZH=^[[3m
set t_ZR=^[[23m

" vscode specifics
if exists('g:vscode')
    " to add if need be
endif

" execude code
augroup exe_code
    autocmd!
    " python
    autocmd FileType python nnoremap <buffer> <leader>R
        \ :sp<CR> :term python %<CR> :startinsert<CR>
    " shell
    autocmd FileType bash,sh nnoremap <buffer> <leader>R
        \ :sp<CR> :term bash %<CR> :startinsert<CR>
    " javascript
    autocmd FileType javascript nnoremap <buffer> <leader>R
        \ :sp<CR> :term nodejs %<CR> :startinsert<CR>
augroup END
