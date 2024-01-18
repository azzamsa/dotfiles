local M = {}

function M.append(config)
    local options = {
        default_prog = { "zellij" },
        -- default: true, but it will not start in Hyprland.
        enable_wayland = false,
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
