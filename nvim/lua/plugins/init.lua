return {
  -- the plugin manager can manage itself
  { 'folke/lazy.nvim', branch = 'stable' },

  -- {
  --   'francoiscabrol/ranger.vim',
  --   dependencies = { 'rbgrouleff/bclose.vim' }
  -- },

  { 'junegunn/fzf',    build = ':call fzf#install()' },
  -- 'junegunn/fzf.vim',

  -- 'jiangmiao/auto-pairs',
  --[[ {
    'windwp/nvim-autopairs',
    opts = {}
  }, ]]
  'antonk52/vim-tabber',
  'psliwka/vim-smoothie',
  -- 'junegunn/vim-easy-align',
  'junegunn/vim-peekaboo',
  { 'stevearc/dressing.nvim',
    opts = {
      input = {
        default_prompt = '',
        -- Can be 'left', 'right', or 'center'
        title_pos = "left",

        -- These are passed to nvim_open_win
        anchor = 'SW',
        border = 'rounded',
        -- 'editor' and 'win' will default to being centered
        relative = 'cursor',

        max_width = { 90, 0.8 },
        min_width = { 20, 0.2 },

        win_options = {
          -- Window transparency (0-100)
          winblend = 0,
          -- Disable line wrapping
          wrap = false,
          -- Indicator for when text exceeds window
          list = true,
          listchars = "precedes:…,extends:…",
          -- Increase this for more context when text scrolls off the window
          sidescrolloff = 0,
        },
      },
      select = { }
    },
    config = function (_, opts)
      require 'dressing'.setup (opts)
    end
  },

  -- { 'vim-airline/vim-airline' },
  --[[ { 'akinsho/bufferline.nvim',
  tag = "v3.*",
  requires = 'nvim-tree/nvim-web-devicons' } ]]

  -- 'ap/vim-css-color',
  'norcalli/nvim-colorizer.lua',

  -- IDE
  { 'mattn/emmet-vim',         ft = { 'css', 'scss', 'html', 'tsx' } },
  -- 'nvim-tree/nvim-web-devicons', -- Icons for Telescope

  -- 'pangloss/vim-javascript',
  { 'prettier/vim-prettier', build = 'npm install --frozen-lockfile --production' },
  -- 'airblade/vim-gitgutter',
  { 'tpope/vim-fugitive',    lazy = true },
  -- {
  --   'sindrets/diffview.nvim',
  --   dependencies = 'nvim-lua/plenary.nvim'
  -- },
  'sheerun/vim-polyglot',
  -- 'ThePrimeagen/refactoring.nvim',
  {
    'simrat39/symbols-outline.nvim',
    opts = {
      position = 'left',
    }
  },

  -- 'elkowar/yuck.vim',

  'tpope/vim-surround',
  'tpope/vim-vinegar',
  { 'tpope/vim-markdown',     ft = 'markdown' },
  {
    'mickael-menu/zk-nvim',
    opts = {
      -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
      -- it's recommended to use "telescope" or "fzf"
      picker = 'telescope',

      lsp = {
        -- `config` is passed to `vim.lsp.start_client(config)`
        config = {
          cmd = { 'zk', 'lsp' },
          name = 'zk_lsp',
          -- on_attach = ...
          -- etc, see `:h vim.lsp.start_client()`
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    },
    config = function(_, opts)
      require 'zk'.setup(opts)
    end
  },

  -- { 'junegunn/goyo.vim',      ft = 'markdown' },
  -- { 'junegunn/limelight.vim', ft = 'markdown' },
  -- 'folke/zen-mode.nvim',
  -- 'folke/twilight.nvim',

  { 'numToStr/FTerm.nvim',   name = "fterm" },

  -- Lua
  'nvim-lua/plenary.nvim', -- utils
  'nvim-lua/popup.nvim',
  -- { 'numToStr/Comment.nvim', name = 'commentary' },
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require 'todo-comments'.setup {
        -- keywords recognized as todo comments
        keywords = {
          FIX = {
            icon = "! ",                                -- icon used for the sign, and in search results
            color = "error",                            -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = "/ ", color = "info" },
          WARN = { icon = "! ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = "* ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = ". ", color = "hint", alt = { "INFO" } },
          TEST = { icon = "* ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        -- list of named colors where we try to extract the guifg from the
        -- list of highlight groups or use the hex color if hl not found as a fallback
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#FFA89A" },
          warning = { "DiagnosticWarn", "WarningMsg", "#FBBB8B" },
          info = { "DiagnosticInfo", "#FFCCAE" },
          hint = { "DiagnosticHint", "#FFFFAA" },
          default = { "Identifier", "#AACCFF" },
          test = { "Identifier", "#AACCFF" }
        },
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          -- regex that will be used to match keywords.
          -- don't replace the (KEYWORDS) placeholder
          pattern = [[\b(KEYWORDS):]], -- ripgrep regex
          -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        },
      }
    end
  },

  -- LSP
  -- 'glepnir/lspsaga.nvim',
  -- 'folke/trouble.nvim',
  {
    'crispybaccoon/tanuki',
    dir = ENV('KITCHEN') .. '/pan/tanuki',
    lazy = true,
    opts = {
      mappings = {
        ['gr'] = function () require 'tanuki'.rename() end,
        ['K'] = function () require 'tanuki'.hover_doc() end,
        ['L'] = function () require 'tanuki'.show_line_diagnostics() end,
      },
    }
  },

  -- LuaSnip
  -- { 'L3MON4D3/LuaSnip',   version = 'v1.1.0' },
  -- 'saadparwaiz1/cmp_luasnip', lazy = true,

  {
    'crispybaccoon/sayama.nvim',
    lazy = true,
    config = function()
      require 'sayama'.setup {
        dir = ENV('KITCHEN') .. '/pan/code-examples'
      }
    end
  },

  'lewis6991/impatient.nvim',

  -- Colorschemes

  { 'sainnhe/everforest',          lazy = true },
  { 'arcticicestudio/nord-vim',    lazy = true,         enabled = false },

  { 'sainnhe/gruvbox-material',    lazy = true },
  { 'catppuccin/nvim',             name = 'catppuccin', lazy = true },
  { 'joshdick/onedark.vim',        lazy = true },
  { 'cocopon/iceberg.vim',         lazy = true },
  { 'crispybaccoon/fantastic.vim', lazy = true },
  { 'crispybaccoon/dawn.vim',      lazy = true },
}
