local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "tokyonight-day"
-- config.color_scheme = "catppuccin-latte"

config.font = wezterm.font("MonoLisa Nerd Font", { weight = "Bold" })
config.font_size = 14

config.enable_tab_bar = false

config.leader = { key = "Space", mods = "CTRL|SHIFT" }
config.keys = {
	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
}

config.window_decorations = "RESIZE"
config.window_padding = {
	bottom = "1px",
}

return config
