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