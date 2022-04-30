
local soil = R( "soil.soil" )

-- Main Call

soil.setup {
 separator = {
  left = "",
  right = "",
 },
 modes = {
  n = {
   Left = {
   },
   Middle = {
    --[[ {
     Name = "file.Name",
     Type = "main",
     separator = {false, false},
    }, ]]
    -- {
    --   Name = "file.Language",
    --   Type = "special",
    --   separator = {false, false},
    -- }
   },
   Right = {
    -- {
    --   Name = "file.AbsolutePath",
    --   Type = "normal",
    --   separator = {false, false},
    -- },
    {
     Name = "file.Language",
     Type = "special",
     separator = {false, false},
    },
    {
     Name = "position.lineNumber",
     Type = "accent",
     separator = {false, false}
    },
    {
     Name = "position.progress",
     Type = "special",
     separator = {false, false}
    }
   },
  },
  i = {
   Left = {
   },
   Middle = {
   },
   Right = {
    {
     Name = "position.progress",
     Type = "special",
     separator = {false, false}
    }
   },
  }
 },
 Palette = {
  bg = 'Normal',
  fg0 = 'TabLineSel',
  fg1 = 'Constant',
  accent0 = 'LineNr',
  accent1 = 'Special',
 },
}
