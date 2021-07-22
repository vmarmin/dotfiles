let g:gruvbox_contrast_dark='medium'
let g:gruvbox_invert_selection=0
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_italicize_strings=1
" transparent bg not working
let g:gruvbox_transparent_bg=1

let g:gruvbox_termcolors=256
set background=dark

" Set matching airline theme
let g:airline_theme='gruvbox'

" colorscheme gruvbox

" Force transparent bg
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
hi! Search ctermbg=black guibg=black guifg=NONE ctermfg=NONE
hi! ColorColumn ctermbg=235 guibg=#2c2d27
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
