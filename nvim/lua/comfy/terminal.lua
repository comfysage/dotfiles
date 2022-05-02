
local M = {}

-- Commands

M.floatingTerminal = function ()
 local buf = vim.api.nvim_create_buf(true, false)
 vim.api.nvim_buf_set_name(buf, "term://zsh")
 local win = vim.api.nvim_get_current_win()

 local height = vim.api.nvim_win_get_height(win) - 3
 local width = vim.api.nvim_win_get_width(win)

 local windowHeight = math.floor( height / 5 * 4 )
 local windowWidth  = math.floor( width / 5 * 4 )

 local yOffSet = math.floor( ( height / 2 ) - ( windowHeight / 2 ) )
 local xOffSet = math.floor( ( width / 2 ) - ( windowWidth / 2 ) )

 vim.api.nvim_open_win(buf, true, {
  relative = 'win',
  border = 'rounded',
  row = yOffSet,
  col = xOffSet,
  width = windowWidth,
  height = windowHeight
 })
end

-- Open Terminal

vim.keymap.set("n", "tt", function ()
 local buf = vim.api.nvim_get_current_buf()
 vim.api.nvim_buf_set_name(buf, "term://zsh")
end)

return M
