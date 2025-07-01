return {
    'nvim-lualine/lualine.nvim',

    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        theme = 'catppuccin',
        options = {
            section_separators = '',
            component_separators = '',
        },
        sections = {
            lualine_a = {
                { 'mode', fmt = function (mode)
                    return table.concat(vim.tbl_map(function (word) return word:sub(1,1) end, vim.split(mode, ' ')))
                  end
                }
            },
        },
        extensions = {
            'neo-tree',
        },
    },
}
