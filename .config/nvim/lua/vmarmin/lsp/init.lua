local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("vmarmin.lsp.lsp-installer")
require("vmarmin.lsp.handlers").setup()
