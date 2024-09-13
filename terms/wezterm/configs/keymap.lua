local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, _)
    local name = window:active_key_table()
    if name then
        name = "⌛" .. name
    end
    window:set_right_status(name or "")
end)

-- Copy text under selection then clear the selection.
function M.copy_selection(window, pane)
    local has_selection = window:get_selection_text_for_pane(pane) ~= ""
    if has_selection then
        -- Copy to the clipboard too
        window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
        -- window:perform_action(act.ClearSelection, pane)
        window:set_right_status("📋 Copied to clipboard")
    end
end

function M.append(config)
    local options = {
        quick_select_alphabet = "colemak", -- default: qwerty

        --
        -- Mouse mappings
        --
        mouse_bindings = {
            -- Notify the copy selection.
            {
                event = { Up = { streak = 1, button = "Left" } },
                mods = "NONE",
                action = wezterm.action_callback(function(window, pane)
                    M.copy_selection(window, pane)
                end),
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

        --
        -- Keyboard mappings
        --
        keys = {
            { key = "y", mods = "CTRL", action = act({ PasteFrom = "Clipboard" }) },
            { key = "x", mods = "CTRL|SHIFT", action = act({ CloseCurrentTab = { confirm = true } }) },
            { key = "s", mods = "CTRL|SHIFT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
            {
                key = "s",
                mods = "CTRL|SHIFT|ALT",
                action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
            },
            --
            -- Pane
            { key = "x", mods = "CTRL|SHIFT|ALT", action = act({ CloseCurrentPane = { confirm = true } }) },
            {
                key = "Tab",
                mods = "CTRL|ALT",
                action = act.PaneSelect({ alphabet = "arstg" }),
            },
        },
    }

    for key, value in pairs(options) do
        config[key] = value
    end
end

return M
