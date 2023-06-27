local status, _ = pcall(require, 'nvim-web-devicons')
if not status then return end

require 'nvim-web-devicons'.setup {
  default = true;
}

vim.g.WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
vim.g.WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json'] = 'P'
vim.g.WebDevIconsUnicodeDecorateFileNodesExactSymbols['tsconfig.json'] = ''

-- after a re-source, fix syntax matching issues (concealing brackets):
vim.cmd [[
if exists('g:loaded_webdevicons')
call webdevicons#refresh()
endif
]]
