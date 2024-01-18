local M = {}

function M.append(config)
    local options = {
        default_prog = { "fish" },
        -- default: true, but it will not start in Hyprland.
        enable_wayland = false,
        -- I want to get confirmation for ANY process.
        skip_close_confirmation_for_processes_named = {}, -- default: many process
    }

    for key, value in pairs(options) do
        config[key] = value
    end
end

return M
