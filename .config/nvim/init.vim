"                        _
"  _ __   ___  _____   _(_)_ __ ___
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
"

" General settings
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim

if exists('g:vscode')
  " VS Code extension
  source $HOME/.config/nvim/vscode/settings.vim
else
  " Themes
  " source $HOME/.config/nvim/themes/airline.vim
  " source $HOME/.config/nvim/themes/gruvbox.vim
  " source $HOME/.config/nvim/themes/dracula.vim
  " source $HOME/.config/nvim/themes/palenight.vim
  " source $HOME/.config/nvim/themes/molokai.vim
  source $HOME/.config/nvim/themes/sonokai.vim
  " source $HOME/.config/nvim/themes/ayu.vim
  " source $HOME/.config/nvim/themes/oceanic_next.vim
  " source $HOME/.config/nvim/themes/onedark.vim
  " Enable transparency
  " source $HOME/.config/nvim/themes/commons.vim
endif

" Add paths to node and python here
if !empty(glob("~/.config/nvim/paths.vim"))
  source $HOME/.config/nvim/paths.vim
endif

" Better nav for omnicomplete TODO figure out why this is being overridden
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
