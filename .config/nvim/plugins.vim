" auto-install vim-plug
if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
  if empty(g:plug_home)
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall | source $MYVIMRC
  endif
endif

call plug#begin()

" general
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'

" nvim specific
if has('nvim')
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-ragtag'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'sainnhe/sonokai'
    Plug 'sainnhe/everforest'
    Plug 'morhetz/gruvbox'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'
    Plug 'majutsushi/tagbar'
    Plug 'tpope/vim-commentary'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'tpope/vim-surround'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'nvim-lua/lsp-status.nvim'
    Plug 'folke/lsp-colors.nvim'
    Plug 'tpope/vim-repeat'
    Plug 'jiangmiao/auto-pairs'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'sheerun/vim-polyglot'
    " nav
    Plug 'mbbill/undotree'
endif

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

lua << EOF
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    { key = {"<CR>", "o", "l", "<2-LeftMouse>"},     cb = tree_cb("edit") },
    { key = {"<2-RightMouse>", "<C-]>"},             cb = tree_cb("cd") },
    { key = "<C-v>",                                 cb = tree_cb("vsplit") },
    { key = "<C-x>",                                 cb = tree_cb("split") },
    { key = "<C-t>",                                 cb = tree_cb("tabnew") },
    { key = "<",                                     cb = tree_cb("prev_sibling") },
    { key = ">",                                     cb = tree_cb("next_sibling") },
    { key = "P",                                     cb = tree_cb("parent_node") },
    { key = {"<BS>", "h", "<S-CR>"},                 cb = tree_cb("close_node") },
    { key = "<Tab>",                                 cb = tree_cb("preview") },
    { key = "K",                                     cb = tree_cb("first_sibling") },
    { key = "J",                                     cb = tree_cb("last_sibling") },
    { key = "I",                                     cb = tree_cb("toggle_ignored") },
    { key = "H",                                     cb = tree_cb("toggle_dotfiles") },
    { key = "R",                                     cb = tree_cb("refresh") },
    { key = "a",                                     cb = tree_cb("create") },
    { key = "d",                                     cb = tree_cb("remove") },
    { key = "r",                                     cb = tree_cb("rename") },
    { key = "<C-r>",                                 cb = tree_cb("full_rename") },
    { key = "x",                                     cb = tree_cb("cut") },
    { key = "c",                                     cb = tree_cb("copy") },
    { key = "p",                                     cb = tree_cb("paste") },
    { key = "y",                                     cb = tree_cb("copy_name") },
    { key = "Y",                                     cb = tree_cb("copy_path") },
    { key = "gy",                                    cb = tree_cb("copy_absolute_path") },
    { key = "[c",                                    cb = tree_cb("prev_git_item") },
    { key = "]c",                                    cb = tree_cb("next_git_item") },
    { key = "-",                                     cb = tree_cb("dir_up") },
    { key = "q",                                     cb = tree_cb("close") },
    { key = "g?",                                    cb = tree_cb("toggle_help") },
}
EOF
