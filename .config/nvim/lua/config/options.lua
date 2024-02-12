-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- search options
local opt = vim.opt
opt.hlsearch = false
opt.incsearch = true

-- status and winbar
opt.laststatus = 3
opt.winbar = "%=%m %f"

-- file management
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- line numbers
opt.number = true
opt.relativenumber = true
opt.errorbells = false
opt.smartcase = true
opt.cursorline = true
opt.wrap = false

-- split
opt.splitbelow = true
opt.splitright = true

-- indent
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftround = true
opt.copyindent = true
opt.preserveindent = true
opt.clipboard = "unnamedplus"

-- color / appearance
opt.encoding = "utf8"
opt.showmatch = true
opt.termguicolors = true
opt.showmode = false
opt.scrolloff = 8
opt.mouse = "n"

-- wildmenu
opt.wildmenu = true
opt.hidden = true
opt.pumheight = 10
opt.ruler = true
