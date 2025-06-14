local wezterm = require 'wezterm'
local module = {}

local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')

function module.apply_to_config(config)
    smart_splits.apply_to_config(config, {
    -- directional keys to use in order of: left, down, up, right
    direction_keys = { 'LeftArrow', 'DownArrow', 'UpArrow', 'RightArrow' },
    -- if you want to use separate direction keys for move vs. resize, you
    -- can also do this:
    -- direction_keys = {
        -- move = { 'h', 'j', 'k', 'l' },
        -- resize = { 'LeftArrow', 'DownArrow', 'UpArrow', 'RightArrow' },
    -- },
    modifiers = {
        move = 'ALT',
        resize = 'SHIFT|ALT',
    },
    log_level = 'warn', -- info | warn | error
    })
end

return module