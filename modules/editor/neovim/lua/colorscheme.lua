local colorscheme = 'catppuccin'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
