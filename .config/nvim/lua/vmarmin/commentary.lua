-- mappings
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>/", ":Commentary<cr>", opts)
vim.api.nvim_set_keymap("v", "<leader>/", ":Commentary<cr>", opts)
