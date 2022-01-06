-- faster update
vim.opt.updatetime = 100
-- options
vim.g.signify_sign_add               = '+'
vim.g.signify_sign_delete            = '_'
vim.g.signify_sign_delete_first_line = '‾'
vim.g.signify_sign_change            = '~'
vim.g.signify_sign_show_count = 0
vim.g.signify_sign_show_text = 1
-- mappings
local opts = { noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<leader>sf", ":SignifyToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>gn", "<plug>(signify-next-hunk)", opts)
vim.api.nvim_set_keymap("n", "<leader>gp", "<plug>(signify-prev-hunk)", opts)
vim.api.nvim_set_keymap("n", "<leader>gN", "9999<leader>gn", opts)
vim.api.nvim_set_keymap("n", "<leader>gP", "9999<leader>gp", opts)
