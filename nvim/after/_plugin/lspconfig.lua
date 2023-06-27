local status, nvim_lsp = pcall(require, 'lspconfig')
if not status then return end

local on_attach = function(client, bufnr)
  -- Mappings.
  local opts = { noremap = true, silent = true }

  vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- vim.keymap.set('n', 'gr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
  -- vim.keymap.set('n', '<space>k', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
  vim.keymap.set('n', 'gl', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.keymap.set('n', '<space>l', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.keymap.set('n', ',s', '<Cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)

  -- diagnostics
  vim.keymap.set('n', 'L', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
  vim.keymap.set('n', '<M-j>', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  vim.keymap.set('n', '<M-k>', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)

  -- symbols
  vim.keymap.set('n', '<space>fs', function() require 'telescope.builtin'.lsp_document_symbols() end, opts)
  vim.keymap.set('n', '<space>fS', function() require 'telescope.builtin'.lsp_workspace_symbols() end, opts)
end

status, _ = pcall(require, 'mason')
if not status then return end
-- Setup mason so it can manage external tooling
require('mason').setup()

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = { 'denols', 'lua_ls', 'gopls', 'svelte', 'rust_analyzer', 'clangd', 'tailwindcss', 'rnix' }

status, _ = pcall(require, 'mason-lspconfig')
if not status then return end
-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

nvim_lsp.denols.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc", "main.ts"),
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false,
}
nvim_lsp.zk.setup {
  on_attach = on_attach,
  cmd = {'zk', 'lsp'},
  filetypes = {'markdown'},
  settings = {}
}
--[[ nvim_lsp.ccls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "h", "hpp" }
} ]]
--[[ nvim_lsp.dartls.setup {
  on_attach = on_attach,
} ]]

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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
