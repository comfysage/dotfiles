local helper = require "soil.helper"

local M = {}

-- Modules

M.file = {}

M.file.Path = function ()
  return "%{nvim_buf_get_name(nvim_get_current_buf())}"
end

M.file.Name = function ()
 local buf = vim.api.nvim_get_current_buf()
 local name = vim.api.nvim_buf_get_name(buf)
 local sp = vim.split(name, '/')
 return sp[table.getn(sp)]
end

M.file.RelativePath = function()
  return "%f"
end

M.file.AbsolutePath = function()
  return "%F"
end

M.file.isModified = function()
  return "%m"
end

M.file.Language = function()
  return "%y"
end

M.file.ReadOnly = function()
  return "%r"
end

M.file.smartPath = function ()

  local abs = helper.split(vim.cmd("file"), '"')
  return abs
  --[[ if string.len(M.file.AbsolutePath()) > 5 then

    local path = helper.split(M.file.AbsolutePath(), "/")

    local sm = ""
    for value in pairs(path) do
      sm = sm .. "/" .. value
    end
    return sm

  else
    return M.file.AbsolutePath()
  end ]]
end

M.file.Info = function ()
  return M.file.RelativePath() .. M.file.isModified() .. M.file.ReadOnly()
end

-- Git

M.git = {}

M.git.branch = function ()
  local status = ""
  if vim._system('git rev-parse --is-inside-work-tree') then
    status = vim._system("git branch --show-current")
    if vim._system("git status --short") then
      status = status .. "*"
    end
  else
    status = ""
  end
  return status
end

-- Position

M.position = {}

M.position.CurrentLine = function() return "%l" end

M.position.BufferLines = function() return "%L" end

M.position.LinePosition = function() return "%c" end

M.position.Percentage = function() return "%p" end

M.position.progress = function()
  return "--"..M.position.Percentage().."%%--"
end

M.position.lineNumber = function ()
  return M.position.CurrentLine() .. "/" .. M.position.BufferLines()
end

-- M.position.Cursor = function()
--   return M.position.CurrentLine.."/"..M.position.BufferLines--[[ ..":"..C.LinePosition ]].." "..color("TabLineSel", " ".."--"..C.Percentage().."%%--" )
-- end

-- Parts

-- M.Default = {}

-- local FileInfo = " "..M.Language()..M.ReadOnly().." "
-- local Position = " "..M.CursorPosition().." "

-- M.Default.LeftSide = color("LineNr", " "..M.RelativePath())
-- M.Default.RightSide = color("LineNr", " "..M.RelativePath()..M.isModified()..color("TabLineSel", FileInfo )..color("Special", Position )).." "

-- M.Default.FullLine = function()
--   return color("Normal","") .. "%=" .. M.Default.RightSide
-- end

-- Parts

-- M.Centered = {}

-- M.Centered.LeftSide = color("LineNr", " "..M.RelativePath())
-- M.Centered.RightSide = color("LineNr", " "..M.RelativePath()..M.isModified()..color("TabLineSel", FileInfo )..color("Special", Position )).." "

-- M.Centered.FullLine = function()
--   return color("Normal","") .. "%=" .. color("Constant", M.RelativePath()..M.isModified() ) .. color("TabLineSel", FileInfo ) .. "%=" .. color("Special", Position ) .. " "
-- end

return M
