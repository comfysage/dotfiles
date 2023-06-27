local status, _ = pcall(require, 'lspsaga')
if not status then return end

require 'lspsaga'.setup {
  -- error_sign = '*',
  -- warn_sign = '*',
  -- hint_sign = '#',
  -- infor_sign ='*',
  ui = {
    title = false,
    border = 'rounded',
    code_action = ' ',
    expand = '>',
    collapse = '˅',
    preview = '@ ',
    diagnostic = '?',
    incoming = '< ',
    outgoing = '> ',
  },
  diagnostic_header = { "* ", "! ", "# ", "* " },

  lightbulb = {
    enable = false,
    enable_in_insert = false,
    sign = false,
    sign_priority = 40,
    virtual_text = false
  },
  symbol_in_winbar = {
    enable = false,
    separator = ' . ',
    hide_keyword = true,
    show_file = false,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
}

vim.cmd([[
hi! link LspSagaFinderSelection Search
]])

vim.cmd [[
function! Float_term()
  Lspsaga open_floaterm
  tnoremap <buffer> <ESC> <cmd>Lspsaga close_floaterm<cr>
endfunction
]]

-- vim.keymap.set("n", "<space>w", "<cmd>call Float_term()<cr>")
