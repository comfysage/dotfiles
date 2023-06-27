return { {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require 'lualine'.setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',-- { left = '', right = '' },
        section_separators = '',-- { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1,1) end } },
        lualine_b = { 'branch', function() vim.fn.expand('%:.:h') end, 'diff', { 'diagnostics', symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' } } },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'encoding', 'fileformat' },
        lualine_z = { function() vim.fn.expand('%l:%L') end }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },

        lualine_x = { function() vim.fn.expand('%l:%L') end },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},

      winbar = {},
      inactive_winbar = {},

      extensions = {}
    }
  end
} }
