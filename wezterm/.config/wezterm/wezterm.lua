local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
    return ""
end)

return {
    default_cursor_style = "BlinkingBar",
    font_size = 22.0,
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
    colors = {
        background = "#282a36",
        foreground = "#f9f5d7",

        cursor_bg = "#f8b659",
        cursor_fg = "#f8b659",
        cursor_border = "#f9f5d7",

        ansi = {
            "#21222c",
            "#ff5555",
            "#50fa7b",
            "#f1fa8c",
            "#bd93f9",
            "#ff79c6",
            "#8be9fd",
            "#f8f8f2",
        },
        brights = {
            "#6272a4",
            "#ff6e6e",
            "#69ff94",
            "#ffffa5",
            "#d6acff",
            "#ff92df",
            "#a4ffff",
            "#ffffff",
        },
    },
}
