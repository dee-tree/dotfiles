local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

local mappings = require 'mappings'
mappings.apply_to_config(config)

local theme = require 'theme'
theme.apply_to_config(config)

local domains = require 'domains'
domains.apply_to_config(config)

-- plugins --
smart_splits = require 'plugin_smart_splits'
smart_splits.apply_to_config(config)
-------------

-- Windows specific
onWindows = wezterm.target_triple == 'x86_64-pc-windows-msvc'
if onWindows then
  config.default_prog = { 'pwsh.exe', '-NoLogo' }
  launch_menu = {}
  table.insert(launch_menu, {
    label = 'PowerShell',
    args = { 'powershell.exe', '-NoLogo' },
  })
  table.insert(launch_menu, {
    label = 'Pwsh',
    args = { 'pwsh.exe', '-NoLogo' },
  })
  config.launch_menu = launch_menu
end
-- --

return config
