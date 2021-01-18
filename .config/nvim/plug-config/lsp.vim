set completeopt=menuone,noinsert,noselect

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gs :lua vim.lsp.buf.signature_help()<CR>
" gr cmd mapped in telescope.vim
" nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>sld :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
          \ 'name': 'pyls',
          \ 'cmd': {server_info->['pyls']},
          \ 'allowlist': ['python'],
          \ 'workspace_config': {
          \    'pyls':
          \        {'configurationSources': ['flake8'],
          \         'plugins': {'flake8': {'enabled': v:true},
          \                     'pyflakes': {'enabled': v:false},
          \                     'pycodestyle': {'enabled': v:false},
          \                    }
          \         }
          \ }})
endif
