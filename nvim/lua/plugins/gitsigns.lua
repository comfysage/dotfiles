return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs                        = {
        add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        untracked    = { hl = 'GitSignsAdd', text = '┆', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      },
      signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir                 = {
        interval = 1000,
        follow_files = true
      },
      attach_to_untracked          = true,
      current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<summary>, <author_time:%Y-%m-%d> ~ <author>',
      sign_priority                = 6,
      update_debounce              = 100,
      status_formatter             = nil,   -- Use default
      max_file_length              = 40000, -- Disable if file is longer than this (in lines)
      preview_config               = {
        -- Options passed to nvim_open_win
        border = 'rounded',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      yadm                         = {
        enable = false
      },
      on_attach                    = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = '[Git] Jump to the next hunk in the current buffer' })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = '[Git] Jump to the previous hunk in the current buffer' })

        -- Actions
        map({ 'n', 'v' }, '<leader>hs', gs.stage_hunk, { desc = '[Git] stage current hunk' })
        map({ 'n', 'v' }, '<leader>hr', gs.reset_hunk, { desc = '[Git] reset the lines of the current hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = '[Git] Stage Buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = '[Git] Undo last call to stage_hunk()' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = '[Git] Reset the lines of all hunks in the buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = '[Git] Preview Hunk' })
        map('n', '<leader>hb', function() gs.blame_line { full = true } end,
          { desc = '[Git] Run git blame on the current line and show the results' })
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = '[Git] Toggle Current Line Blame' })
        map('n', '<leader>hd', gs.diffthis, { desc = '[Git] vimdiff on current file' })
        map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = '[Git] vimdiff on current file with base ~' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = '[Git] Toggle show_deleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    },
    config = function(_, opts)
      require 'gitsigns'.setup(opts)
    end
  }
}
