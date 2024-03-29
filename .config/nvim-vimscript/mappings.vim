" edit / source nvim rc
map <leader>rc :edit $HOME/.config/nvim/init.vim<CR>
map <leader>src :source $HOME/.config/nvim/init.vim<CR>
" escape on C-c
inoremap <C-c> <esc>
" search highlight toggle
nnoremap <F3> :set hlsearch!<cr>
nmap <F2> :wa<Bar>exe "mksession! " . v:this_session<CR>:so ~/.config/nvim/sessions
" buffer nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>
" buffer resize (for mac and other)
nnoremap ˙ :vertical resize -3<CR>
nnoremap ∆ :resize -3<CR>
nnoremap ˚ :resize +3<CR>
nnoremap ¬ :vertical resize +3<CR>
nnoremap <M-h> :vertical resize -3<CR>
nnoremap <M-j> :resize -3<CR>
nnoremap <M-k> :resize +3<CR>
nnoremap <M-l> :vertical resize +3<CR>
" tabbing
vnoremap < <gv
vnoremap > >gv
" move selection
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
" paste replace
vnoremap <leader>p "_dP
" toggle numbers
nnoremap <leader>z :set invrnu invnu<CR>
" keep view centered when navigating search results
nnoremap n nzzzv
nnoremap N Nzzzv
