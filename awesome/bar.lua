-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local palette = {
  bg = "#262626",
  fg = "#c3c3c3",
}

-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.suit.tile)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        layout = {
          spacing = 10,
          spacing_widget = {
            color = "#00000000",
            widget = wibox.widget.separator,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        widget_template = {
        {
            {
                {
                    {
                        {
                            id     = 'index_role',
                            widget = wibox.widget.textbox,
                            fg = "#262626"
                        },
                        margins = 4,
                        widget  = wibox.container.margin,
                    },
                    bg     = '#dddddd',
                    shape  = gears.shape.circle,
                    widget = wibox.container.background,
                },
                {
                    {
                        id     = 'icon_role',
                        widget = wibox.widget.imagebox,
                    },
                    margins = 2,
                    widget  = wibox.container.margin,
                },
                -- {
                --     id     = 'text_role',
                --     widget = wibox.widget.textbox,
                -- },
                layout = wibox.layout.fixed.horizontal,
            },
            left  = 8,
            right = 8,
            widget = wibox.container.margin
        },
        id     = 'background_role',
        widget = wibox.container.background,
        -- Add support for hover colors and an index label
        create_callback = function(self, c3, index, objects) --luacheck: no unused args
            self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
            self:connect_signal('mouse::enter', function()
                if self.bg ~= '#d3a3d3' then
                    self.backup     = self.bg
                    self.has_backup = true
                end
                self.bg = '#d3a3d3'
            end)
            self:connect_signal('mouse::leave', function()
                if self.has_backup then self.bg = self.backup end
            end)
        end,
        update_callback = function(self, c3, index, objects) --luacheck: no unused args
            self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
        end,
        },
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    local rrect = function (radius)
      return function (cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
      end
    end

    local pill = function ()
      return function (cr, width, height)
        gears.shape.rounded_bar(cr, width, height )
      end
    end

    -- Create the wibox

    local padding = 0.01

    s.mywibar = awful.wibar({
      position = "top",
      type = "dock",
      screen = s,
      height = awful.screen.focused().geometry.height * ( 1 - 0.975 ),
      width = awful.screen.focused().geometry.width * ( 1 - ( padding * 2 ) ),
      ontop = false,
      -- shape = rrect(beautiful.border_radius),
      shape = pill(),
      bg = palette.bg,
      fg = palette.fg
    })

    s.mywibar.y = ( awful.screen.focused().geometry.width * ( padding / 4 ) )

    local function remove_wibar(c)
      if c.fullscreen or c.maximized then
        c.screen.mywibar.visible = false
      else
        c.screen.mywibar.visible = true
      end
    end

    local function add_wibar(c)
      if c.fullscreen or c.maximized then
        c.screen.mywibar.visible = true
      end
    end

    client.connect_signal("property::fullscreen", remove_wibar)
    client.connect_signal("request::unmanage", add_wibar)

    -- Add widgets to the wibox
    --[[ s.mywibar:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    } ]]

    s.mywibar:setup {
        -- {
        -- {
          layout = wibox.layout.align.horizontal,
          expand = "none",
          -- { -- left
            mylauncher,
            -- taglist_buttons,
            spacing = dpi(10),
            -- layout = wibox.layout.fixed.horizontal,
          -- },
          --{
            s.mytaglist,
          --},
          -- { -- right
            s.mylayoutbox,
            spacing = dpi(8),
            --[[layout = wibox.layout.fixed.horizontal
          }, ]]
        -- },
        margins = dpi(8),
        -- widget = wibox.container.margin,
      -- },
      bg = palette.bg,
      shape = rrect(beautiful.border_radius),
      -- widget = wibox.containter.background
    }

end)
