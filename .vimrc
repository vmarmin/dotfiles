set nocompatible
filetype plugin on
filetype plugin indent on    " enables filetype detection

" vundle -----------------------------------------------------------------------------------

" START - Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :source $MYVIMRC
  :PluginInstall
endif
" END - Setting up Vundle - the vim plugin bundler

call vundle#begin()
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'jnurmine/Zenburn'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mbbill/undotree'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jremmen/vim-ripgrep'
call vundle#end()


" leader + nav + general ------------------------------------------------------------------------

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
let g:airline_theme='angr'
set colorcolumn=80

" wildmenu
set path+=**
set wildmenu
set wildignore+=**/.git/**
set hidden

" YCM ---------------------------------------------------------------------------------------

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"custom keys
map <leader>gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gr  :YcmCompleter GoToReferences<CR>
map <leader>gf  :YcmCompleter FixIt<CR>

" nerdtree ----------------------------------------------------------------------

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

