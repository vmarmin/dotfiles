-- totally optional to use setup
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.5,
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {".svn/"},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {
        "absolute",
        -- "shorten",
    },
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

-- mappings
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope git_files<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files hidden=true prompt_prefix=🔍<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>vrc", ":lua require('telescope.builtin').find_files({prompt_title='< VimRC >', cwd='$HOME/.config/nvim'})<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>Telescope git_commits<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>gfl", "<cmd>Telescope git_bcommits<cr>", opts)
