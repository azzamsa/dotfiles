require("configs.on")
local core = require("configs.core")
local keymap = require("configs.keymap")
local ui = require("configs.ui")
local colors = require("configs.colors")

local config = {}

core.append(config)
ui.append(config)
keymap.append(config)
colors.append(config)

return config
