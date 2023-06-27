local on_attach = function(_, _)
  -- Mappings.
  local opts = { noremap = true, silent = true }

  vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- vim.keymap.set('n', 'gr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
  -- vim.keymap.set('n', '<space>k', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
  vim.keymap.set('n', 'gl', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.keymap.set('n', '<space>l', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.keymap.set('n', ',s', '<Cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)

  -- diagnostics
  -- vim.keymap.set('n', 'L', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
  -- vim.keymap.set('n', '<M-j>', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  -- vim.keymap.set('n', '<M-k>', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)

  -- symbols
  vim.keymap.set('n', '<space>fs', function() require 'telescope.builtin'.lsp_document_symbols() end, opts)
  vim.keymap.set('n', '<space>fS', function() require 'telescope.builtin'.lsp_workspace_symbols() end, opts)
end

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- lsp diagnostics
vim.diagnostic.config {
  float = true,
  severity_sort = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    prefix = " >",
  }
}

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = {
  {
    'denols',
    opts = function(nvim_lsp) return {
      filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
      root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc", "main.ts"),
    } end
  },
  'lua_ls',
  'gopls',
  'svelte',
  'rust_analyzer',
  'clangd',
  'tailwindcss',
  'rnix',
  {
    'tsserver',
    opts = function(nvim_lsp) return {
      filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact",
        "javascript.jsx" },
      root_dir = nvim_lsp.util.root_pattern("package.json"),
      single_file_support = false,
    } end
  },
  {
    'zk',
    opts = {
      filetypes = { 'markdown' },
      settings = {}
    }
  },
  --[[ nvim_lsp.ccls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "h", "hpp" }
} ]]
  --[[ nvim_lsp.dartls.setup {
  on_attach = on_attach,
} ]]

  {
    'lua_ls',
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            -- recognize 'vim' global
            globals = { 'vim', 'table', 'package' }
          },
          workspace = {
            -- Make server aware of nvim runtime files
            library = vim.api.nvim_get_runtime_file("", true)
          },
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = { enable = false },
        },
      },
    }
  },
}

local raw_servers = {}
for i, s in ipairs(servers) do
  if type(s) == "table" then
    raw_servers[i] = s[1]
  else
    raw_servers[i] = s
  end
end

return {
  -- Automatically install LSPs to stdpath for neovim
  {
    'williamboman/mason.nvim',
    config = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = raw_servers,
    }
  },
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    config = function()
      local nvim_lsp = require 'lspconfig'

      -- nvim-cmp supports additional completion capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      for _, lsp in ipairs(servers) do
        if type(lsp) == "table" then
          local opts = nil
          if type(lsp.opts) == "table" then
            opts = lsp.opts
          else
            opts = lsp.opts(nvim_lsp)
          end
          opts.on_attach = on_attach
          opts.capabilities = capabilities
          nvim_lsp[lsp[1]].setup(opts)
        else
          nvim_lsp[lsp].setup {
            on_attach = on_attach,
            capabilities = capabilities,
          }
        end
      end
    end
  },
}
