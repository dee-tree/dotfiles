
function map(mode, shortcut, command, rec)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = not rec, silent = true })
end

function nmap(shortcut, command, norec)
  map('n', shortcut, command, norec)
end

function imap(shortcut, command, norec)
  map('i', shortcut, command, norec)
end

function omap(shortcut, command, norec)
  map('o', shortcut, command, norec)
end

function vmap(shortcut, command, norec)
  map('v', shortcut, command, norec)
end

vim.g.mapleader = " "

nmap('<C-s>', ':w<CR>', false)       -- save file
imap('<C-s>', '<ESC>:w<CR>', false)  -- save file

nmap('<C-a>', 'ggVG', false)      -- select all
imap('<C-a>', '<ESC>ggVG', false) -- select all

nmap('<C-c>', '"+y', false) -- yank to clipboard
vmap('<C-c>', '"+y', false) -- yank to clipboard

nmap('<A-j>', ':wincmd H<CR>', true)
nmap('<A-k>', ':wincmd J<CR>', true)
nmap('<A-l>', ':wincmd K<CR>', true)
nmap('<A-;>', ':wincmd L<CR>', true)

nmap('j', 'h', false)
vmap('j', 'h', false)
omap('j', 'h', false)

nmap('k', 'j', false)
vmap('k', 'j', false)
omap('k', 'j', false)

nmap('l', 'k', false)
vmap('l', 'k', false)
omap('l', 'k', false)

nmap(';', 'l', false)
vmap(';', 'l', false)
omap(';', 'l', false)

 -- copy to system clipboard
nmap('cp', '"+y', false)
vmap('cp', '"+y', false)

nmap('<leader>q', ':q!<CR>', false)
nmap('<leader>w', ':w<CR>', false)

-- nmap('<leader>d', ':vsplit<CR>', false)
-- nmap('<leader>f', ':split<CR>', false)
nmap('<leader>i', ':split<CR>', false)
nmap('<leader>o', ':split<CR>', false)
nmap('<leader>u', ':vsplit<CR>', false)
nmap('<leader>p', ':vsplit<CR>', false)

-- telescope
nmap('<leader>ff', '<cmd>Telescope find_files<cr>', false)
nmap('<leader>f', '<cmd>Telescope find_files<cr>', false)
nmap('<leader>fg', '<cmd>Telescope live_grep<cr>', false)
nmap('<leader>g', '<cmd>Telescope live_grep<cr>', false)
nmap('<leader>fb', '<cmd>Telescope buffers<cr>', false)
nmap('<leader>fh', '<cmd>Telescope help_tags<cr>', false)

-- neotree bindings --
nmap('<leader>e', '<cmd>Neotree reveal<cr>', false)

nmap('<leader>;', '<cmd>Noice pick<cr>', false)

-- neotree windows movement
-- nmap('<A-left>', '<C-w>h', false)
-- vmap('<A-left>', '<C-w>h', false)
-- omap('<A-left>', '<C-w>h', false)

-- nmap('<A-down>', '<C-w>j', false)
-- vmap('<A-down>', '<C-w>j', false)
-- omap('<A-down>', '<C-w>j', false)

-- nmap('<A-up>', '<C-w>k', false)
-- vmap('<A-up>', '<C-w>k', false)
-- omap('<A-up>', '<C-w>k', false)

-- nmap('<A-right>', '<C-w>l', false)
-- vmap('<A-right>', '<C-w>l', false)
-- omap('<A-right>', '<C-w>l', false)
--                 --

-- windows (panes) navigation (not required since smart-splits setting) --
-- nmap('<A-j>', ':wincmd h<CR>', true)
-- nmap('<A-k>', ':wincmd j<CR>', true)
-- nmap('<A-l>', ':wincmd k<CR>', true)
-- nmap('<A-;>', ':wincmd l<CR>', true)
--                            --