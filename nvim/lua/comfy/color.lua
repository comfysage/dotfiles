
local utils = require "comfy.utils"

local M = {}

M.loadColorscheme = function(colorscheme)
  --[[ local ok, _ = pcall(vim.cmd, "colorscheme" .. " " .. colorscheme)
  if not ok then
    vim.notify("colorscheme" .. " " .. colorscheme .. " " .. "Not Found.")
    return
  end ]]
  if not pcall(vim.cmd, "colorscheme" .. " " .. colorscheme, "colorscheme" .. " " .. colorscheme .. " " .. "Not Found.") then
    return
  end
end

M.loadScheme = function(scheme)
  local ok, _ = pcall(vim.cmd, "so" .. " " .. "/mnt/d/home/kitchen/config/nvim/themes/schemes/" .. scheme .. ".vim")
  if not ok then
    vim.notify("scheme" .. " " .. scheme .. " " .. "Not Found.")
    return
  end
end

M.loadTheme = function(theme)
  local ok, _ = pcall(vim.cmd, "so" .. " " .. "/mnt/d/home/kitchen/config/nvim/themes/" .. theme .. ".vim")
  if not ok then
    vim.notify("theme" .. " " .. theme .. " " .. "Not Found.")
    return
  end
end

return M

