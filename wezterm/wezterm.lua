local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme = "tokyonight-day"
config.color_scheme = "catppuccin-mocha"
config.front_end = "WebGpu"

config.font = wezterm.font("MonoLisa Nerd Font", { weight = "Bold" })
config.font_size = 14

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

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
	{
		key = "t",
		mods = "CMD|SHIFT",
		action = act.ShowTabNavigator,
	},
	{
		key = "R",
		mods = "CMD|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

config.window_decorations = "RESIZE"
config.window_padding = {
	bottom = "1px",
}

return config
