local on_attach = require'completion'.on_attach
require'lspconfig'.tsserver.setup{ on_attach=on_attach }
require'lspconfig'.clangd.setup{ on_attach=on_attach }
require'lspconfig'.pyls.setup{ on_attach=on_attach }
--- lua require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach }
--- lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
--- lua require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }

