set background=dark
colorscheme palenight
let g:airline_theme = "palenight"
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif
let g:palenight_terminal_italics=1

