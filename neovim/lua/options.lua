local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
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
opt.undofile = true

vim.opt.termsync = false -- fix bad lines updates in ssh

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

local function my_paste(reg)
    return function(lines)
        -- https://github.com/neovim/neovim/issues/28611
        local content = vim.fn.getreg('"')
        return vim.split(content, '\n')

    end
end

vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = my_paste('+'),
      ['*'] = my_paste('*'),
    },
}

