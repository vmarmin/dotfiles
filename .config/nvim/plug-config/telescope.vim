lua <<EOF
-- totally optional to use setup
require('telescope').setup{
    defaults = {
        prompt_position = "top",
        prompt_prefix = ">",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.5,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
    }
}
EOF

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <C-S-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ps <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
