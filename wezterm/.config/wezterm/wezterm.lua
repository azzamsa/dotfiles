local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
    return ""
end)

return {
    color_scheme = "Dracula",
    default_cursor_style = "BlinkingBar",
    font_size = 21.0,
    font = wezterm.font("Iosevka Nerd Font"),
    warn_about_missing_glyphs = false,
    check_for_updates = false,

    -- Tab Bar Options
    use_fancy_tab_bar = false,
    enable_tab_bar = false,
    tab_max_width = 25,

    -- Padding
    window_padding = { left = 10, right = 10, top = 10, bottom = 10 },

    -- Misc
    disable_default_key_bindings = false,
    keys = {
        { key = "y", mods = "CTRL", action = act({ PasteFrom = "Clipboard" }) },
    },
}
