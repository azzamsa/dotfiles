local M = {}

function M.append(config)
    local options = {
        -- Set to `zellij` if you are in Hyprland.
        -- Sticky keys don't work there because of `enable_wayland: false`,
        -- so you need `zellij` as a replacement.
        -- Otherwise, set it to `fish`
        default_prog = { "{{ default_terminal_app }}" },
        -- Enabled by default but it will not start in Hyprland.
        -- Set to `false` if you are in Hyprland, Otherwise leave as is.
        enable_wayland = true, -- default: true,

        -- I want to get confirmation for ANY process.
        skip_close_confirmation_for_processes_named = {}, -- default: many process

        -- The default value is `true`. Just to make sure!
        -- Because sometimes it laggy
        automatically_reload_config = true, --default: true. Just to make sure!
    }

    for key, value in pairs(options) do
        config[key] = value
    end
end

return M
