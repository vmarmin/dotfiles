let g:airline#extensions#ale#enabled = 1
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_linters = {
    \ 'python': ['flake8', 'pylint'],
    \ 'ruby': ['standardrb', 'rubocop'],
    \ 'javascript': ['eslint'],
    \}
let g:ale_fixers = {
    \ "python": ["isort", "black"]
    \}
" mappings
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>as :ALEFixSuggest<CR>
nnoremap <leader>an :ALENext<CR>
nnoremap <leader>ap :ALEPrevious<CR>
" status line
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
" deactivate default mappings
let g:NERDCreateDefaultMappings = 0
" mappings
nmap <leader>cc <Plug>NERDCommenterToggle
vmap <leader>cc <Plug>NERDCommenterToggle
set statusline=%{LinterStatus()}