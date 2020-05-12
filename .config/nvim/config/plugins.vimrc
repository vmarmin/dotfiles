" fzf -----------------------------------------------------------------------

if has("mac")
    set rtp+=/usr/local/opt/fzf
else
    set rtp+=~/.fzf
endif
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = 'right:60%'
let g:fzf_buffers_jump = 1
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :BLines<CR>
inoremap <C-f> :BLines<CR>
nnoremap <leader>b :Buffers!<CR>

" ripgrep --------------------------------------------------------------------
if executable('rg')
    let g:rg_derive_route='true'
endif
nnoremap <leader>ps :Rg<space>

" undo -----------------------------------------------------------------------
nnoremap <leader>u :UndotreeShow<CR>

" vim airline ----------------------------------------------------------------
let g:airline_powerline_fonts = 0
let g:airline_theme='gruvbox'
" tabline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" coc ------------------------------------------------------------------------
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


fun! GoCoc()
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    " navigate list with both tab and ctrl+[jk]
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " validate list item with <CR>
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    inoremap <buffer> <silent><expr> <C-space> coc#refresh()
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " GoTo code navigation.
    nmap <buffer> <leader>gd <Plug>(coc-definition)
    nmap <buffer> <leader>gy <Plug>(coc-type-definition)
    nmap <buffer> <leader>gi <Plug>(coc-implementation)
    nmap <buffer> <leader>qf <Plug>(coc-fix-current)
    nmap <buffer> <leader>gr <Plug>(coc-references)
    nmap <buffer> <leader>rn <Plug>(coc-rename)
    xmap <buffer> <leader>f  <Plug>(coc-format-selected)
    nmap <buffer> <leader>f  <Plug>(coc-format-selected)
    nnoremap <buffer> <leader>cr :CocRestart
endfun

set statusline^=%{coc#status()}

autocmd FileType * :call GoCoc()
" git gutter -----------------------------------------------------------------
" deactivate map
let g:gitgutter_map_keys = 0
" max signs
let g:gitgutter_max_signs = 400
" status line
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
" mappings
nmap <leader>ggp <Plug>(GitGutterPrevHunk)
nmap <leader>ggn <Plug>(GitGutterNextHunk)
nmap <leader>ggu <Plug>(GitGutterUndoHunk)
nmap <leader>ggs <Plug>(GitGutterStageHunk)

" commentary -----------------------------------------------------------------
nnoremap <leader>, :Commentary<CR>
vnoremap <leader>, :Commentary<CR>

" ale ------------------------------------------------------------------------

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

" vimux ----------------------------------------------------------------------
" Run the current file with rspec
nmap <Leader>rp :call VimuxRunCommand("clear; python " . bufname("%"))<CR>
" Prompt for a command to run map
nmap <Leader>vp :VimuxPromptCommand<CR>
nmap <Leader>vm :VimuxPromptCommand("make ")<CR>
nmap <Leader>vl :VimuxRunLastCommand<CR>
nmap <Leader>vi :VimuxInspectRunner<CR>
nmap <Leader>vq :VimuxCloseRunner<CR>
nmap <Leader>vx :VimuxInterruptRunner<CR>
nmap <Leader>vz :call VimuxZoomRunner()<CR>

" vifm ----------------------------------------------------------------------
" vifm mapping
nmap <leader>fm :Vifm<CR>
" use vifm instead of netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:vifm_replace_netrw = 1
