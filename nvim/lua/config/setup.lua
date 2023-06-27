local M = {}

local default_colorscheme = "habamax" -- or "zaibatsu" or "retrobox"

---@class Config
---@field colorscheme string

---@param config Config
function M.setup(config)
  require 'config.options'
  require 'config.highlights'
  require 'config.base'
  require 'config.maps'
  require 'config.plugins'

  vim.cmd ("colorscheme " .. (config.colorscheme or default_colorscheme))
end

return M
