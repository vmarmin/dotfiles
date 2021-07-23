" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

lua << EOF
require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'everforest',
        -- component_separators = {'', ''},
        -- section_separators = {'', ''},
        component_separators = {'', ''},
        section_separators = {'', ''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {{'filename', path = 1, file_status = true}},
        lualine_x = {
            {
                'diagnostics',
                -- table of diagnostic sources, available sources:
                -- nvim_lsp, coc, ale, vim_lsp
                sources = {'nvim_lsp'},
                -- displays diagnostics from defined severity
                sections = {'error', 'warn', 'info', 'hint'},
                -- all colors are in format #rrggbb
                color_error = nil, -- changes diagnostic's error foreground color
                color_warn = nil, -- changes diagnostic's warn foreground color
                color_info = nil, -- Changes diagnostic's info foreground color
                color_hint = nil, -- Changes diagnostic's hint foreground color
                symbols = {error = '', warn = '', info = '', hint = ''}
            },
            'encoding',
            'fileformat'
        },
        lualine_y = {'filetype'},
        lualine_z = {'progress', 'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
        },
    tabline = {},
    extensions = {}
}
EOF
