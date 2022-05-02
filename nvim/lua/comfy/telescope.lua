
-- Setup

require('telescope').setup{
  defaults = {
    prompt_prefix = '$ ',
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    file_ignore_patterns = {"node_modules", ".git"},
  },
extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

-- Extensions

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

-- Custom Functions

local builtin = require('telescope.builtin')

local themes = require('telescope.themes')

local previewers = require("telescope.previewers")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")
local finders = require("telescope.finders")

local M = {}

-- Ivy Theme

M.IvyTheme = themes.get_ivy

-- Space Station Theme

M.StationTheme = {
    winblend = 20;
    width = 0.8;
    show_line = false;
    prompt_prefix = '$ ';
    prompt_position = 'top';
    prompt_title = '';
    preview_title = '';
    preview_width = 0.4;
  }

-- Space Station

function M.space(props)
  local opts = MergeTable(M.StationTheme, {
    -- border = true,
    -- previewer = false,
    shorten_path = true,
    hidden = true,
  })

  builtin.find_files(MergeTable(opts,props))
end

-- Explorer

function M.explorer(props)
  local opts = M.IvyTheme {
    -- border = true,
    preview = true,
    shorten_path = true,
    hidden = true,
    prompt_title = '',
    preview_title = '',
    borderchars = {
      -- preview = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
      preview = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' };
    },
  }

  builtin.find_files(MergeTable(opts,props))
end

-- Ivy Git Finder

function M.git_files(props)
  local opts = M.IvyTheme {
    -- border = true,
    -- previewer = false,
    shorten_path = true,
    hidden = true,
  }

  builtin.git_files(MergeTable(opts,props))
end

-- Dotfile Finder
function M.edit_dotfiles()
  require('comfy.telescope').explorer({
    -- cwd = '~/.config/nvim',
    cwd = '/mnt/d/home/kitchen/config/nvim',
  })
end

-- Edit Markdown Notes

function M.edit_notes()
  require('comfy.telescope').explorer({
    cwd = '~/Dropbox/notes/',
  })
end

-- 

pickers.new {
  results_title = "Resources",
  -- Run an external command and show the results in the finder window
  -- finder = finders.new_oneshot_job({"git","help", "|", "grep","-oE","'^ +\\w+'"}),
  finder = finders.new_oneshot_job({"git","help","|", "echo", "h"}),
  sorter = sorters.get_fuzzy_file(),
  previewer = previewers.new_buffer_previewer {
    define_preview = function(self, entry, status)
       -- Execute another command using the highlighted entry
      return require('telescope.previewers.utils').job_maker(
          {"git", "help", entry.value},
          self.state.bufnr,
          {
            callback = function(bufnr, content)
              if content ~= nil then
                -- require('telescope.previewers.utils').regex_highlighter(bufnr, 'git ')
              end
            end,
          })
    end
  },
}--[[ :find() ]]

-- Helpers

function MergeTable(t1, t2)
    for k,v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                MergeTable(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

return M

