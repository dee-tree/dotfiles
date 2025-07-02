local opt = vim.opt

opt.number = true
opt.clipboard:append { "unnamedplus" } -- keep in sync with the system clipboard
opt.expandtab = true -- use spaces instead of tabs
local tabsize = 4
opt.shiftwidth = tabsize
opt.tabstop = tabsize
opt.softtabstop = tabsize
opt.smartindent = true
opt.wrap = false
opt.mouse = 'a'
opt.completeopt = {'menu', 'menuone', 'noselect'}

opt.splitbelow = true -- open new vertical split bottom
opt.splitright = true -- open new horizontal splits right

opt.incsearch = true -- incremental search
opt.ignorecase = true -- ignore case by default
opt.smartcase = true -- case sensitive if upper case is entered

vim.api.nvim_set_option_value("colorcolumn", "120", {})

local font = "JetBrainsMono Nerd Font:h"
local fontsize = 12
opt.guifont = font .. tostring(fontsize)

if vim.g.neovide then
  vim.opt.guifont = font .. tostring(fontsize)
end

vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
}
