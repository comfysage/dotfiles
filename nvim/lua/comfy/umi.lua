local popup = require "plenary.popup"

local callback = function (args)
  vim.notify(args)
end

popup.create(133, { height = 20, width = 80, cursorline = true, border = true, borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }, padding = { 5, 5, 5, 5 }, callback = callback})
