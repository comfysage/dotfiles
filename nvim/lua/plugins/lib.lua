LIBS = {
  pairs = {},
  align = {},
  comment = {},
}

LoadMiniLibs = function()
  for l, c in pairs(LIBS) do
    require('mini.' .. l).setup(c)
  end
end

return {
  {
    'echasnovski/mini.nvim',
    config = function()
      LoadMiniLibs()
    end,
  },
}
