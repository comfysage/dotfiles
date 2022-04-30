local helper = require "soil.helper"
local modules = require "soil.modules"
local palette = require "soil.palette"

-- Main

local M = {}

M._build = function (moduleconfig)
  --[[
  --   moduleconfig
  --   {
    --   separator,
    --   module,
    --   style,
    --   }
  --]]
  local module = ""
  if moduleconfig.module.separator[1] then
    module = module .. moduleconfig.separator.left
  else
    module = " " .. module
  end

  local modulename = helper.split(moduleconfig.module.Name, ".")

  local modulefunc = modules[modulename[1]][modulename[2]]
  module = module .. modulefunc()

  if moduleconfig.module.separator[2] then
    module = module .. moduleconfig.separator.right
  else
    module = module .. " "
  end

  module = helper.color(moduleconfig.style, module)

  return module
end

M._buildmodules = function (buildconfig)
  --[[
  --   buildconfig
  --   {
    --   separator,
    --   palette,
    --   modules
    --   }
  --]]
  local build = ""
  for _, value in pairs(buildconfig.modules) do
    build = build .. M._build({
      separator = buildconfig.separator,
      module = value,
      style = buildconfig.palette[value.Type]
    })
  end
  return build
end

--[[
--   config structure
--   {
--      separator: {
--        right: "",
--        left: "",
--      }
--      Left: [
--      -- Module
--      ]
--      Middle: [
--      -- Module
--      ]
--      Right: [
--      -- Module
--      ]
--   }
--]]
--
--[[
--   Module structure
--   {
--        Name: "RelativePath"
--        Type: "accent" | "main"
--        separator: [true, false] -- left, right
--   }
--]]

M.setup = function (config)
  Statusline = function ()
   local build = ""
   local pal = palette.setup(config.Palette)

   local mode = vim.api.nvim_get_mode().mode
   local mode_config = config.modes[mode]
   if mode_config == nil then

    build = build .. M._buildmodules({separator = config.separator, palette = pal, modules = config.modes['n'].Left})
    build = build .. "%="
    build = build .. M._buildmodules({separator = config.separator, palette = pal, modules = config.modes['n'].Middle})
    build = build .. "%="
    build = build .. M._buildmodules({separator = config.separator, palette = pal, modules = config.modes['n'].Right})

   else

    build = build .. M._buildmodules({separator = config.separator, palette = pal, modules = mode_config.Left})
    build = build .. "%="
    build = build .. M._buildmodules({separator = config.separator, palette = pal, modules = mode_config.Middle})
    build = build .. "%="
    build = build .. M._buildmodules({separator = config.separator, palette = pal, modules = mode_config.Right})

   end

   build = helper.color(pal.bg, "") .. build
   return build
  end
	function MyTabLabel(n)
	  local buflist = vim.call("tabpagebuflist(a:".. n .. ")")
   local winnr = vim.call( "tabpagewinnr(a:" .. n .. ")")
   return vim.call("bufname(" .. buflist[winnr - 1] .. ")")
  end
  TabLine = function()
   local s = ''
   for i in pairs(tabpagenr('$')) do
    -- select the highlighting
    if ( i + 1 == tabpagenr() ) then
     s = s .. '%#TabLineSel#'
    else
     s = s .. '%#TabLine#'
    end

    -- set the tab page number (for mouse clicks)
    s = s .. '%' .. (i + 1) .. 'T'

    -- the label is made by MyTabLabel()
    s = s .. ' %{MyTabLabel(' .. (i + 1) .. ')} '
   end

   -- after the last tab fill with TabLineFill and reset tab page nr
   s = s .. '%#TabLineFill#%T'

   -- right-align the label to close the current tab page
   if tabpagenr('$') > 1 then
    s = s .. '%=%#TabLine#%999Xclose'
   end

   return s
  end
  helper.set_option({
   statusline = "%!v:lua.Statusline()"
  })
 end

 return M
