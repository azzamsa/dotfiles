local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
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
    -- https://wezfurlong.org/wezterm/colorschemes/index.html
    force_reverse_video_cursor = true,
    colors = {
        foreground = "#dcd7ba",
        background = "#1f1f28",

        cursor_bg = "#dcd7ba",
        cursor_fg = "#dcd7ba",
        cursor_border = "#dcd7ba",

        ansi = {
            -- Atuin page title
            "#ffa066",
            -- VCS status
            "#7e9cd8",
            -- Atuin time elapsed
            "#98bb6c",
            -- Starship elapsed time, `ls` file with extension
            "#7e9cd8",
            -- `ls` directory
            "#e6c384",
            -- VCS branch
            "#957fb8",
            -- Project name
            "#e6c384",
            -- `taze` progress bar
            "#7aa89f",
        },
        brights = {
            -- Atuin page title
            "#ffa066",
            -- VCS status
            "#7e9cd8",
            -- Atuin time elapsed
            "#98bb6c",
            -- Starship elapsed time, `ls` file with extension
            "#7e9cd8",
            -- `ls` directory
            "#e6c384",
            -- VCS branch
            "#957fb8",
            -- Project name
            "#e6c384",
            -- `taze` progress bar
            "#7aa89f",
        },
        indexed = { [16] = "#ffa066", [17] = "#dcd7ba" },
    },
}
