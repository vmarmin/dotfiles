" vim-plug installation:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'jnurmine/Zenburn'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'jremmen/vim-ripgrep'
call plug#end()

" leader + nav + general -----------------------------------------------------

syntax on
let mapleader=" "
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nu
set relativenumber
set noerrorbells
set smartcase

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
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" buffer resize
nnoremap <C-h> :wincmd <<CR>
nnoremap <C-j> :wincmd +<CR>
nnoremap <C-k> :wincmd -<CR>
nnoremap <C-l> :wincmd ><CR>

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

" color / appearance
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark="soft"
let g:airline_theme='gruvbox'
set colorcolumn=80

" wildmenu
set path+=**
set wildmenu
set wildignore+=**/.git/**
set hidden

" YCM ------------------------------------------------------------------------

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"custom keys
map <leader>gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gr  :YcmCompleter GoToReferences<CR>
map <leader>gf  :YcmCompleter FixIt<CR>

" nerdtree -------------------------------------------------------------------

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>

" syntastic -----------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

" nerdcommenter -------------------------------------------------------------

" deactivate default mappings
let g:NERDCreateDefaultMappings = 0

" mappings
nmap <leader>cc <Plug>NERDCommenterToggle
