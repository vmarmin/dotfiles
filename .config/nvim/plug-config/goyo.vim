function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set scrolloff=999
endfunction

function! s:goyo_leave()
    set showmode
    set showcmd
    set scrolloff=5
endfunction

nmap <leader>go :Goyo<CR>
let g:goyo_width="50%"
let g:goyo_height="85%"

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()