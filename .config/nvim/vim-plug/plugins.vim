" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.nvim/plugged')
    " git
    Plug 'tpope/vim-fugitive'
    Plug 'stsewd/fzf-checkout.vim'
    if has('nvim') || has('patch-8.0.902')
        Plug 'mhinz/vim-signify'
    else
        Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
    endif
    " file management
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'tpope/vim-ragtag'
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'vifm/vifm.vim'
    " looks
    Plug 'sainnhe/sonokai'
    Plug 'junegunn/goyo.vim'
    Plug 'mhartington/oceanic-next'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'ayu-theme/ayu-vim'
    Plug 'rakr/vim-one'
    Plug 'lilydjwg/colorizer'
    Plug 'ap/vim-css-color'
    Plug 'jnurmine/Zenburn'
    Plug 'gruvbox-community/gruvbox'
    Plug 'joshdick/onedark.vim'
    Plug 'dracula/vim', { 'as': 'dracula'  }
    Plug 'arcticicestudio/nord-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'mhinz/vim-startify'
    " tagbar
    Plug 'majutsushi/tagbar'
    " comment
    Plug 'tpope/vim-commentary'
    " coding
    Plug 'tpope/vim-surround'
    Plug 'honza/vim-snippets'
    " Plug 'nvie/vim-flake8'
    Plug 'dense-analysis/ale'
    Plug 'jiangmiao/auto-pairs'
    Plug 'sheerun/vim-polyglot'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " nav
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'benmills/vimux'
    Plug 'mbbill/undotree'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

