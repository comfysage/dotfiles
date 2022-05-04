local M = {}

M.plugin = function (name)
  vim.cmd("source " .. '/mnt/d/home/kitchen/config/nvim/plugins/' .. name .. '.vim')
end

return M
