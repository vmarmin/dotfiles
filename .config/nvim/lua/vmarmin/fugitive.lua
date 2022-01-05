local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>gg", ":Git<space>", opts)
vim.api.nvim_set_keymap("n", "<leader>gs", ":G<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gc", ":GCheckout<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gh", ":diffget //2", opts)
vim.api.nvim_set_keymap("n", "<leader>gl", ":diffget //3", opts)
