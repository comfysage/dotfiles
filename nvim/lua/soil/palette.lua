local P = {}

P.setup = function (config)
  --[[
  --   config structure
  --   {
  --   bg: 'Normal',
  --   fg: 'Normal' | 'Constant' | 'TablineSel',
  --   accent1: 'LineNr',
  --   accent2: 'Special',
  --   }
  --]]
  local Palette = {
    bg = config.bg,
    main = config.fg0,
    accent = config.fg1,
    normal = config.accent0,
    special = config.accent1,
    separator = {
    },
  }

  return Palette
end

return P
