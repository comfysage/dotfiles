config.load_autoconfig()
config.bind("<Alt-R>", ":config-source")

# Main
c.url.start_pages = ["file:///mnt/d/home/kitchen/pan/qutepage/index.html"]
c.url.default_page = c.url.start_pages[0]
c.url.searchengines = { "DEFAULT": "https://duckduckgo.com/?q={}", "aw": "https://wiki.archlinux.org/?search={}", "gh": "https://github.com/{}" }
c.content.headers.user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'

config.bind("<Alt-Left>", "back")
config.bind("<Alt-Right>", "forward")
config.bind("<Ctrl-A>", "config-cycle statusbar.show always never")
config.bind("<Alt-Z>", "fullscreen")
c.editor.command = [ "alacritty", "-e","nvim", "{file}" ]
c.zoom.default = '90%'

# Tabs {{{

# Open {{{

config.bind("<Alt-Tab>", "open -t")
c.aliases["e"] = "open"
c.tabs.title.format = '{audio}{current_title}'
c.tabs.title.format_pinned = '{audio}{current_title}'

# }}}

# Moving {{{

config.bind("<Tab>", "tab-next")
config.bind("<Shift-Tab>", "tab-prev")
c.aliases["tabmove"] = "tab-move"

# }}}

# }}}

c.fonts.default_family = "JetBrainsMono Nerd Font"
c.fonts.contextmenu = "FiraCode Nerd Font"

# Colors

# Xresources {{{

import subprocess

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xr = read_xresources('*')
# can now be used like `c.colors.statusbar.normal.bg = xr['*.background']`

# }}}

bg = xr['*.background']
fg = xr['*.foreground']
red = xr['*.color1']
green = xr['*.color2']
yellow = xr['*.color3']
blue = xr['*.color4']
magenta = xr['*.color5']
cyan = xr['*.color6']

# statusbar
c.colors.statusbar.normal.bg = bg
c.colors.statusbar.normal.fg = fg
c.colors.statusbar.insert.bg = blue
c.colors.statusbar.insert.fg = bg
c.colors.statusbar.command.bg = bg
c.colors.statusbar.command.fg = fg
c.colors.statusbar.caret.bg = magenta
c.colors.statusbar.caret.fg = bg
c.colors.statusbar.url.fg = fg
c.colors.statusbar.url.hover.fg = yellow

# Tab bar
c.colors.tabs.bar.bg = bg

# Tabs
c.colors.tabs.even.bg = bg
c.colors.tabs.even.fg = fg
c.colors.tabs.selected.even.bg = bg
c.colors.tabs.selected.even.fg = magenta
c.colors.tabs.odd.bg = bg
c.colors.tabs.odd.fg = fg
c.colors.tabs.selected.odd.bg = bg
c.colors.tabs.selected.odd.fg = magenta

# pinned Tabs
c.colors.tabs.pinned.even.bg = bg
c.colors.tabs.pinned.even.fg = fg
c.colors.tabs.pinned.selected.even.bg = bg
c.colors.tabs.pinned.selected.even.fg = magenta
c.colors.tabs.pinned.odd.bg = bg
c.colors.tabs.pinned.odd.fg = fg
c.colors.tabs.pinned.selected.odd.bg = bg
c.colors.tabs.pinned.selected.odd.fg = magenta

c.colors.contextmenu.menu.bg = bg
c.colors.contextmenu.menu.fg = fg
c.colors.contextmenu.selected.bg = fg
c.colors.contextmenu.selected.fg = bg

c.colors.completion.fg = fg
c.colors.completion.even.bg = bg
c.colors.completion.odd.bg = bg
c.colors.completion.category.bg = green
c.colors.completion.category.fg = bg
c.colors.completion.category.border.top = green
c.colors.completion.category.border.bottom = green
c.colors.completion.item.selected.bg = cyan
c.colors.completion.item.selected.fg = bg
c.colors.completion.item.selected.border.top = cyan
c.colors.completion.item.selected.border.bottom = cyan
