local wezterm = require 'wezterm'
local module = {}

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local background = "#262A32"
local yellow = "#EBCB8B"
local blue = "#81a1c1"

function module.apply_to_config(config)
tabline.setup({
  options = {
    icons_enabled = true,
    theme = 'OneDark (base16)', -- with this theme, background color corresponds wezterm theme
    tabs_enabled = false,
    theme_overrides = {},
    section_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    theme_overrides = {
      normal_mode = {
        a = { fg = blue, bg = background },
        b = { fg = blue, bg = background },
      },
    }
  },
  sections = {
    tabline_a = { 'mode' },
    tabline_b = { 'workspace' },
    tabline_c = { ' ' },
    tab_active = {
      'index',
      { 'parent', padding = 0 },
      '/',
      { 'cwd', padding = { left = 0, right = 1 } },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tabline_x = { 'ram', 'cpu' },
    tabline_y = { 'datetime', 'battery' },
    tabline_z = { 'domain' },
  },
  extensions = {},
})
end

return module