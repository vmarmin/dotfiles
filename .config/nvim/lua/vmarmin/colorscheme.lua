vim.cmd [[
    " " sonokai -------------------------------------------------------------------
    " " The configuration options should be placed before `colorscheme sonokai`.
    " " Available values: `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`
    " let g:sonokai_style = 'default'
    " let g:sonokai_enable_italic = 1
    " let g:sonokai_disable_italic_comment = 0
    " let g:airline_theme = 'sonokai'
    " let g:sonokai_transparent_background = 1
    " let g:sonokai_sign_column_background = 'none'
    " let g:sonokai_diagnostic_text_highlight = 1
    " colorscheme sonokai

    " " gruvbox -------------------------------------------------------------------
    " let g:gruvbox_contrast_dark='medium'
    " let g:gruvbox_invert_selection=0
    " let g:gruvbox_italic=1
    " let g:gruvbox_bold=1
    " let g:gruvbox_italicize_strings=1
    " " transparent bg not working
    " let g:gruvbox_transparent_bg=1
    " let g:gruvbox_termcolors=256
    " set background=dark
    " " Set matching airline theme
    " let g:airline_theme='gruvbox'
    " colorscheme gruvbox
    " " Force transparent bg
    " hi! Normal ctermbg=NONE guibg=NONE
    " hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
    " hi! Search ctermbg=black guibg=black guifg=NONE ctermfg=NONE
    " hi! ColorColumn ctermbg=235 guibg=#2c2d27
    " if exists('+termguicolors')
    "     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    "     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    " endif

    " everforest ----------------------------------------------------------------
    " For dark/light version.
    set background=dark
    " Set contrast.
    " This configuration option should be placed before `colorscheme everforest`.
    " Available values: 'hard', 'medium'(default), 'soft'
    let g:everforest_background = 'medium'
    let g:everforest_enable_italic = 1
    let g:everforest_transparent_background = 1
    let g:everforest_sign_column_background = 'none'
    let g:everforest_diagnostic_text_highlight = 0
    " diagnostics color --> 'grey' or 'colored'
    let g:everforest_diagnostic_virtual_text = 'grey'
    colorscheme everforest
]]
