local wezterm = require("wezterm")

local LEFT_ARROW = utf8.char(0xff0b3)
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

local COL_BG = "#e5e9f0"
local COL_BG_ALT = "#4f545f"
local COL_FG = "#3b4252"
local COL_FG_ALT = "#8fbcbb"
local COL_ACCENT = "#5e81ac"

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
              -- edge icon
	local edge_background = COL_BG
	-- inactive tab
	local background = COL_FG_ALT
	local foreground = COL_BG

	if tab.is_active then
		background = COL_ACCENT
		foreground = COL_FG
	elseif hover then
		background = COL_ACCENT
		foreground = COL_FG
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
	--color_scheme = "ayu_light",
	default_cursor_style = "BlinkingBar",
	font_size = 16.0,
	font = wezterm.font("Fira Code"),
	warn_about_missing_glyphs = false,
	check_for_updates = false,
	-- Tab Bar Options
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
	tab_max_width = 25,
	-- Padding
	window_padding = { left = 10, right = 10, top = 0, bottom = 10 },
	-- Misc
	adjust_window_size_when_changing_font_size = false,
	-- Theme
	colors = {
		background = COL_BG,
		foreground = COL_FG,
		selection_bg = COL_ACCENT,
		tab_bar = {
			background = COL_BG,
			new_tab = {
				bg_color = COL_BG,
				fg_color = COL_FG,
			},
		},
	},
	inactive_pane_hsb = {
		saturation = 0.5,
		brightness = 0.5,
	},
	hyperlink_rules = {
		-- Linkify things that look like URLs
		-- This is actually the default if you don't specify any hyperlink_rules
		{
			regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
			format = "$0",
		},

		-- match the URL with a PORT
		-- such 'http://localhost:3000/index.html'
		{
			regex = "\\b\\w+://(?:[\\w.-]+):\\d+\\S*\\b",
			format = "$0",
		},

		-- linkify email addresses
		{
			regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
			format = "mailto:$0",
		},

		-- file:// URI
		{
			regex = "\\bfile://\\S*\\b",
			format = "$0",
		},
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
		{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "RightArrow", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "LeftArrow", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = -1 }) },
		--
		{ key = "RightArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "LeftArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "UpArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "DownArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
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
