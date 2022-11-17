require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'nordfox',
    -- theme = 'everforest',
    -- component_separators = {'', ''},
    -- section_separators = {'', ''},
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'filename', path = 1, file_status = true},
    {
      'diff',
      colored = true, -- displays diff status in color if set to true
      -- all colors are in format #rrggbb
      color_added = nil, -- changes diff's added foreground color
      color_modified = nil, -- changes diff's modified foreground color
      color_removed = nil, -- changes diff's removed foreground color
      symbols = {added = '+', modified = '~', removed = '-'} -- changes diff symbols
    }
  },
  lualine_x = {
    {
      'diagnostics',
      -- table of diagnostic sources, available sources:
      -- nvim_lsp, coc, ale, vim_lsp
      sources = {'nvim_diagnostic'},
      -- displays diagnostics from defined severity
      sections = {'error', 'warn', 'info', 'hint'},
      -- all colors are in format #rrggbb
      color_error = "#cc241d", -- changes diagnostic's error foreground color
      color_warn = "#d79921", -- changes diagnostic's warn foreground color
      color_info = "#689d6a", -- Changes diagnostic's info foreground color
      color_hint = "#928374", -- Changes diagnostic's hint foreground color
      symbols = {error = '', warn = '', info = '', hint = ''}
    },
    'encoding',
    'fileformat'
  },
  lualine_y = { 'filetype' },
  lualine_z = {'location', 'progress'},
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
