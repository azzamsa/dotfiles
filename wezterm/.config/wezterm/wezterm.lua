require("configs.on")
local core = require("configs.core")
local keymap = require("configs.keymap")
local ui = require("configs.ui")

local config = {}

core.append(config)
ui.append(config)
keymap.append(config)

return config
