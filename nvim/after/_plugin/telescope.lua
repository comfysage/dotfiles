local status, _ = pcall(require, 'telescope')
if not status then return end

-- Setup

require('telescope').setup{
  defaults = {
    prompt_prefix = '$ ',
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    file_ignore_patterns = {"node_modules", "%.git/"},
    borderchars = {
      { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      prompt = {"─", "│", "─", "│", '┌', '┐', "┘", "└"},
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
      hijack_netrw = false,
    },
  },
  pickers = {
    find_files = {
      disable_devicons = true
    },
  },
}

-- Extensions

require 'telescope' .load_extension 'fzf'
require 'telescope' .load_extension 'file_browser'

