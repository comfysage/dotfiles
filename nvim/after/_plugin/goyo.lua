
vim.keymap.set("n", "<space>g", "<cmd>Goyo<CR>", { silent = true })
vim.keymap.set("n", "<space>G", "<cmd>Goyo 75%x82%<CR>", { silent = true })

vim.g.goyo_width = '80'
vim.g.goyo_height = '82%'
vim.g.goyo_linenr = 0

vim.g.limelight_paragraph_span = 1

vim.g.limelight_conceal_ctermfg = 'gray'
vim.g.limelight_conceal_guifg = 'DarkGray'

vim.cmd [[
function! s:goyo_enter()
  set noshowcmd
  " set noshowmode
  set scrolloff=999
  Limelight
  "nnoremap <buffer> <silent> l :Limelight!!<CR>
endfunction

function! s:goyo_leave()
  set showcmd
  " set showmode
  set scrolloff=5
  Limelight!
  source /mnt/d/home/kitchen/config/nvim/plugins/color.vim
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
]]
