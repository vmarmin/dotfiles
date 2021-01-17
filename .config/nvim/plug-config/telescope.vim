lua <<EOF
-- totally optional to use setup
require('telescope').setup{
    defaults = {
    prompt_position = "top",
    prompt_prefix = ">",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    }
}
EOF

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <leader>ps <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
