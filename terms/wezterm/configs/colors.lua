local M = {}

M.color_schemes = {
    ["snazzy"] = {
        -- Comments taken from Catppuccin Mocha Overlay2 will be kept across themes
        ansi = {
            "#9399b2", -- comments: jj comment,
            "#ff5c57", -- error
            "#5af78e", -- executables (files), jj bookmark, atuin duration
            "#ff9f43", -- specific files, prompt duration, jj author
            "#57c7ff", -- directories (file), atuin time
            "#ff6ac1", -- prompt: git branch
            "#9aedfe", -- prompt: dir/project name
            "#ffffff", -- fallback files lla,
        },
        -- Use same color for `brights`. I want a holistic exeperience.
        brights = { "#9399b2", "#ff5c57", "#5af78e", "#ff9f43", "#57c7ff", "#ff6ac1", "#9aedfe", "#ffffff" },
        cursor_bg = "#ff6ac1",
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
    ["tokyonight_moon"] = {
        ansi = { "#9399b2", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#ffffff" },
        brights = { "#9399b2", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#ffffff" },
        cursor_bg = "#86e1fc",
    },
    ["modus_vivendi"] = {
        ansi = { "#989898", "#ff7f86", "#6ae4b9", "#f78fe7", "#79a8ff", "#feacd0", "#4ae2f0", "#ffffff" },
        brights = { "#989898", "#ff7f86", "#6ae4b9", "#f78fe7", "#79a8ff", "#feacd0", "#4ae2f0", "#ffffff" },
        cursor_bg = "#ffffff",
    },
    ["material"] = {
        ansi = { "#9399b2", "#f07178", "#c3e88d", "#ffcb6b", "#82aaff", "#c792ea", "#89ddff", "#ffffff" },
        brights = { "#9399b2", "#f07178", "#c3e88d", "#ffcb6b", "#82aaff", "#c792ea", "#89ddff", "#ffffff" },
        cursor_bg = "#79a8ff",
    },
    ["monokai_pro"] = {
        ansi = { "#9399b2", "#ff6188", "#a9dc76", "#ffd866", "#fc9867", "#ab9df2", "#78dce8", "#ffffff" },
        brights = { "#9399b2", "#ff6188", "#a9dc76", "#ffd866", "#fc9867", "#ab9df2", "#78dce8", "#ffffff" },
        cursor_bg = "#ffd866",
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
        },
    }

    for key, value in pairs(options) do
        config[key] = value
    end
end

return M
