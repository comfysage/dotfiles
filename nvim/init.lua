vim.opt.runtimepath:append { "/mnt/d/home/kitchen/config/nvim" }

require 'comfy.globals'

require 'config.base'
require 'config.highlights'
require 'config.maps'
require 'config.plugins'

-- load after plugins
vim.cmd [[runtime! after/plugin/**/*.lua]]

--[[ local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('config.macos')
end
if is_win then
  require('config.windows')
end ]]

--[[ todo:
- [ ] goyo & limelight

-- ]]
