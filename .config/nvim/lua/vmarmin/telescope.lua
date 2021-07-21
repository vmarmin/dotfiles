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
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {
        "shorten",
        "absolute",
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
-- require('telescope').setup{
--     defaults = {
--         prompt_position = "top",
--         prompt_prefix = ">",
--         selection_strategy = "reset",
--         sorting_strategy = "ascending",
--         layout_strategy = "horizontal",
--         file_sorter =  require'telescope.sorters'.get_fuzzy_file,
--         file_ignore_patterns = {},
--         generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
--         shorten_path = true,
--         winblend = 0,
--         width = 0.75,
--         preview_cutoff = 120,
--         results_height = 1,
--         results_width = 0.5,
--         border = {},
--         borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
--         color_devicons = true,
--         use_less = true,
--     }
-- }

--- search nvim dotfiles
local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/.config/nvim",
    })
end

--- return module
return M