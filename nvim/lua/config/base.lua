
vim.cmd([[ syntax on ]])

vim.opt.encoding="utf-8"
vim.opt.spelllang:append { "en_gb", "fr" }
vim.opt.mouse= "nv"

-- settings {{{

-- basic UI
vim.opt.errorbells = false
vim.opt.cursorline = false
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.smarttab = true
vim.opt.conceallevel = 2

vim.opt.shortmess="filnrxoOtTIF"

-- When editing vim and markdown files don't show numbers
vim.cmd [[ au BufReadPost,BufRead,BufNewFile *.vim set nonu ]]
vim.cmd [[ au BufReadPost,BufRead,BufNewFile *.markdown set nonu ]]
--// let g:vim_markdown_follow_anchor = 1

-- indention
vim.opt.cindent = true
vim.opt.smartindent = true

-- no tab indention
vim.opt.tabstop = 1
vim.opt.softtabstop = 1
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Lifecycle
vim.opt.swapfile = false
vim.opt.backup = false
vim.cmd [[ set undodir=~/.undodir ]]
vim.opt.undofile = true
vim.opt.hidden = true

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Scrolling
vim.opt.scrolloff = 5

-- Folding
vim.opt.foldenable = true
vim.opt.foldlevelstart = 0
vim.opt.foldnestmax = 4
vim.opt.foldmethod = "marker"

-- RPC Server

vim.cmd [[
function! IsServer()
  return serverlist() == ['/tmp/vi.pipe']
endfunction ]]

vim.cmd [[
function! QuitServer()
  if IsServer()
    call system("rm $VISERVER")
  endif
endfunction ]]

vim.cmd [[autocmd VimLeavePre * call QuitServer()]]

-- mkdir path

vim.cmd [[
function s:Mkdir()
  let dir = expand('%:p:h')

  if dir =~ '://'
    return
  endif

  if !isdirectory(dir)
    call mkdir(dir, 'p')
    echo 'Created non-existing directory: '.dir
  endif
endfunction

autocmd BufWritePre * call s:Mkdir()]]

-- white space
vim.cmd [[
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

nnoremap <leader>x :<C-U>call StripTrailingWhitespace()<CR>
]]

-- }}}

-- statusline
vim.cmd [[ command! -nargs=0 ToggleStatusLine if &ls == 0 | set ls=3 | set ch=1 | else | set ls=0 | set ch=0 | endif ]]

-- window splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- netrw
vim.g.netrw_liststyle = 3
vim.cmd [[hi! link netrwTreeBar NonText]]

