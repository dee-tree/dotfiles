return {
    'dstein64/nvim-scrollview',
    config = function(_, opts)
        local gitsigns = require('scrollview.contrib.gitsigns')
        gitsigns.setup(opts)
    end,
    opts = {
        excluded_filetypes = {'nerdtree', 'neotree'},
        signs_on_startup = { 'all' },

        enabled = true,
        add_symbol = ' ', -- workaround until find out how to fix white pipes in signs
        change_symbol = ' ', -- workaround until find out how to fix white pipes in signs
        add_priority = 100,
        change_priority = 100,
        delete_priority = 100,
    },
}
