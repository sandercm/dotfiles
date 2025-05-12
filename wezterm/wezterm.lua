local wezterm = require("wezterm")
local act = wezterm.action
local gpus = wezterm.gui.enumerate_gpus()
local session_manager = require("wezterm-session-manager/session-manager")

wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

return {
	enable_wayland = true,
	prefer_egl = true,
	front_end = "WebGpu",
	webgpu_preferred_adapter = gpus[2],
	color_scheme = "Dracula (Official)",
	-- enable_scroll_bar = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	background = {
		{
			source = {
				Color = "#24273a",
			},
			height = "100%",
			width = "100%",
		},
		{
			source = {
				File = "/home/sander/.config/wezterm/background5.gif",
			},
			opacity = 0.02,
			--vertical_align = "Top",
			horizontal_align = "Right",
			vertical_offset = "75%",
			--horizontal_offset = "80%",
			height = "25%",
			width = "400",
			repeat_y = "NoRepeat",
			repeat_x = "NoRepeat",
		},
	},
	launch_menu = {
		{
			args = { "btop" },
		},
		{
			args = { "cmatrix" },
		},
		{
			args = { "pipes-rs" },
		},
	},
	keys = {
		{ key = "S", mods = "ALT", action = wezterm.action({ EmitEvent = "save_session" }) },
		{ key = "L", mods = "ALT", action = wezterm.action({ EmitEvent = "load_session" }) },
		{ key = "R", mods = "ALT", action = wezterm.action({ EmitEvent = "restore_session" }) },
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = act.ScrollByPage(1),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = act.ScrollByPage(-1),
		},
		{
			key = "g",
			mods = "CTRL|SHIFT",
			action = act.ScrollToTop,
		},
		{
			key = "e",
			mods = "CTRL|SHIFT",
			action = act.ScrollToBottom,
		},
		{
			key = "p",
			mods = "CTRL|SHIFT|SUPER",
			action = act.PaneSelect,
		},
		{
			key = "o",
			mods = "CTRL|SHIFT|SUPER",
			action = act.PaneSelect({ mode = "SwapWithActive" }),
		},
		{
			key = "%",
			mods = "CTRL|SHIFT|SUPER",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = '"',
			mods = "CTRL|SHIFT|SUPER",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "LeftArrow",
			mods = "CTRL|SHIFT|SUPER",
			action = act.AdjustPaneSize({ "Left", 1 }),
		},
		{
			key = "RightArrow",
			mods = "CTRL|SHIFT|SUPER",
			action = act.AdjustPaneSize({ "Right", 1 }),
		},
		{
			key = "UpArrow",
			mods = "CTRL|SHIFT|SUPER",
			action = act.AdjustPaneSize({ "Up", 1 }),
		},
		{
			key = "DownArrow",
			mods = "CTRL|SHIFT|SUPER",
			action = act.AdjustPaneSize({ "Down", 1 }),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT|SUPER",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT|SUPER",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT|SUPER",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT|SUPER",
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "z",
			mods = "CTRL|SHIFT|SUPER",
			action = act.TogglePaneZoomState,
		},
		{
			key = "q",
			mods = "CTRL|SHIFT|SUPER",
			action = act.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "b",
			mods = "CTRL|SHIFT|SUPER",
			action = act.RotatePanes("CounterClockwise"),
		},
		{
			key = "n",
			mods = "CTRL|SHIFT|SUPER",
			action = act.RotatePanes("Clockwise"),
		},
		{
			key = "d",
			mods = "CTRL|SHIFT",
			action = act.ShowLauncher,
		},
		{
			key = ":",
			mods = "CTRL|SHIFT",
			action = act.ClearSelection,
		},
		{
			key = "1",
			mods = "ALT",
			action = wezterm.action.ActivateTab(0),
		},
		{
			key = "2",
			mods = "ALT",
			action = wezterm.action.ActivateTab(1),
		},
		{
			key = "3",
			mods = "ALT",
			action = wezterm.action.ActivateTab(2),
		},
		{
			key = "4",
			mods = "ALT",
			action = wezterm.action.ActivateTab(3),
		},
		{
			key = "5",
			mods = "ALT",
			action = wezterm.action.ActivateTab(4),
		},
		{
			key = "6",
			mods = "ALT",
			action = wezterm.action.ActivateTab(5),
		},
		{
			key = "7",
			mods = "ALT",
			action = wezterm.action.ActivateTab(6),
		},
		{
			key = "8",
			mods = "ALT",
			action = wezterm.action.ActivateTab(7),
		},
		{
			key = "9",
			mods = "ALT",
			action = wezterm.action.ActivateTab(8),
		},
		{
			key = "Enter",
			mods = "ALT",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "w",
			mods = "ALT",
			action = wezterm.action.CloseCurrentTab({ confirm = false }),
		},
	},
}
