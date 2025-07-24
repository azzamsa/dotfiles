local M = {}

M.color_schemes = {
    ["modus_vivendi"] = {
        ansi = {
            -- Comments taken from Catppuccin Mocha Overlay2 will be kept across themes
            "#989898", -- comments: jj comment,
            "#ff5f59", -- error
            "#44bc44", -- executables (files), jj bookmark, atuin duration
            "#fec43f", -- specific files, prompt duration, jj author
            "#b6a0ff", -- directories (file), atuin time
            "#feacd0", -- prompt: git branch
            "#00d3d0", -- prompt: dir/project name
            "#ffffff", -- fallback files lla,
        },
        -- Use same color for `brights`. I want a holistic exeperience.
        brights = { "#989898", "#ff5f59", "#44bc44", "#fec43f", "#b6a0ff", "#feacd0", "#00d3d0", "#ffffff" },
        cursor_bg = "#ff66ff",
    },
    ["tokyonight_moon"] = {
        ansi = { "#9399b2", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#ffffff" },
        brights = { "#9399b2", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#ffffff" },
        cursor_bg = "#86e1fc",
    },
    ["material_palenight"] = {
        ansi = { "#9399b2", "#f07178", "#c3e88d", "#ffcb6b", "#82aaff", "#c792ea", "#89ddff", "#ffffff" },
        brights = { "#9399b2", "#f07178", "#c3e88d", "#ffcb6b", "#82aaff", "#c792ea", "#89ddff", "#ffffff" },
        cursor_bg = "#79a8ff",
    },
    ["dracula"] = {
        ansi = { "#9399b2", "#ff5555", "#50fa7b", "#f1fa8c", "#bd93f9", "#ff79c6", "#8be9fd", "#ffffff" },
        brights = { "#9399b2", "#ff5555", "#50fa7b", "#f1fa8c", "#bd93f9", "#ff79c6", "#8be9fd", "#ffffff" },
        cursor_bg = "#f8f8f2",
    },
    ["catppuccin_mocha"] = {
        ansi = { "#9399b2", "#f38ba8", "#a6e3a1", "#f9e2af", "#89b4fa", "#f5c2e7", "#94e2d5", "#ffffff" },
        brights = { "#9399b2", "#f38ba8", "#a6e3a1", "#f9e2af", "#89b4fa", "#f5c2e7", "#94e2d5", "#ffffff" },
        cursor_bg = "#f5e0dc",
    },
}

function M.append(config)
    local options = {
        color_schemes = M.color_schemes,
        color_scheme = "{{ theme }}",
        colors = {
            -- All the colors below are kept across theme.
            -- Mostly taken from https://catppuccin.com/palette mocha.
            foreground = "#ffffff",
            background = "#000000",
            scrollbar_thumb = "#7f849c",
            --  #1e1e2e (Catpuccin Mocha Base)
            selection_bg = "#1e1e2e",
        },
    }

    for key, value in pairs(options) do
        config[key] = value
    end
end

return M
