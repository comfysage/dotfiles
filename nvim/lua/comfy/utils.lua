local M = {}

M.pcall = function(cmd, args, err)
  local ok, _ = pcall(cmd, args)

  if not ok then
    vim.notify(err)
    return false
  end
  return true
end

return M
