" Important!!
if has('termguicolors')
    set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
" Available values: `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`
let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:airline_theme = 'sonokai'
let g:sonokai_transparent_background = 1
let g:sonokai_sign_column_background = 'none'
let g:sonokai_diagnostic_text_highlight = 1

colorscheme sonokai
