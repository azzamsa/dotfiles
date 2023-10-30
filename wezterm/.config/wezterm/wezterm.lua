local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
    return ""
end)

return {
    default_cursor_style = "BlinkingBar",
    font_size = 21.0,
    font = wezterm.font("Iosevka Nerd Font"),
    warn_about_missing_glyphs = false,
    check_for_updates = true,

    -- Tab Bar Options
    use_fancy_tab_bar = true,
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    show_tab_index_in_tab_bar = false,

    -- Padding
    window_padding = { left = 10, right = 10, top = 10, bottom = 10 },

    -- Misc
    disable_default_key_bindings = false,
    keys = {
        { key = "y", mods = "CTRL", action = act({ PasteFrom = "Clipboard" }) },
    },
    mouse_bindings = {
        -- Ctrl-click will open the link under the mouse cursor
        {
            event = { Up = { streak = 1, button = "Left" } },
            mods = "CTRL",
            action = act.OpenLinkAtMouseCursor,
        },
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
        -- Ctrl + mouse middle button reset font size
        {
            event = { Down = { streak = 1, button = "Middle" } },
            mods = "CTRL",
            action = act.ResetFontSize,
        },
    },

    font_rules = {
        {
            -- used by `box`, `slidev`
            intensity = "Half",
            font = wezterm.font({
                family = "Iosevka Nerd Font",
                weight = "Light",
            }),
        },
        {
            italic = true,
            intensity = "Bold",
            font = wezterm.font({
                family = "VictorMono Nerd Font",
                weight = "Bold",
                style = "Italic",
            }),
        },
        {
            italic = true,
            intensity = "Half",
            font = wezterm.font({
                family = "VictorMono Nerd Font",
                weight = "DemiBold",
                style = "Italic",
            }),
        },
        {
            italic = true,
            intensity = "Normal",
            font = wezterm.font({
                family = "VictorMono Nerd Font",
                style = "Italic",
            }),
        },
    },

    force_reverse_video_cursor = true,
    colors = {
        foreground = "#DDD8BB", -- Foreground color
        background = "#1F1F28", -- Background color

        cursor_bg = "#E6E0C2", -- Cursor background color
        cursor_fg = "#E6E0C2", -- Cursor foreground color
        cursor_border = "#E6E0C2", -- Cursor border color

        selection_fg = "#E6E0C2", -- Selection foreground color
        selection_bg = "#49473E", -- Selection background color

        scrollbar_thumb = "#16161D", -- Scrollbar thumb color
        split = "#16161D", -- Split color

        ansi = {
            "#1F1F28", -- Black
            "#E46A78", -- Red
            "#98BC6D", -- Green
            "#E5C283", -- Yellow
            "#7EB3C9", -- Blue (Customized)
            "#957FB8", -- Magenta
            "#7EB3C9", -- Cyan
            "#DDD8BB", -- White
        },
        brights = {
            "#A8A48D", -- Bright Black
            "#EC818C", -- Bright Red
            "#9EC967", -- Bright Green
            "#F1C982", -- Bright Yellow
            "#7BC2DF", -- Bright Blue (Customized)
            "#A98FD2", -- Bright Magenta
            "#7BC2DF", -- Bright Cyan
            "#DDD8BB", -- Bright White
        },
        indexed = {
            [16] = "#614A82", -- Active tab background
            [17] = "#363644", -- Inactive tab background
        },
    },
}
