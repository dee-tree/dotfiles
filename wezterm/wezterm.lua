local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.font_size = 11
config.color_scheme = 'OneDark (base16)'

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 16
config.window_background_opacity = 0.85
config.font = wezterm.font_with_fallback {
  'JetBrains Mono',
  'MesloLGS NF',
  'Fira Code'
}
config.switch_to_last_active_tab_when_closing_tab = true
config.adjust_window_size_when_changing_font_size = false
hide_tab_bar_if_only_one_tab = true
config.disable_default_key_bindings = true -- may be commented

config.colors = {
  tab_bar = {
    background = '#292C35',
    active_tab = {
      bg_color = '#404553',
      fg_color = '#c0c0c0',
    },
    inactive_tab = {
      bg_color = '#292C35',
      fg_color = '#c0c0c0',
    },
    new_tab = {
      bg_color = '#292C35',
      fg_color = '#c0c0c0',
    },
  }
}

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}

config.mouse_bindings = {
  -- Scrolling up while holding CTRL increases the font size
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = 'CTRL',
    action = act.IncreaseFontSize,
  },

  -- Scrolling down while holding CTRL decreases the font size
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = 'CTRL',
    action = act.DecreaseFontSize,
  },
}

config.leader = {
  key = 'F13',
  timeout_milliseconds = 2000,
}

config.keys = {
  { key = 'C', mods = 'CTRL|SHIFT', action = act({ CopyTo = "Clipboard" }), },
  { key = 'V', mods = 'CTRL|SHIFT', action = act({ PasteFrom = "Clipboard" }), },
  { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
  { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) },
  { key = 'DownArrow', mods = 'CTRL|SHIFT', action = act.ShowTabNavigator },

  { key = 'LeftArrow', mods = 'SHIFT', action = act.ActivatePaneDirection 'Left' },
  { key = 'UpArrow', mods = 'SHIFT', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = 'SHIFT', action = act.ActivatePaneDirection 'Down' },
  { key = 'RightArrow', mods = 'SHIFT', action = act.ActivatePaneDirection 'Right' },

  { key = 'LeftArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Left', 2 } },
  { key = 'UpArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Up', 2 } },
  { key = 'DownArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Down', 2 } },
  { key = 'RightArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Right', 2 } },
  { key = 'f', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'd', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'W', mods = 'CTRL|SHIFT', action = act.CloseCurrentTab { confirm = true } },
  { key = 'w', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },
  { key = 'f', mods = 'CTRL|SHIFT', action = act.ShowTabNavigator },
  { key = 't', mods = 'CTRL|SHIFT', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'r', mods = 'LEADER', action = act.ReloadConfiguration },
  {
    key = 'R', mods = 'CTRL|SHIFT', action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(
        function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end
      ),
    },
  },

  -- copy mode --
  { key = 'c', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },
  
}

config.key_tables = {
  copy_mode = {
    { key="Escape", mods="NONE", action = act.CopyMode 'Close' },
    { key="c", mods="CTRL", action = act.CopyMode 'Close' },
    { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
    { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
    { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveDown' },
    { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
    { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveUp' },
    { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
    { key = ';', mods = 'NONE', action = act.CopyMode 'MoveRight' },
    { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },

    { key="LeftArrow", mods="CTRL", action = act.CopyMode 'MoveBackwardWord' },
    { key="j", mods="CTRL", action = act.CopyMode 'MoveBackwardWord' },
    { key="b", mods="NONE", action = act.CopyMode 'MoveBackwardWord' },

    { key="RightArrow", mods="CTRL", action = act.CopyMode 'MoveForwardWord' },
    { key=";", mods="CTRL", action = act.CopyMode 'MoveForwardWord' },
    { key="e", mods="NONE", action = act.CopyMode 'MoveForwardWord' },

    { key="PageUp", mods="NONE", action = act.CopyMode 'PageUp' },
    { key="PageDown", mods="NONE", action = act.CopyMode 'PageDown' },

    { key="^", mods="SHIFT", action = act.CopyMode 'MoveToStartOfLineContent' },
    { key="$", mods="SHIFT", action = act.CopyMode 'MoveToEndOfLineContent' },

    { key=" ", mods="NONE", action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key=" ", mods="CTRL", action = act.CopyMode { SetSelectionMode = 'Word' } },
    { key=" ", mods="CTRL|SHIFT", action = act.CopyMode { SetSelectionMode = 'Line' } },

    { key="y", mods="NONE", action = act.Multiple { 
      { CopyTo = 'ClipboardAndPrimarySelection' },
      { CopyMode = 'MoveToScrollbackBottom' },
      { CopyMode = 'Close' },
    } },
    { key="c", mods="NONE", action = act.Multiple { 
      { CopyTo = 'ClipboardAndPrimarySelection' },
      { CopyMode = 'MoveToScrollbackBottom' },
      { CopyMode = 'Close' },
    } },
    { key="C", mods="CTRL|SHIFT", action = act.Multiple { 
      { CopyTo = 'ClipboardAndPrimarySelection' },
      { CopyMode = 'MoveToScrollbackBottom' },
      { CopyMode = 'Close' },
    } },
  }
}
-- multiplexing
config.ssh_domains = {
  {
    name = 'ssh.remote.name',
    remote_address = 'ip.address<:port>',
    username = 'user'

  }
}



return config

