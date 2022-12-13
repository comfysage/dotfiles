local status, _ = pcall(require, 'telescope')
if not status then return end

-- Setup

require('telescope').setup{
  defaults = {
    prompt_prefix = '$ ',
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    file_ignore_patterns = {"node_modules", ".git"},
    borderchars = {
      { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      prompt = {"─", "│", "-", "│", '┌', '┐', "┘", "└"},
      results = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    },
    --[[ borderchars = {
      prompt = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' };
      results = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' };
      preview = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' };
    }; ]]
  },
extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,
    },
  }
}

-- Extensions

require 'telescope' .load_extension 'fzf'
require 'telescope' .load_extension 'file_browser'

-- Custom

vim.keymap.set("n", "<space>t", ":Telescope<CR>")
vim.keymap.set("n", "<space><space>", "<cmd>lua require'config.plugin.telescope'.space{}<CR>")
vim.keymap.set("n", "<space>fr", "<cmd>lua require'config.plugin.telescope'.grep{}<CR>")
vim.keymap.set("n", "<space>fv", "<cmd>lua require'config.plugin.telescope'.edit_dotfiles()<CR>")
vim.keymap.set("n", "<space>ff", "<cmd>lua require'config.plugin.telescope'.explorer{}<CR>")

vim.keymap.set("n", "<space>fs", "<cmd>lua require'config.plugin.telescope'.symbols{}<CR>")
vim.keymap.set("n", "<space>fg", "<cmd>lua require'config.plugin.telescope'.git_files{}<CR>")

-- file_browser ( use Shift-Enter to create from prompt )
vim.keymap.set("n", "<space>fd", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>")

vim.keymap.set("n", "<space>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
vim.keymap.set("n", "<space>ft", "<cmd>lua require('telescope.builtin').filetypes()<CR>")

vim.keymap.set("n", "<C-t>", "<cmd>lua require('telescope.builtin').colorscheme()<CR>")
