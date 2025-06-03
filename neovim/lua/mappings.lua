
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

vim.g.mapleader = ","

nmap('<C-j>', ':wincmd h<CR>', true)
nmap('<C-k>', ':wincmd j<CR>', true)
nmap('<C-l>', ':wincmd k<CR>', true)
nmap('<C-;>', ':wincmd l<CR>', true)

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

nmap('<leader>d', ':vsplit<CR>', false)
nmap('<leader>f', ':split<CR>', false)

nmap('<leader>e', '<Cmd>Neotree reveal<CR>', false)


nmap('<A-left>', '<C-w>h', false)
vmap('<A-left>', '<C-w>h', false)
omap('<A-left>', '<C-w>h', false)

nmap('<A-down>', '<C-w>j', false)
vmap('<A-down>', '<C-w>j', false)
omap('<A-down>', '<C-w>j', false)

nmap('<A-up>', '<C-w>k', false)
vmap('<A-up>', '<C-w>k', false)
omap('<A-up>', '<C-w>k', false)

nmap('<A-right>', '<C-w>l', false)
vmap('<A-right>', '<C-w>l', false)
omap('<A-right>', '<C-w>l', false)
