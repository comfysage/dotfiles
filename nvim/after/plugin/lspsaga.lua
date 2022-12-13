local status, _ = pcall(require, 'lspsaga')
if not status then return end

local saga = require 'lspsaga'

saga.init_lsp_saga {
  -- error_sign = '*',
  -- warn_sign = '*',
  -- hint_sign = '#',
  -- infor_sign ='*',
  diagnostic_header = { "* ", "! ", "# ", "* " },
  border_style = 'rounded',

  code_action_icon = " ",
  code_action_lightbulb = {
      cache_code_action = true,
      enable = false,
      enable_in_insert = false,
      sign = false,
      sign_priority = 40,
      update_time = 150,
      virtual_text = false
  }
}

vim.cmd([[
hi! link LspSagaFinderSelection Search
]])
