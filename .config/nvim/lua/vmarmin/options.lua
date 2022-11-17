-- meta accessors
local o = vim.o      -- global options
-- local wo = vim.wo    -- window options
-- local bo = vim.bo    -- buffer options

-- search options
o.hlsearch = false
o.incsearch = true

-- status and winbar
o.laststatus = 3
o.winbar = '%=%m %f'

-- file management
o.swapfile = false
o.backup = false
o.writebackup = false

-- line numbers
o.number = true
o.relativenumber = true
o.errorbells = false
o.smartcase = true
o.cursorline = true
o.wrap = false

-- split
o.splitbelow = true
o.splitright = true

-- indent
o.autoindent = true
o.smartindent = true
o.expandtab = true
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4
o.shiftround = true
o.copyindent = true
o.preserveindent = true
o.clipboard = "unnamedplus"

-- color / appearance
o.encoding = "utf8"
o.showmatch = true
o.termguicolors = true
o.showmode = false
o.scrolloff = 8
o.mouse = "n"

-- wildmenu
o.path = o.path .. ",**"
o.wildmenu = true
o.wildignore = o.wildignore .. "**/.git/**"
o.hidden = true
o.pumheight = 10
o.ruler = true

-- not working with lua
vim.cmd [[autocmd FileType lua,html,htmldjango,xml,json setlocal shiftwidth=2 tabstop=2 softtabstop=2]]
vim.cmd [[autocmd FileType h,hpp,c,cc,hh,cpp,qml setlocal shiftwidth=3 tabstop=3 softtabstop=3 colorcolumn=100]]
vim.cmd [[autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=80]]
-- zimmer: to remove after
vim.cmd [[autocmd FileType typescript setlocal filetype=xml shiftwidth=2 tabstop=2 softtabstop=2; LspRestart]]
-- zimmer end
vim.cmd [[set formatoptions-=cro]]
vim.cmd [[let g:netrw_dirhistmax=0]]
vim.cmd [[let g:netrw_banner = 0]]
vim.cmd [[let g:netrw_liststyle = 3]]
vim.cmd [[let g:netrw_browse_split = 4]]
vim.cmd [[let g:netrw_altv = 1]]
vim.cmd [[let g:netrw_winsize = 20]]
