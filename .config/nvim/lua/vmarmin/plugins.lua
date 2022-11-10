local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer: close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocmd to reload neovim when plugins.lua is updated
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Protected call to require packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins
return packer.startup(function(use)
  -- packer
  use "wbthomason/packer.nvim"

  -- popup & plenary
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- versioning
  use "tpope/vim-fugitive"
  use "mhinz/vim-signify"

  -- colorschemes / appearance
  use "shaunsingh/nord.nvim"
  use "EdenEast/nightfox.nvim"
  use "mhinz/vim-startify"
  use "sainnhe/sonokai"
  use "sainnhe/everforest"
  use "morhetz/gruvbox"
  use "joshdick/onedark.vim"
  use "tpope/vim-ragtag"
  use "kyazdani42/nvim-tree.lua"
  use "hoob3rt/lualine.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "ryanoasis/vim-devicons"
  use "tpope/vim-commentary"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "tpope/vim-repeat"
  use "jiangmiao/auto-pairs"
  use "norcalli/nvim-colorizer.lua"
  use "sheerun/vim-polyglot"
  use "tpope/vim-surround"

  -- cmp
  use "nvim-telescope/telescope.nvim"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "simrat39/rust-tools.nvim"
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
