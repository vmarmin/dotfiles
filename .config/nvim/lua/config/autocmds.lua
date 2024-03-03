-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- vim.cmd [[autocmd FileType lua,html,htmldjango,xml,json setlocal shiftwidth=2 tabstop=2 softtabstop=2]]
-- vim.cmd [[autocmd FileType h,hpp,c,cc,hh,cpp,qml setlocal shiftwidth=3 tabstop=3 softtabstop=3 colorcolumn=100]]
-- vim.cmd [[autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=80]]
-- vim.cmd [[autocmd FileType typescript setlocal filetype=xml shiftwidth=2 tabstop=2 softtabstop=2; LspRestart]]
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("indent3"),
  pattern = { "h", "cpp", "hh", "c", "cc", "hpp" },
  callback = function()
    vim.opt_local.shiftwidth = 3
    vim.opt_local.tabstop = 3
    vim.opt_local.softtabstop = 3
    vim.opt_local.colorcolumn = { 100 }
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("indent2"),
  pattern = { "lua", "html", "htmldjango", "xml", "json" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("indent4"),
  pattern = { "python" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.colorcolumn = { 100 }
  end,
})

vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
  group = augroup("qmlfix"),
  pattern = { "qml", "**.qml" },
  callback = function()
    vim.bo.filetype = "javascript"
    vim.opt_local.shiftwidth = 3
    vim.opt_local.tabstop = 3
    vim.opt_local.softtabstop = 3
    vim.opt_local.colorcolumn = { 100 }
  end,
})
