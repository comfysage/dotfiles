
vim.g.ranger_map_keys = 0

vim.cmd([[command! -nargs=0 RangerTree :vs | :wincmd l | :RangerWorkingDirectory]])

-- open ranger when vim opens a directory
-- vim.g[ranger_replace_netrw] = 1
