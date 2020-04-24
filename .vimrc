" vim-plug installation:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-ragtag'
Plug 'ap/vim-css-color'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'jnurmine/Zenburn'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula'  }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'mbbill/undotree'
Plug 'nvie/vim-flake8'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'Valloric/YouCompleteMe'
Plug 'jremmen/vim-ripgrep'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
call plug#end()

" leader + nav + general -----------------------------------------------------

syntax on
let mapleader=" "
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
"set number relativenumber
set noerrorbells
set smartcase
set cursorline

" ctrlp
let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching=0

" netrw
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

" ripgrep
if executable('rg')
    let g:rg_derive_route='true'
endif
nnoremap <leader>ps :Rg<space>


" disable wrap
set nowrap

" Make `jj` and `jk` throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>

" Splitting
set splitbelow
set splitright

" buffer nav
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
" buffer resize
if has("mac")
    nnoremap ˙ :vertical resize -3<CR>
    nnoremap ∆ :resize +3<CR>
    nnoremap ˚ :resize -3<CR>
    nnoremap ¬ :vertical resize +3<CR>
else
    nnoremap <M-h> :vertical resize -3<CR>
    nnoremap <M-j> :resize +3<CR>
    nnoremap <M-k> :resize -3<CR>
    nnoremap <M-l> :vertical resize +3<CR>
endif

" move selection
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" undo
nnoremap <leader>u :UndotreeShow<CR>

" tab / space management
set showmatch                   " show matching brackets
set autoindent                  " set the cursor at same indent as line above
set smartindent                 " try to be smart about indenting (C-style)
set expandtab                   " expand <Tab>s with spaces; death to tabs!
set shiftwidth=4                " spaces for each step of (auto)indent
set softtabstop=4               " set virtual tab stop (compat for 8-wide tabs)
set tabstop=4                   " for proper display of files with tabs
set shiftround                  " always round indents to multiple of shiftwidth
set copyindent                  " use existing indents for new indents
set preserveindent              " save as much indent structure as possible

" smaller indentation for html and xml
autocmd FileType html,xml setlocal shiftwidth=2 softtabstop=2 tabstop=2

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

" wildmenu
set path+=**
set wildmenu
set wildignore+=**/.git/**
set hidden

" vim airline ----------------------------------------------------------------

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" autocompletion (ycm + coc) -------------------------------------------------

"autocomplete
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

"custom keys
fun! GoYCM()
    nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <silent> <leader>gf :YcmCompleter FixIt<CR>
    nnoremap <buffer> <silent> <leader>gh :YcmCompleter GetDoc<CR>
    nnoremap <buffer> <silent> <leader>gt :YcmCompleter GetType<CR>
    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

fun! GoCoc()
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <buffer> <silent><expr> <C-space> coc#refresh()

    " GoTo code navigation.
    nmap <buffer> <leader>gd <Plug>(coc-definition)
    nmap <buffer> <leader>gy <Plug>(coc-type-definition)
    nmap <buffer> <leader>gi <Plug>(coc-implementation)
    nmap <buffer> <leader>gf <Plug>(coc-fix-current)
    nmap <buffer> <leader>gr <Plug>(coc-references)
    nnoremap <buffer> <leader>cr :CocRestart
endfun

set statusline^=%{coc#status()}

autocmd FileType typescript :call GoYCM()
autocmd FileType cpp,cxx,h,hpp,c,python,python3 :call GoCoc()

" nerdtree -------------------------------------------------------------------

let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>

" syntastic ------------------------------------------------------------------

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" dev mappings ---------------------------------------------------------------
map <leader>py :!python %<cr>

" git gutter -----------------------------------------------------------------

" deactivate map
let g:gitgutter_map_keys = 0

" max signs
let g:gitgutter_max_signs = 400

" status line
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" mappings
nmap <leader>ggp <Plug>(GitGutterPrevHunk)
nmap <leader>ggn <Plug>(GitGutterNextHunk)
nmap <leader>ggu <Plug>(GitGutterUndoHunk)
nmap <leader>ggs <Plug>(GitGutterStageHunk)

" nerdcommenter --------------------------------------------------------------

" deactivate default mappings
let g:NERDCreateDefaultMappings = 0

" mappings
nmap <leader>cc <Plug>NERDCommenterToggle
vmap <leader>cc <Plug>NERDCommenterToggle

" ale ------------------------------------------------------------------------

let g:airline#extensions#ale#enabled = 1

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

let g:ale_linters = {
    \ 'python': ['flake8', 'pylint'],
    \ 'ruby': ['standardrb', 'rubocop'],
    \ 'javascript': ['eslint'],
    \}

let g:ale_fixers = {
    \ "python": ["isort", "black"]
    \}

nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>as :ALEFixSuggest<CR>

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
set statusline=%{LinterStatus()}

" vimux ----------------------------------------------------------------------

" Run the current file with rspec
nmap <Leader>rp :call VimuxRunCommand("clear; python " . bufname("%"))<CR>
" Prompt for a command to run map
nmap <Leader>vp :VimuxPromptCommand<CR>
nmap <Leader>vm :VimuxPromptCommand("make ")<CR>
nmap <Leader>vl :VimuxRunLastCommand<CR>
nmap <Leader>vi :VimuxInspectRunner<CR>
nmap <Leader>vq :VimuxCloseRunner<CR>
nmap <Leader>vx :VimuxInterruptRunner<CR>
nmap <Leader>vz :call VimuxZoomRunner()<CR>

" vifm ----------------------------------------------------------------------

nmap <leader>fm :Vifm .<CR>
