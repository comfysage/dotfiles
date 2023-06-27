return {
  'rebelot/kanagawa.nvim', lazy = true,
  config = function()
    local default_colors = require 'kanagawa.colors'.setup()

    local overrides = {
      -- TabLine
      TabLine = { fg = default_colors.sumiInk4, bg = default_colors.sumiInk1 },
      TabLineSel = { fg = default_colors.autumnYellow, bg = default_colors.sumiInk1 },
    }

    function LoadAirlineTheme(dark)
      local highlights = {}
      -- Airline
      for i in ipairs({ 1, 2, 3, 4 }) do
        highlights['GruvboxBg' .. i - 1] = { fg = default_colors['sumiInk' .. i - dark], bg = default_colors.sumiInk0 }
      end
      return highlights
    end

    overrides = MT(overrides, LoadAirlineTheme(0))

    require 'kanagawa'.setup {
      undercurl = true, -- enable undercurls
      commentStyle = { italic = false },
      functionStyle = {},
      keywordStyle = { italic = false },
      statementStyle = { bold = true },
      typeStyle = {},
      variablebuiltinStyle = { italic = false },
      specialReturn = true, -- special highlight for the return keyword
      specialException = true, -- special highlight for exception handling keywords
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      globalStatus = false, -- adjust window separators highlight for laststatus=3
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {},
      overrides = overrides,
    }
  end
}
