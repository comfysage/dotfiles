colorscheme catppuccin

lua << EOF

require 'catppuccin'.setup {
    transparent_background = true,
    term_colors = false,
    styles = {
      comments = "NONE",
      functions = "NONE",
      keywords = "NONE",
      strings = "NONE",
      variables = "NONE",
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = "NONE",
          hints = "NONE",
          warnings = "NONE",
          information = "NONE",
        },
        underlines = {
          errors = "underline",
          hints = "underline",
          warnings = "underline",
          information = "underline",
        },
      },
      lsp_trouble = false,
      cmp = true,
      lsp_saga = false,
      gitgutter = true,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = false,
        show_root = false,
        transparent_panel = false,
      },
      neotree = {
        enabled = false,
        show_root = false,
        transparent_panel = false,
      },
      which_key = false,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      dashboard = true,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = false,
      hop = false,
      notify = true,
      telekasten = true,
      symbols_outline = true,
    }
  }

EOF

hi TSNumber gui=NONE
hi TSBoolean gui=NONE
hi TSFloat gui=NONE
hi TSParameter gui=NONE
hi TSMethod gui=NONE
hi TSProperty gui=NONE
hi TSNamespace gui=NONE
hi TSInclude gui=NONE
hi TSVariableBuiltin gui=NONE
hi TSTypeBuiltin gui=NONE
hi TSEmphasis gui=NONE
hi TSLiteral gui=NONE
hi TSFuncBuiltin gui=NONE
