return {
  'crispybaccoon/aki',
  dir = ENV('KITCHEN') .. '/pan/aki',
  opts = {
    theme = "default",
    override_terminal = true,
    transparent_background = false,
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
      tabline = { reverse = true, color = 'seiun' },
      search = { reverse = false, color = 'sakaeru' },
    },
    overrides = {},
    plugins = true,
  }
}
