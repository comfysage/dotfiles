local status, _ = pcall(require, 'telescope')
if not status then return end
status, _ = pcall(require, 'lspkind')
if not status then return end

-- Setup nvim-cmp.
local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup {
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --[[ ['<Down>'] = function(fallback)
      if cmp.visible() then cmp.mapping.select_next_item()
      else fallback() end
    end,
    ['<Up>'] = function(fallback) if cmp.visible() then cmp.mapping.select_prev_item()
      else fallback() end
    end, ]]
    ['<Down>'] = cmp.mapping( cmp.mapping.select_next_item() ),
    ['<Up>'] = cmp.mapping( cmp.mapping.select_prev_item() ),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    -- { name = 'vsnip', max_item_count = 4 }, -- For vsnip users.
    { name = 'luasnip', max_item_count = 4 }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'path' },
    { name = 'cmdline' },
    { name = 'buffer', max_item_count = 5 },
  }),
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[lua]",
        path = "[path]",
        luasnip = "[snip]",
      }
    }
  },
  -- view = { entries = 'native' },
  experimental = {
    ghost_text = true,
  }
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    -- { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.filetype('markdown', {
  sources = cmp.config.sources({
    { name = 'luasnip', max_item_count = 4 }, -- For luasnip users.
  }, {
    { name = 'path' },
    { name = 'buffer', max_item_count = 5 },
    {	name = "dictionary", keyword_length = 2,	},
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['tsserver'].setup {
  capabilities = capabilities
}

require("cmp_dictionary").setup({
	dic = {
		-- ["*"] = { "/usr/share/dict/words" },
		["markdown"] = { "/usr/share/dict/words" },
		--[[ ["lua"] = "path/to/lua.dic",
		["javascript,typescript"] = { "path/to/js.dic", "path/to/js2.dic" }, ]]
		--[[ filename = {
			["xmake.lua"] = { "path/to/xmake.dic", "path/to/lua.dic" },
		}, ]]
		--[[ filepath = {
			["%.tmux.*%.conf"] = "path/to/tmux.dic"
		}, ]]
		spelllang = {
			en = "/usr/share/dict/american-english",
			fr = "/usr/share/dict/fr.dict",
			nl = "/usr/share/dict/nl.dict",
		},
	},
	-- The following are default values.
	exact = 2,
	first_case_insensitive = false,
	document = false,
	document_command = "wn %s -over",
	async = false, 
	max_items = -1,
	capacity = 5,
	debug = false,
})
