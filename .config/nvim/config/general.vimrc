" syntax
syntax on
" leader key
let mapleader=" "
" file management
set noswapfile
set nobackup
" undo
set undodir=~/.vim/undodir
set undofile
" line numbers
"set number relativenumber
set noerrorbells
set smartcase
set cursorline
set nowrap
" split
set splitbelow
set splitright
" search
set incsearch
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
autocmd FileType html,xml setlocal shiftwidth=2 softtabstop=2 tabstop=2
" trim whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()
" color / appearance
colorscheme gruvbox
set background=dark
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
let g:gruvbox_contrast_dark="soft"
set colorcolumn=80
set encoding=utf8
set showmatch                   " show matching brackets
" wildmenu
set path+=**
set wildmenu
set wildignore+=**/.git/**
set hidden
