local wezterm = require("wezterm")
local act = wezterm.action

function get_username()
	local username = os.getenv("USER")
	return username
end

function strip_home_name(text)
	local username = os.getenv("USER")
	clean_text = text:gsub("/home/" .. username, "~")
	return clean_text
end

function clear_selection(window, pane)
	local has_selection = window:get_selection_text_for_pane(pane) ~= ""
	if has_selection then
		window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
		window:perform_action(act.ClearSelection, pane)
	end
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
	-- Spawn a different shell in login mode
	default_prog = { "/home/" .. get_username() .. "/.cargo/bin/nu", "-l" },
	-- color_scheme = "Tomorrow",
	color_scheme = "Dracula",
	default_cursor_style = "BlinkingBar",
	font_size = 18.0,
	font = wezterm.font_with_fallback({
		"Fira Code",
		"Font Awesome 6 Free Regular",
		"Font Awesome 6 Free Solid",
		"Font Awesome 6 Free Brands Regular",
	}),
	warn_about_missing_glyphs = false,
	check_for_updates = true,
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
	-- mouse
	mouse_bindings = {
		-- Scrolling up while holding CTRL increases the font size
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "CTRL",
			action = act.IncreaseFontSize,
		},
		-- Scrolling down while holding CTRL decreases the font size
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "CTRL",
			action = act.DecreaseFontSize,
		},
		-- Reset font size
		{
			event = { Down = { streak = 1, button = "Middle" } },
			mods = "CTRL",
			action = act.ResetFontSize,
		},
	},
	-- keybindings
	disable_default_key_bindings = false,
	quick_select_alphabet = "colemak",
	leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 },
	keys = {
		{ key = "m", mods = "CTRL|ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "i", mods = "CTRL|ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },

		{ key = "f", mods = "LEADER", action = "QuickSelect" },
		{ key = "/", mods = "LEADER", action = act({ Search = { CaseInSensitiveString = "" } }) },
		{ key = "c", mods = "ALT", action = "ActivateCopyMode" },

		{
			key = "w",
			mods = "ALT",
			action = wezterm.action_callback(function(window, pane)
				clear_selection(window, pane)
			end),
		},
		{ key = "y", mods = "CTRL", action = act({ PasteFrom = "Clipboard" }) },

		{ key = "t", mods = "CTRL", action = act({ SpawnTab = "CurrentPaneDomain" }) },

		{ key = "q", mods = "CTRL|SHIFT", action = act({ CloseCurrentTab = { confirm = true } }) },
		{ key = "q", mods = "CTRL", action = act({ CloseCurrentPane = { confirm = true } }) },

		{
			key = "v",
			mods = "CTRL|ALT",
			action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		{
			key = "h",
			mods = "CTRL|ALT",
			action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "RightArrow", mods = "ALT", action = act({ ActivatePaneDirection = "Right" }) },
		{ key = "LeftArrow", mods = "ALT", action = act({ ActivatePaneDirection = "Left" }) },
		{ key = "UpArrow", mods = "ALT", action = act({ ActivatePaneDirection = "Up" }) },
		{ key = "DownArrow", mods = "ALT", action = act({ ActivatePaneDirection = "Down" }) },

		{
			key = "h",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "help",
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
			{
				key = "y",
				mods = "NONE",
				action = wezterm.action_callback(function(window, pane)
					clear_selection(window, pane)
				end),
			},

			{ key = "c", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },

			{ key = "m", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "n", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "e", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "i", mods = "NONE", action = act.CopyMode("MoveRight") },

			{ key = "f", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },

			{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },

			{ key = " ", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },

			{ key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },

			{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
			{ key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
			{ key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },

			{ key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
			{ key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },

			{ key = "PageUp", mods = "NONE", action = act.CopyMode("PageUp") },
			{ key = "PageDown", mods = "NONE", action = act.CopyMode("PageDown") },
			{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
			{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
		},
	},
}
