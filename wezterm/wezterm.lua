local wezterm = require 'wezterm'

local function font_with_fallback(name, params)
	local names = { name, 'JetBrainsMono Nerd Font', 'Source Code Pro' }
	return wezterm.font_with_fallback(names, params)
end

local font_name = { family = 'Claire Mono', scale = 1.1 }
font_name = 'JetBrainsMono Nerd Font'

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.check_for_updates = false
config.show_update_window = false

config.color_scheme = 'aki'

-- OpenGL for GPU acceleration, Software for CPU
config.front_end = 'OpenGL'

-- Font config
config.font = font_with_fallback(font_name)
config.font_rules = {
	{
    intensity = 'Normal',
		italic = true,
		font = font_with_fallback(font_name, { italic = true }),
	},
	{
    intensity = 'Normal',
		italic = false,
		font = font_with_fallback(font_name, { bold = false }),
	},
	{
		intensity = 'Bold',
		italic = false,
		font = font_with_fallback(font_name, { bold = true }),
	},
}
config.warn_about_missing_glyphs = false
config.font_size = 11
config.font_size = 10
config.line_height = 1.2
config.dpi = 96.0

-- Cursor style
config.default_cursor_style = 'SteadyBlock'

-- X11
-- config.enable_wayland = true

-- Keybinds
config.disable_default_key_bindings = true
config.keys = {
	{
		key = [[\]],
		mods = 'CTRL',
		action = wezterm.action({
			SplitHorizontal = { domain = 'CurrentPaneDomain' },
		}),
	},
	{
		key = [[\]],
		mods = 'CTRL|ALT',
		action = wezterm.action({
			SplitVertical = { domain = 'CurrentPaneDomain' },
		}),
	},
	{
		key = 'q',
		mods = 'CTRL|SHIFT',
		action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
	},
	{
		key = 'h',
		mods = 'CTRL|SHIFT',
		action = wezterm.action({ ActivatePaneDirection = 'Left' }),
	},
	{
		key = 'l',
		mods = 'CTRL|SHIFT',
		action = wezterm.action({ ActivatePaneDirection = 'Right' }),
	},
	{
		key = 'k',
		mods = 'CTRL|SHIFT',
		action = wezterm.action({ ActivatePaneDirection = 'Up' }),
	},
	{
		key = 'j',
		mods = 'CTRL|SHIFT',
		action = wezterm.action({ ActivatePaneDirection = 'Down' }),
	},
	{
		key = 'h',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action({ AdjustPaneSize = { 'Left', 1 } }),
	},
	{
		key = 'l',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action({ AdjustPaneSize = { 'Right', 1 } }),
	},
	{
		key = 'k',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action({ AdjustPaneSize = { 'Up', 1 } }),
	},
	{
		key = 'j',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action({ AdjustPaneSize = { 'Down', 1 } }),
	},
	{
		key = 'v',
		mods = 'CTRL|SHIFT',
		action = wezterm.action({ PasteFrom = 'Clipboard' }),
	},
	{
		key = 'c',
		mods = 'CTRL|SHIFT',
		action = wezterm.action({ CopyTo = 'ClipboardAndPrimarySelection' }),
	},
}

config.bold_brightens_ansi_colors = false
-- Padding
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

-- Tab Bar
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = true

-- General
config.automatically_reload_config = true
config.inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 }
config.window_background_opacity = 0.98
config.window_close_confirmation = 'NeverPrompt'
config.window_frame = {
	active_titlebar_bg = '#45475a',
	font = font_with_fallback(font_name, { bold = true })
}
config.window_decorations = 'TITLE | RESIZE'

return config
