return {
  'crispybaccoon/adachi.nvim',
  dir = ENV('KITCHEN') .. '/pan/adachi',
  opts = {
    theme = "default",
    override_terminal = true,
    transparent_background = true,
    contrast_dark = 'medium',
    contrast_light = 'medium',
    emphasis = {
      general = { italic = true },
      comment = {},
      keyword = { italic = true },
      type    = { type = true },
    },
    style = {
      cursorline = { soft = true, contrast_currentline = false },
      tabline = { inverse = true, color = 'orange' },
      search = { inverse = false, color = 'orange' },
    },
    overrides = {},
    plugins = true,
  }
}
