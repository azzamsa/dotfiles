local wezterm = require("wezterm")

local M = {}

-- Hide window title
wezterm.on("format-window-title", function(_, _, _, _, _)
    -- Hyprland doesn't have an Alt-tab previewer, so you can get lost easily.
    -- You need to add a title to the app.
    -- return "Wezterm"
    return ""
end)

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- default title.
function M.tab_title(tab)
    local title = tab.tab_title
    -- if the tab title is explicitly set, take that
    if title and #title > 0 then
        return title
    end
    -- Otherwise, use the default title.
    return "  " .. tab.tab_index + 1 .. "  "
end

wezterm.on("format-tab-title", function(tab, _, _, _, _, _)
    local solid_left_arrow = ""
    local solid_right_arrow = ""
    local bg_color = "#222436"
    local bg_active_color = "#2f334d"
    local fg_color = "#c8d3f5"
    local fg_active_color = "#82aaff"

    -- Edge icon color
    local edge_icon_bg = bg_color
    local edge_icon_fg = bg_color

    -- Inactive tab
    local tab_bg_color = bg_active_color
    local tab_fg_color = fg_color

    if tab.is_active then
        tab_bg_color = fg_active_color
        tab_fg_color = bg_color
    end

    edge_icon_fg = tab_bg_color
    local title = M.tab_title(tab)

    return {
        { Background = { Color = edge_icon_bg } },
        { Foreground = { Color = edge_icon_fg } },
        { Text = solid_left_arrow },
        { Background = { Color = tab_bg_color } },
        { Foreground = { Color = tab_fg_color } },
        { Text = title },
        { Background = { Color = edge_icon_bg } },
        { Foreground = { Color = edge_icon_fg } },
        { Text = solid_right_arrow },
    }
end)

-- Converts an internal theme name to the format used by WezTerm.
-- For example, converts `foo_theme` to `Foo Theme`.
-- This helper function ensures consistency and avoids code duplication.
function M.color_scheme_name(name)
    -- Replace underscores with spaces and capitalize each word
    local transformed = name:gsub("_", " "):gsub("(%a)(%w*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
    return transformed
end

function M.append(config)
    local options = {
        default_cursor_style = "BlinkingBar", -- default: 'SteadyBlock'
        cursor_thickness = 2,
        font_size = 22, -- default: 12.0
        font = wezterm.font_with_fallback({ "{{ font }}", "Noto Color Emoji" }),

        color_scheme = "{{ theme }}",
        -- color_scheme = M.color_scheme_name("{{ theme }}"),

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
