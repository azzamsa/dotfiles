local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("format-window-title", function(_, _, _, _, _)
    -- Hide window title
    return ""
end)

return {
    default_prog = { "zellij" },
    default_cursor_style = "BlinkingBar",
    font_size = 22.0,
    -- https://github.com/braver/programmingfonts
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
        { key = "V", mods = "CTRL|SHIFT", action = act({ PasteFrom = "Clipboard" }) },
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
            -- Used by `box`, `slidev`
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
    -- https://wezfurlong.org/wezterm/colorschemes/index.html
    force_reverse_video_cursor = true,
    colors = {
        foreground = "#c8d3f5",
        background = "#222436",

        cursor_bg = "#c8d3f5",
        cursor_fg = "#222436",
        cursor_border = "#c8d3f5",

        ansi = {
            -- Atuin page title
            "#ff966c",
            -- Starship VCS status
            "#ffc777",
            -- Atuin time elapsed
            "#c3e88d",
            --`ls` file with extension, Starship elapsed time
            "#fca7ea",
            -- `ls` directory, Starship version
            "#86e1fc",
            -- Starship VCS branch
            "#c099ff",
            -- Starship Project name
            "#82aaff",
            -- `taze` progress bar
            "#4fd6be",
        },
        brights = {
            -- Atuin page title
            "#ff966c",
            -- VCS status
            "#ffc777",
            -- Atuin time elapsed
            "#c3e88d",
            --`ls` file with extension, Starship elapsed time,
            "#fca7ea",
            -- `ls` directory
            "#86e1fc",
            -- VCS branch
            "#c099ff",
            -- Starship Project name
            "#82aaff",
            -- `taze` progress bar
            "#4fd6be",
        },
        indexed = { [16] = "#ff966c", [17] = "#c8d3f5" },
    },
}
