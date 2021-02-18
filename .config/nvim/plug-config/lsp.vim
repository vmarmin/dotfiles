set completeopt=menuone,noinsert,noselect

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gD :lua vim.lsp.buf.declaration()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gs :lua vim.lsp.buf.signature_help()<CR>
" gr cmd mapped with telescope
" nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ss :lua vim.lsp.buf.signature_help()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>f :lua vim.lsp.buf.formatting()<CR>
vnoremap <leader>f :lua vim.lsp.buf.range_formatting()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>sld :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>dn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>dp :lua vim.lsp.diagnostic.goto_prev()<CR>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_enable_auto_popup = 1
" imap <tab> <Plug>(completion_smart_tab)
" imap <s-tab> <Plug>(completion_smart_s_tab)

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
