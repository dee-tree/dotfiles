local wezterm = require 'wezterm'
local utils = require 'dotlocal.utilua'
local module = {}

-- load local options that are machine specific
local haslocaloptions, localoptions = prequire 'dotlocal.local-options'
function module.apply_to_config(config)
    config.initial_cols = 120
    config.initial_rows = 28
    config.font_size = 11
    config.font = wezterm.font_with_fallback {
        'JetBrainsMono Nerd Font',
        'JetBrains Mono',
        'MesloLGS NF',
        'Fira Code'
    }

    config.switch_to_last_active_tab_when_closing_tab = true
    config.adjust_window_size_when_changing_font_size = false
    config.disable_default_key_bindings = true -- may be commented

    -- has a bug (at least on Windows) that after closing neovim, Ctrl does not work anymore
    -- config.enable_kitty_keyboard = true -- to handle Ctrl+Enter and other sequences

    if haslocaloptions then
        localoptions.apply_to_config(config)
    end

end

return module
