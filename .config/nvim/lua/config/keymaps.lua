-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = {
  noremap = true,
  silent = true,
}

keymap.set("n", "<F3>", ":set hlsearch!<cr>", opts)
keymap.set("n", "˙", ":vertical resize -3<cr>", opts)
keymap.set("n", "∆", ":resize -3<cr>", opts)
keymap.set("n", "˚", ":resize +3<cr>", opts)
keymap.set("n", "¬", ":vertical resize +3<cr>", opts)
keymap.set("n", "<M-h>", ":resize -3<cr>", opts)
keymap.set("n", "<M-j>", ":vertical resize -3<cr>", opts)
keymap.set("n", "<M-k>", ":vertical resize +3<cr>", opts)
keymap.set("n", "<M-l>", ":resize +3<cr>", opts)
keymap.set("n", "<tab>", ":bnext<cr>", opts)
keymap.set("n", "<s-tab>", ":bprev<cr>", opts)
keymap.set("i", "<C-c>", "<esc>", opts)
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
keymap.set("v", "J", ":m '>+1<cr>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<cr>gv=gv", opts)
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)
