local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
    config.initial_cols = 120
    config.initial_rows = 28

    config.font_size = 11
    config.color_scheme = 'OneDark (base16)'

    config.use_fancy_tab_bar = false
    config.tab_bar_at_bottom = true
    config.tab_max_width = 16
    config.window_background_opacity = 0.85
    config.font = wezterm.font_with_fallback {
        'JetBrainsMono Nerd Font',
        'JetBrains Mono',
        'MesloLGS NF',
        'Fira Code'
    }
    config.switch_to_last_active_tab_when_closing_tab = true
    config.adjust_window_size_when_changing_font_size = false
    config.hide_tab_bar_if_only_one_tab = true
    config.disable_default_key_bindings = true -- may be commented

    -- window theme
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
    -- config.window_decorations = "RESIZE"

    -- previous background color (bit lighter): #292C35
    -- current background color (bit darker): #24262E

    config.colors = {
        background = '#24262e',
        tab_bar = {
            background = '#24262e',
            active_tab = {
                bg_color = '#343844',
                fg_color = '#c0c0c0',
            },
            inactive_tab = {
                bg_color = '#24262e',
                fg_color = '#c0c0c0',
            },
            new_tab = {
                bg_color = '#24262e',
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