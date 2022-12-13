
-- termguicolors
vim.opt.termguicolors = true
-- foldcolumn off
vim.opt.foldcolumn = "0"
-- global statusline
vim.opt.laststatus = 3

-- fold chars
vim.opt.fillchars:append { fold="-", foldclose=">" }
-- endofbuffer chars
vim.opt.fillchars:append { eob="·" }

vim.opt.background = "dark"

-- scheme specific

-- GruvboxTheme {{{

vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_italic = 1
vim.g.gruvbox_improved_strings = 0
vim.g.gruvbox_transparent_background = 1

-- }}}

-- helpers

vim.cmd([[ command! Highlights source $VIMRUNTIME/syntax/hitest.vim ]])

vim.cmd([[
function! SynStack()
  if !exists("*synstack")
    return
  endif
  let s:val = map(synstack(line("."), col(".")), 'synIDattr(v:val, "name")')
  echo s:val 
  echo " > " .. synIDattr(synIDtrans(hlID(s:val[len(s:val) - 1])), "name")
endfunc ]])

vim.keymap.set("n", "<leader>sp", ":call SynStack()<CR>")

-- colorscheme

vim.cmd [[ colorscheme gruvboxed ]]
