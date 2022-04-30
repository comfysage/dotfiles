
local M = {}

-- helper functions

M.set_option = function(opts)
  for key, value in pairs(opts) do
    vim.o[key] = value
  end
end

M.color = function(hightlightGroup, text)
  return "%#"..hightlightGroup.."#"..text.."%#NonText#"
end

M.split = function(str, sp)
  if sp == nil then
    sp = "%s"
  end
  local t = {}
  for st in string.gmatch(str, "([^" .. sp .. "]+)") do
    table.insert(t, st)
  end
  return t
end

return M
