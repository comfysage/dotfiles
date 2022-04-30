-- helper functions

local set_option = function(opts)
  for key, value in pairs(opts) do
    vim.o[key] = value
  end
end

local color = function(hightlightGroup, text)
  return "%#"..hightlightGroup.."#"..text.."%#NonText#"
end
 
-- Modules

local Modules = {}

Modules.RelativePath = function()
  return "%f"
end

Modules.AbsolutePath = function()
  return "%F"
end

Modules.isModified = function()
  return "%m"
end

Modules.Language = function()
  return "%y"
end

Modules.ReadOnly = function()
  return "%r"
end

-- Position

local C = {}

C.CurrentLine = "%l"

C.BufferLines = "%L"

C.LinePosition = "%c"

C.Percentage = function()
  return "%p"
end

Modules.CursorPosition = function()
  return C.CurrentLine.."/"..C.BufferLines--[[ ..":"..C.LinePosition ]].." "..color("TabLineSel", " ".."--"..C.Percentage().."%%--" )
end

-- Parts

Modules.Default = {}

local FileInfo = " "..Modules.Language()..Modules.ReadOnly().." "
local Position = " "..Modules.CursorPosition().." "

Modules.Default.LeftSide = color("LineNr", " "..Modules.RelativePath())
Modules.Default.RightSide = color("LineNr", " "..Modules.RelativePath()..Modules.isModified()..color("TabLineSel", FileInfo )..color("Special", Position )).." "

Modules.Default.FullLine = function()
  return color("Normal","") .. "%=" .. Modules.Default.RightSide
end

-- Parts

Modules.Centered = {}

Modules.Centered.LeftSide = color("LineNr", " "..Modules.RelativePath())
Modules.Centered.RightSide = color("LineNr", " "..Modules.RelativePath()..Modules.isModified()..color("TabLineSel", FileInfo )..color("Special", Position )).." "

Modules.Centered.FullLine = function()
  return color("Normal","") .. "%=" .. color("Constant", Modules.RelativePath()..Modules.isModified() ) .. color("TabLineSel", FileInfo ) .. "%=" .. color("Special", Position ) .. " "
end

-- Main Call

set_option({
  -- statusline = "%#LineNr# %f%= %F%#TabLineSel# %y %r%#CursorLineNr# %l/%L:%c %p%% "
  statusline = Modules.Centered.FullLine()
})

