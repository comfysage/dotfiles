return {
  -- use { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }
  { 'nvim-treesitter/nvim-treesitter',
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    ---@type TSConfig
    opts = {
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      auto_install = false,
      -- List of parsers to ignore installing (for "all")
      ignore_install = {},
      highlight = {
        enable = true,
        disable = { "markdown" },
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
      },
      indent = { enable = true },
      ensure_installed = { 'markdown', 'markdown_inline' },
    },
    ---@param props TSConfig
    config = function(_, props)
      require("nvim-treesitter.configs").setup(props)
      vim.keymap.set("n", "gm", "<Cmd>Inspect<CR>", { desc = "Show TS highlight groups under cursor" })
    end,
  }

}
