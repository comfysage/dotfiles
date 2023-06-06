local bind = require 'config.binding'.bind

vim.keymap.set("n", "<leader>s", "<Cmd>source %<CR>", { silent = true })
vim.keymap.set("v", "<leader>s", "<Cmd>'<,'>source<CR>", { silent = true })
bind { "<C-S>", ":<C-U>update<CR>", { silent = true } }
vim.keymap.set("v", "<C-S>", ":<C-U>update<CR>gv", { silent = true })
vim.keymap.set("i", "<C-S>", "<C-O>:update<CR>", { silent = true })

-- Ranger

bind { "<leader>f", ":Ranger<CR>" }
bind { "<leader>g", ":RangerNewTab<CR>" }
bind { "<space>r",  ":RangerTree<CR>",  }

-- Basic Keybinds {{{

bind { ";", "viw" }
-- nnoremap <C-d> <ESC>viw
-- inoremap <C-d> <ESC>viw

bind { "<space>s", "<cmd>PrettierAsync<CR>", { silent = true } }

bind { "W", "$" }
bind { "B", "^" }
--nmap <space><space> <ESC>:<BACKSPACE>zz

-- Invert NumberLine
bind { "<leader>n", ":set invnu<CR>", { silent = true } }

-- vmap <leader>c "*y
-- nmap <leader>v "*p

-- Move Selected Line up and down
-- nnoremap J <Cmd>move +1<CR>
-- nnoremap K <Cmd>move -2<CR>
vim.keymap.set("v", "J", ":move '>+1<CR>gv-gv")
vim.keymap.set("v", "K", ":move '<-2<CR>gv-gv")

-- < and > indents
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

bind { ",f", "gg=G``:w<CR>" }
bind { ",m", "<Cmd>%norm! gww<CR>" }

-- Surround Selection
vim.keymap.set("v", "o", "<ESC>'<O<ESC>'>o<ESC>gv")

vim.keymap.set("n", "++", "gcc")
vim.keymap.set("v", "++", "gc")

bind { "C", "cc<ESC>" }
bind { "<M-v>", "^v$" }

bind { "B", ":Bclose " }

-- }}}

-- Move through wrapping lines {{{

-- j/k will move virtual (wrapping) lines.
vim.cmd [[ noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j') ]]
vim.cmd [[ noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k') ]]

-- }}}

-- toggle statusline
vim.keymap.set("n", "<space><ESC>", "<Cmd>ToggleStatusLine<CR>")

-- create splits
bind { "sv", "<C-w>v" }
bind { "sh", "<Cmd>sp<CR>" }
bind { "sq", "<C-w>q" }

-- Split File {{{

bind { "<C-\\>", ":vs<CR>:wincmd l<CR>", { silent = true } }
-- nmap <silent> <space>w :vs<CR>:wincmd l<CR>:RangerWorkingDirectory<CR>

-- }}}

-- Split Navigation {{{

bind { "<space><Left>", ":wincmd h<CR>", { silent = true } }
bind { "<space><Down>", ":wincmd j<CR>", { silent = true } }
bind { "<space><Up>", ":wincmd k<CR>", { silent = true } }
bind { "<space><Right>", ":wincmd l<CR>", { silent = true } }

bind { "<space>h", ":wincmd h<CR>", { silent = true } }
bind { "<space>j", ":wincmd j<CR>", { silent = true } }
bind { "<space>k", ":wincmd k<CR>", { silent = true } }
bind { "<space>l", ":wincmd l<CR>", { silent = true } }

-- }}}

-- tab navigation
bind { "<TAB>", ":tabnext<CR>", { silent = true } }
bind { "<S-TAB>", ":tabprev<CR>", { silent = true } }

bind { "<space><TAB>", ":$tabedit<CR>", { silent = true } }

-- smoothie
vim.g.smoothie_no_default_mappings = true
bind { "<C-J>", '<cmd>call smoothie#do("\\<C-D>") <CR>', { unique = true } }
bind { "<C-K>", '<cmd>call smoothie#do("\\<C-U>") <CR>', { unique = true } }
bind { "zz", '<cmd>call smoothie#do("zz") <CR>', { unique = true } }
bind { "zt", '<cmd>call smoothie#do("zt") <CR>', { unique = true } }
bind { "zb", '<cmd>call smoothie#do("zb") <CR>', { unique = true } }
bind { "gg", '<cmd>call smoothie#do("gg") <CR>', { unique = true } }
bind { "G", '<cmd>call smoothie#do("G") <CR>', { unique = true } }

-- netrw
bind { "<space>n", "<cmd>20Lex!<CR>", { silent = true } }

local _, status = pcall(require, 'telescope')
if status then
  bind {"<space>t", ":Telescope<CR>", { desc = "Telescope" } }
  bind {"<space><space>", function() require'config.plugin.telescope'.space{} end, {}, "[Telescope] [F]ind " }
  bind {"<space>fr", function() require'config.plugin.telescope'.grep{} end, {}, "[Telescope] [F]ind St[r]ing" }
  bind {"<space>fv", function() require'config.plugin.telescope'.edit_dotfiles() end, {}, "[Telescope] [F]ind [V]im file" }
  bind {"<space>ff", function() require'config.plugin.telescope'.explorer{} end, {}, "[Telescope] [F]ind [F]ile" }
  bind {"<space>/", function() require'config.plugin.telescope'.grep_current_file{} end, {}, "[Telescope] Find in file" }

  bind {"<space>fs", function() require'config.plugin.telescope'.symbols{} end, {}, "[Telescope] [F]ind [S]ymbols" }
  bind {"<space>fg", function() require'config.plugin.telescope'.git_files{} end, {}, "[Telescope] [F]ind [G]it file" }

  bind {"<space>fd", function() require 'telescope'.extensions.file_browser.file_browser() end, {}, "[Telescope] Find with browser" }

  bind {"<space>fb", function() require('telescope.builtin').buffers() end, {}, "[Telescope] [F]ind [B]uffer" }
  bind {"<space>ft", function() require('telescope.builtin').filetypes() end, {}, "[Telescope] [F]ind File[T]ype" }
  bind {"<space>fk", function() require('telescope.builtin').keymaps() end, {}, "[Telescope] [F]ind [K]eymap" }
  bind {"<space>fh", function() require('telescope.builtin').help_tags() end, {}, "[Telescope] [F]ind [H]elp tag" }

  bind {"<C-t>", function() require('telescope.builtin').colorscheme() end, {}, "[Telescope] Find Colorscheme" }
end
