" toggle mapping
nmap <leader>sf :SignifyToggle<CR>
" faster update time
set updatetime=100
" hunk navigation
nmap <leader>gn <plug>(signify-next-hunk)
nmap <leader>gp <plug>(signify-prev-hunk)
nmap <leader>gN 9999<leader>gj
nmap <leader>gP 9999<leader>gk
" symbols
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1
