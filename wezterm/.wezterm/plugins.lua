local wezterm = require 'wezterm'
local module = {}

smart_splits = require 'plugin_smart_splits'
tabline = require 'plugin_tabline'

function module.apply_to_config(config)
    smart_splits.apply_to_config(config)
    tabline.apply_to_config(config)
end

return module