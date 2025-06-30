return {
    'nvim-lualine/lualine.nvim',

    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        theme = 'catppuccin',
        options = {
            section_separators = '',
            component_separators = '',
        },
        extensions = {
            'neo-tree',
        },
    },
}
