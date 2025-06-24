local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
    config.color_scheme = 'Catppuccin Macchiato'

    config.use_fancy_tab_bar = false
    config.tab_bar_at_bottom = true
    config.hide_tab_bar_if_only_one_tab = false -- should be shown if statusline plugins are used
    config.tab_max_width = 16
    config.window_background_opacity = 0.85

    -- window theme
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
    -- config.window_decorations = "RESIZE"
    config.enable_scroll_bar = true

    -- previous2 background color (bit lighter): #292C35
    -- previous1 background color (bit darker): #24262e
    -- current background color (between previous1 and previous2): #262A32
    config.colors = {
        background = '#262A32',
        scrollbar_thumb = '3a3d44',
        tab_bar = {
            background = '#262A32',
            active_tab = {
                bg_color = '#262A32',
                fg_color = '#c0c0c0',
                underline = "Single",
            },
            inactive_tab = {
                bg_color = '#262A32',
                fg_color = '#c0c0c0',
            },
            inactive_tab_hover = {
                bg_color = '#3a3d44',
                fg_color = '#c0c0c0',
            },
            new_tab = {
                bg_color = '#262A32',
                fg_color = '#c0c0c0',
            },
        },
    }

    config.inactive_pane_hsb = {
        saturation = 0.8,
        brightness = 0.7,
    }
end

return module