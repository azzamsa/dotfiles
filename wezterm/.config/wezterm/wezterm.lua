local wezterm = require("wezterm")
local act = wezterm.action

function strip_home_name(text)
	local username = os.getenv("USER")
	clean_text = text:gsub("/home/" .. username, "~")
	return clean_text
end

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
	local zoomed = ""
	if tab.active_pane.is_zoomed then
		zoomed = "[Z] "
	end

	local index = ""
	if #tabs > 1 then
		index = string.format("[%d/%d] ", tab.tab_index + 1, #tabs)
	end

	local clean_title = strip_home_name(tab.active_pane.title)
	return zoomed .. index .. clean_title
end)

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

return {
	color_scheme = "Dracula",
	default_cursor_style = "BlinkingBar",
	font_size = 18.0,
	font = wezterm.font_with_fallback({
		"Rec Mono Duotone",
		"Font Awesome 6 Free Regular",
		"Font Awesome 6 Free Solid",
		"Font Awesome 6 Free Brands Regular",
	}),
	warn_about_missing_glyphs = false,
	check_for_updates = false,
	-- Tab Bar Options
	use_fancy_tab_bar = true,
	enable_tab_bar = true,
	tab_max_width = 25,
	-- Padding
	window_padding = { left = 10, right = 10, top = 10, bottom = 10 },
	-- Misc
	adjust_window_size_when_changing_font_size = false,
	-- Theme
	inactive_pane_hsb = {
		saturation = 0.1,
		brightness = 1.0,
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
	disable_default_key_bindings = false,
	quick_select_alphabet = "colemak",
	leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 },
	keys = {
		{ key = "f", mods = "LEADER", action = "QuickSelect" },
		{ key = "/", mods = "LEADER", action = wezterm.action({ Search = { CaseInSensitiveString = "" } }) },
		{ key = "c", mods = "LEADER", action = "ActivateCopyMode" },

		{ key = "w", mods = "ALT", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "y", mods = "CTRL", action = wezterm.action({ PasteFrom = "Clipboard" }) },

		{
			key = "h",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "help",
			}),
		},
		{
			key = "t",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "tab",
				one_shot = false,
			}),
		},
		{
			key = "p",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "switch_pane",
				one_shot = false,
			}),
		},
		{
			key = "r",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "resize_pane",
				one_shot = false,
			}),
		},
		{
			-- scroll
			key = "s",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "scroll",
				one_shot = false,
			}),
		},
	},

	key_tables = {
		help = {
			{ key = "r", action = "ReloadConfiguration" },
		},
		tab = {
			-- split
			{ key = "s", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
			-- vsplit
			{ key = "v", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
			{ key = "n", action = act({ SpawnTab = "CurrentPaneDomain" }) },
			{ key = "X", action = act({ CloseCurrentTab = { confirm = true } }) },
			{ key = "x", action = act({ CloseCurrentPane = { confirm = true } }) },
			{ key = "m", action = act({ ActivateTabRelative = 1 }) },
			{ key = "i", action = act({ ActivateTabRelative = -1 }) },

			{ key = "Escape", action = "PopKeyTable" },
		},
		switch_pane = {
			{ key = "m", action = act({ ActivatePaneDirection = "Left" }) },
			{ key = "n", action = act({ ActivatePaneDirection = "Down" }) },
			{ key = "e", action = act({ ActivatePaneDirection = "Up" }) },
			{ key = "i", action = act({ ActivatePaneDirection = "Right" }) },

			{ key = "Escape", action = "PopKeyTable" },
		},
		resize_pane = {
			{ key = "m", action = act.AdjustPaneSize({ "Left", 1 }) },
			{ key = "n", action = act.AdjustPaneSize({ "Down", 1 }) },
			{ key = "e", action = act.AdjustPaneSize({ "Up", 1 }) },
			{ key = "i", action = act.AdjustPaneSize({ "Right", 1 }) },

			{ key = "Escape", action = "PopKeyTable" },
		},
		scroll = {
			{ key = "e", action = act({ ScrollByPage = -1 }) },
			{ key = "n", action = act({ ScrollByPage = 1 }) },

			{ key = "Escape", action = "PopKeyTable" },
		},
		copy_mode = {
			{ key = "c", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "g", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },

			{ key = "m", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "n", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "e", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "i", mods = "NONE", action = act.CopyMode("MoveRight") },

			{ key = "LeftArrow", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "DownArrow", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "UpArrow", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "RightArrow", mods = "NONE", action = act.CopyMode("MoveRight") },

			{ key = "RightArrow", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
			{ key = "f", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
			{ key = "Tab", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },

			{ key = "LeftArrow", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "Tab", mods = "SHIFT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },

			{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = "Enter", mods = "NONE", action = act.CopyMode("MoveToStartOfNextLine") },

			{ key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "^", mods = "SHIFT", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "m", mods = "ALT", action = act.CopyMode("MoveToStartOfLineContent") },

			{ key = " ", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "V", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },

			{ key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },

			{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
			{ key = "H", mods = "SHIFT", action = act.CopyMode("MoveToViewportTop") },
			{ key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
			{ key = "M", mods = "SHIFT", action = act.CopyMode("MoveToViewportMiddle") },
			{ key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },
			{ key = "L", mods = "SHIFT", action = act.CopyMode("MoveToViewportBottom") },

			{ key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
			{ key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
			{ key = "O", mods = "SHIFT", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },

			{ key = "PageUp", mods = "NONE", action = act.CopyMode("PageUp") },
			{ key = "PageDown", mods = "NONE", action = act.CopyMode("PageDown") },

			{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
			{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
		},
	},
}
