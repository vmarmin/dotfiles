
" Make `jj` and `jk` throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>
" buffer nav
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <TAB> :bnext<CR>
" buffer resize (for max and other)
nnoremap ˙ :vertical resize -3<CR>
nnoremap ∆ :resize +3<CR>
nnoremap ˚ :resize -3<CR>
nnoremap ¬ :vertical resize +3<CR>
nnoremap <M-h> :vertical resize -3<CR>
nnoremap <M-j> :resize +3<CR>
nnoremap <M-k> :resize -3<CR>
nnoremap <M-l> :vertical resize +3<CR>
" tabbing
vnoremap < <gv
vnoremap > >gv
" move selection
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
" dev mappings
map <leader>py :!python %<cr>
