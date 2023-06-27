-- When editing vim and markdown files don't show numbers
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.vim', '*.md' },
  callback = function ()
    vim.opt_local.number = false
  end,
  desc = 'remove line numbers',
})

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function ()
    vim.cmd('startinsert')
  end,
  desc = 'start insert mode on TermOpen',
})

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function ()
    vim.opt_local.number = false
  end,
  desc = 'remove line numbers',
})

-- RPC Server

local is_server = function ()
  local sl = vim.fn.serverlist()
  return vim.tbl_contains(sl, '/tmp/vi.pipe')
end

local quit_server = function ()
  if is_server() then
    vim.fn.system { 'rm', '/tmp/vi.pipe' }
  end
end

local server_au_id = vim.api.nvim_create_augroup('RPCServer', { clear = true })
vim.api.nvim_create_autocmd('UIEnter', {
  once = true,
  group = server_au_id,
  callback = function ()
    if is_server() then
      vim.api.nvim_create_autocmd('VimLeavePre', {
        once = true,
        group = server_au_id,
        callback = function ()
          quit_server()
        end
      })
    end
  end
})

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

-- statusline
vim.api.nvim_create_user_command('ToggleStatusLine', function()
  if vim.api.nvim_get_option('laststatus') == 0 then
    vim.opt.laststatus = 3
    vim.opt.cmdheight = 1
  else
    vim.opt.laststatus = 0
    vim.opt.cmdheight = 0
  end
end, {})

-- netrw
vim.g.netrw_liststyle = 3
vim.cmd [[hi! link netrwTreeBar NonText]]

-- wsl yank support
vim.cmd [[
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' && v:event.regname ==# '*' | echo v:event | call system(s:clip, @0) | endif
  augroup END
endif
]]
