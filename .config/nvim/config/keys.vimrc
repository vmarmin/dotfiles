
" Make `jj` and `jk` throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>
" buffer nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>
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
