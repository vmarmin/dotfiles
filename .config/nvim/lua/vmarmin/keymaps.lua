local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- keymap function
local keymap = vim.api.nvim_set_keymap

-- leader key
keymap("", "<space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- edit config files
keymap("n", "<leader>rc", ":edit $HOME/.config/nvim/init.lua<CR>", opts)
keymap("n", "<leader>src", ":source $HOME/.config/nvim/init.lua<CR>", opts)

-- highlight mode
keymap("n", "<F3>", ":set hlsearch!<cr>", opts)

-- escape on C-c
keymap("i", "<C-c>", "<esc>", opts)

-- window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- window resize
keymap("n", "˙", ":vertical resize -3<cr>", opts)
keymap("n", "∆", ":resize -3<cr>", opts)
keymap("n", "˚", ":resize +3<cr>", opts)
keymap("n", "¬", ":vertical resize +3<cr>", opts)
keymap("n", "<M-h>", ":resize -3<cr>", opts)
keymap("n", "<M-j>", ":vertical resize -3<cr>", opts)
keymap("n", "<M-k>", ":vertical resize +3<cr>", opts)
keymap("n", "<M-l>", ":resize +3<cr>", opts)

-- buffer navication
keymap("n", "<tab>", ":bnext<cr>", opts)
keymap("n", "<s-tab>", ":bprev<cr>", opts)

-- tabbing
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move selection
keymap("v", "J", ":m '>+1<cr>gv=gv", opts)
keymap("v", "K", ":m '<-2<cr>gv=gv", opts)

-- paste replace
keymap("v", "<leader>p", '"_dP', opts)

-- toggle numbers
keymap("n", "<leader>z", ":set invrnu invnu<cr>", opts)

-- keep view centered when navigating search results
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
