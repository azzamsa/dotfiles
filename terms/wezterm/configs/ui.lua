local wezterm = require("wezterm")

local M = {}

function M.append(config)
    local options = {
        default_cursor_style = "BlinkingBar", -- default: 'SteadyBlock'
        cursor_thickness = 2,
        font_size = 22, -- default: 12.0
        font = wezterm.font_with_fallback({ "{{ font }}", "Noto Color Emoji" }),

        enable_scroll_bar = true, --default: false
        scrollback_lines = 10000, --default: 3500

        -- Padding
        -- Tab bar can't have padding https://github.com/wez/wezterm/issues/3077
        window_padding = { left = 10, right = 10, top = 0, bottom = 0 },

        -- Tab Bar Options
        -- GTK tab-bar is looking awful.
        use_fancy_tab_bar = true, -- default: true

        -- Hiding the tab-bar also means hiding the right status
        -- Means you lose viseal feedback of sticky keys.
        -- It is better to set it to `false`
        hide_tab_bar_if_only_one_tab = true, -- default: false

        inactive_pane_hsb = {
            saturation = 0.70,
            brightness = 0.70,
        },

        window_frame = {
            -- The size of the font in the tab bar.
            font_size = 14.0, -- default: 12.0
        },
    }

    for key, value in pairs(options) do
        config[key] = value
    end
end

return M
