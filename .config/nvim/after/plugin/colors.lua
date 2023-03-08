---- tokyonight ------------------------------------------------------------------
--require("tokyonight").setup({
--  -- your configuration comes here
--  -- or leave it empty to use the default settings
--  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--  light_style = "day", -- The theme is used when the background is set to light
--  transparent = true, -- Enable this to disable setting the background color
--  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
--  styles = {
--    -- Style to be applied to different syntax groups
--    -- Value is any valid attr-list value for `:help nvim_set_hl`
--    comments = { italic = true },
--    keywords = { italic = true },
--    functions = {},
--    variables = {},
--    -- Background styles. Can be "dark", "transparent" or "normal"
--    sidebars = "dark", -- style for sidebars, see below
--    floats = "dark", -- style for floating windows
--  },
--  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
--  dim_inactive = false, -- dims inactive windows
--  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
--  --- You can override specific color groups to use other groups or a hex color
--  --- function will be called with a ColorScheme table
--  ---@param colors ColorScheme
--  on_colors = function(colors) end,
--  --- You can override specific highlights to use other groups or a hex color
--  --- function will be called with a Highlights and ColorScheme table
--  ---@param highlights Highlights
--  ---@param colors ColorScheme
--  on_highlights = function(highlights, colors) end,
--})
--vim.cmd("colorscheme tokyonight")

-- nord ------------------------------------------------------------------------
-- vim.g.nord_contrast = true
-- vim.g.nord_borders = false
-- vim.g.nord_disable_background = true
-- vim.g.nord_italic = true
-- vim.g.nord_uniform_diff_background = true
-- vim.g.nord_bold = false
-- require('nord').set()

-- -- nightfox --------------------------------------------------------------------
-- local options = {
--   dim_inactive = false,
--   transparent = true,
--   style = {
--     comments = 'italic',
--     keywords = 'bold',
--   }
-- }
-- require('nightfox').setup({
--   options = options,
-- })
-- vim.cmd("colorscheme nordfox")

-- everforest -----------------------------------------------------------------
vim.cmd [[
  if has('termguicolors')
    set termguicolors
  endif
  " For dark/light version.
  set background=dark
  " Set contrast.
  " This configuration option should be placed before `colorscheme everforest`.
  " Available values: 'hard', 'medium'(default), 'soft'
  let g:everforest_background = 'medium'
  let g:everforest_better_performance = 1
  let g:everforest_enable_italic = 1
  let g:everforest_transparent_background = 2
  let g:everforest_sign_column_background = 'none'
  let g:everforest_diagnostic_text_highlight = 0
  " diagnostics color --> 'grey' or 'colored'
  let g:everforest_diagnostic_virtual_text = 'grey'
  colorscheme everforest
]]

-- -- sonokai -------------------------------------------------------------------
-- vim.cmd [[
--   " The configuration options should be placed before `colorscheme sonokai`.
--   " Available values: `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`
--   let g:sonokai_style = 'default'
--   let g:sonokai_enable_italic = 1
--   let g:sonokai_disable_italic_comment = 0
--   let g:airline_theme = 'sonokai'
--   let g:sonokai_transparent_background = 1
--   let g:sonokai_sign_column_background = 'none'
--   let g:sonokai_diagnostic_text_highlight = 1
--   colorscheme sonokai
-- ]]

-- -- gruvbox -------------------------------------------------------------------
-- vim.cmd [[
--     let g:gruvbox_contrast_dark='medium'
--     let g:gruvbox_invert_selection=0
--     let g:gruvbox_italic=1
--     let g:gruvbox_bold=1
--     let g:gruvbox_italicize_strings=1
--     " transparent bg not working
--     let g:gruvbox_transparent_bg=1
--     let g:gruvbox_termcolors=256
--     set background=dark
--     " Set matching airline theme
--     let g:airline_theme='gruvbox'
--     colorscheme gruvbox
--     " Force transparent bg
--     hi! Normal ctermbg=NONE guibg=NONE
--     hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
--     hi! Search ctermbg=black guibg=black guifg=NONE ctermfg=NONE
--     hi! ColorColumn ctermbg=235 guibg=#2c2d27
--     if exists('+termguicolors')
--         let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--         let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
--     endif
-- ]]

-- -- onedark ----------------------------------------------------------------
-- vim.cmd [[
--     set background=dark
--     let g:onetdark_termcolors = 256
--     let g:onedark_terminal_italics = 1
--     colorscheme onedark
-- ]]

-- lualine --------------------------------------------------------------------
require'lualine'.setup({
  options = {
    icons_enabled = true,
    -- theme = 'nordfox',
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
})
