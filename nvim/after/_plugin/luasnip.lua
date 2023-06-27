local status, _ = pcall(require, 'luasnip')
if not status then return end

require 'luasnip'.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  -- updateevents = "TextChanged,TextChangedI",
  updateevents = 'InsertLeave',

  -- Autosnippets:
  enable_autosnippets = false,

  -- Crazy highlights!!
  ext_opts = nil,
  --[[ ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  }, ]]
}

require("luasnip.loaders.from_lua").load({paths = "/mnt/d/home/kitchen/config/nvim/snip"})

-- load snippets from snippets directory
require("luasnip.loaders.from_vscode").lazy_load({
  paths = { "/mnt/d/home/kitchen/config/snippets" },
  include = { "go", "lua", "c", "cpp", "html", "js" } })

-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if require 'luasnip'.expand_or_jumpable() then
    require 'luasnip'.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if require 'luasnip'.jumpable(-1) then
    require'luasnip'.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
  if require'luasnip'.choice_active() then
    require'luasnip'.change_choice(1)
  end
end)

