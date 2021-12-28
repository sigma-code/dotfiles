require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = 'everforest',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {
        'diff',
        colored = true, -- displays diff status in color if set to true
        -- all colors are in format #rrggbb
        diff_color = {
          -- Same values like general color option can be used here.
          added    = 'DiffAdd',    -- changes diff's added color
          modified = 'DiffChange', -- changes diff's modified color
          removed  = 'DiffDelete', -- changes diff's removed color you
        },
        symbols = {added = '+', modified = '~', removed = '-'}, -- changes diff symbols
        source = nil, -- A function that works as a data source for diff.
                      -- it must return a table like
                      -- {added = add_count, modified = modified_count, removed = removed_count }
                      -- Or nil on failure. Count <= 0 won't be displayed.
      },
      'diagnostics'
    },
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'}
  },
  extensions = {}
}

