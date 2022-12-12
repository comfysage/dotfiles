local ls = require 'luasnip'
local types = require 'luasnip.util.types'

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

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

-- create snippet
-- s(context, nodes, condition, ...)
local s = ls.s

-- TODO: Write about this.
--  Useful for dynamic nodes and choice nodes
local snippet_from_nodes = ls.sn

-- This is the simplest node.
--  Creates a new text node. Places cursor after node by default.
--  t { "this will be inserted" }
--
--  Multiple lines are by passing a table of strings.
--  t { "line 1", "line 2" }
local t = ls.text_node

local fmt = require 'luasnip.extras.fmt'.fmt

-- Insert Node
--  Creates a location for the cursor to jump to.
--      Possible options to jump to are 1 - N
--      If you use 0, that's the final place to jump to.
--
--  To create placeholder text, pass it as the second argument
--      i(2, "this is placeholder text")
local i = ls.insert_node

-- Function Node
--  Takes a function that returns text
local f = ls.function_node

-- This a choice snippet. You can move through with <c-l> (in my config)
--   c(1, { t {"hello"}, t {"world"}, }),
--
-- The first argument is the jump position
-- The second argument is a table of possible nodes.
--  Note, one thing that's nice is you don't have to include
--  the jump position for nodes that normally require one (can be nil)
local c = ls.choice_node

local d = ls.dynamic_node

local same = function(index)
  return f(function(args)
    return args[1]
  end, { index })
end

local snippets = {}

snippets.all = {
  s("nom", t( "$TM_FILENAME" )),
}
snippets.lua = {
  s("req", fmt([[local {} = require "{}"]], { f(function(import)
    local parts = vim.split(import[1][1], ".", true)
    return parts[#parts] or ""
  end, { 1 }), i(1) }))
}
snippets.markdown = {
 s("#", fmt( [[# {} ]], { f(function (n)
  local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
  local sp = vim.split((bufname), '/')
  return sp[table.getn(sp)]
 end) } ))
}

require("luasnip.loaders.from_lua").load({paths = "/mnt/d/home/kitchen/config/nvim/snip"})

-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("i", "<c-u>", require 'luasnip.extras.select_choice' )


