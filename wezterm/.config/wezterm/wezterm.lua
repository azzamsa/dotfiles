local wezterm = require("wezterm")

local LEFT_ARROW = utf8.char(0xff0b3)
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

local COLOR0 = "#F9FAFB"
local COLOR1 = "#4338CA"
local COLOR2 = "#6366F1"
local COLOR3 = "#9CA3AF"

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = COLOR0
	local background = COLOR2
	local foreground = COLOR3

	if tab.is_active then
		background = COLOR1
		foreground = COLOR0
	elseif hover then
		background = COLOR2
		foreground = COLOR0
	end

	local edge_foreground = background
	local title = tab.active_pane.title
	local username = os.getenv("USER")
	title = title:gsub(username, "🥗")
	title = title:gsub("/home", "~")

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

return {
	color_scheme = "ayu_light",
	default_cursor_style = "BlinkingBar",
	font_size = 16.0,
	font = wezterm.font("Fira Code"),
	warn_about_missing_glyphs = false,
	-- Tab Bar Options
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
	tab_max_width = 25,
	-- Padding
	window_padding = { left = 10, right = 10, top = 10, bottom = 10 },
	-- Misc
	adjust_window_size_when_changing_font_size = false,
	-- Theme
	colors = {
		tab_bar = {
			background = COLOR0,
			new_tab = {
				bg_color = COLOR1,
				fg_color = COLOR0,
			},
		},
		foreground = COLOR0,
		selection_bg = COLOR2,
	},
	-- keybindings
	disable_default_key_bindings = true,
	quick_select_alphabet = "colemak",
	leader = { key = "n", mods = "CTRL", timeout_milliseconds = 2000 },
	keys = {
		{ key = "n", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x14" }) },
		{ key = "r", mods = "LEADER", action = "ReloadConfiguration" },
		--
		{
			key = "h",
			mods = "LEADER",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "v", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "t", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "X", mods = "LEADER", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
		{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "f", mods = "LEADER", action = "QuickSelect" },
		{ key = "w", mods = "LEADER", action = "ActivateCopyMode" },
		{ key = "s", mods = "LEADER", action = wezterm.action({ Search = { CaseInSensitiveString = "" } }) },
		{ key = "PageUp", mods = "NONE", action = wezterm.action({ ScrollByPage = -1 }) },
		{ key = "PageDown", mods = "NONE", action = wezterm.action({ ScrollByPage = 1 }) },
		--
		{ key = "RightArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "LeftArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "UpArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "DownArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		--
		{ key = "RightArrow", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "LeftArrow", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = -1 }) },
		--
		{ key = "m", mods = "CTRL|SHIFT", action = wezterm.action({ MoveTabRelative = 1 }) },
		{ key = "i", mods = "CTRL|SHIFT", action = wezterm.action({ MoveTabRelative = -1 }) },
		--
		{ key = "0", mods = "ALT", action = "ResetFontSize" },
		{ key = "8", mods = "ALT", action = "DecreaseFontSize" },
		{ key = "9", mods = "ALT", action = "IncreaseFontSize" },
		--
		{ key = "w", mods = "ALT", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "y", mods = "CTRL", action = wezterm.action({ PasteFrom = "Clipboard" }) },
	},
}
