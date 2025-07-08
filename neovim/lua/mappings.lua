local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

function nmap(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

function imap(lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end

function omap(lhs, rhs, opts)
  map('o', lhs, rhs, opts)
end

function vmap(lhs, rhs, opts)
  map('v', lhs, rhs, opts)
end

function tmap(lhs, rhs, opts)
  map('t', lhs, rhs, opts)
end

vim.g.mapleader = " "

-- nmap('<C-s>', ':w<CR>', false)       -- save file
-- imap('<C-s>', '<ESC>:w<CR>', false)  -- save file

nmap('<C-a>', 'ggVG')      -- select all
map({'i', 'v'},'<C-a>', '<ESC>ggVG') -- select all

map({'n', 'v'}, '<C-c>', '"+y') -- yank to clipboard
map({'n', 'v'}, 'cp', '"+y')

nmap('<A-j>', ':wincmd H<CR>')
nmap('<A-k>', ':wincmd J<CR>')
nmap('<A-l>', ':wincmd K<CR>')
nmap('<A-;>', ':wincmd L<CR>')

map({'n', 'v', 'o'}, 'j', 'h')
map({'n', 'v', 'o'}, 'k', 'j')
map({'n', 'v', 'o'}, 'l', 'k')
map({'n', 'v', 'o'}, ';', 'l')

-- stay in visual mode for indent/unindent
vmap('<', '<gv')
vmap('>', '>gv')

nmap('<leader>q', ':q!<CR>')
nmap('<leader>w', ':w<CR>')

nmap('<leader>u', '<cmd>leftabove vnew<cr>')
nmap('<leader>p', '<cmd>rightbelow vnew<cr>')
nmap('<leader>i', '<cmd>rightbelow new<cr>')
nmap('<leader>o', '<cmd>leftabove new<cr>')

-- telescope
nmap('<leader>ff', '<cmd>Telescope find_files<cr>')
nmap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nmap('<leader>fh', '<cmd>Telescope help_tags<cr>')
nmap('<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = "Telescope find keymaps" })

-- neotree bindings --
nmap('<leader>e', '<cmd>Neotree reveal<cr>')
nmap('<leader>;', '<cmd>Noice pick<cr>')

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

tmap('<Esc>', '<C-\\><C-n>') -- exit from terminal

map({'t', 'i'}, '<C-BS>', '<C-\\><C-o>dB')
-- tmap('<C-H>', '<C-\\><C-o>dB', true) -- Ctrl-H == Ctrl-Backspace for some terminals
-- imap('<C-H>', '<C-\\><C-o>dB', true) -- Ctrl-H == Ctrl-Backspace for some terminals

-- LSP & completion
imap('<C-Space>', '<cmd>lua vim.lsp.completion.trigger()<cr>')
nmap('<leader>ds', vim.diagnostic.open_float, { desc = "Show diagnostics" })
nmap('<leader>dv', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end)
nmap('K', function() vim.lsp.buf.hover { border = 'rounded', max_height = 25, max_width = 120 } end)
nmap('<leader>rn', vim.lsp.buf.rename, { desc = 'LSP: rename' })
nmap('gd', vim.lsp.buf.definition)
nmap('gD', vim.lsp.buf.declaration)
nmap('gi', vim.lsp.buf.implementation)
nmap('gr', vim.lsp.buf.references)

