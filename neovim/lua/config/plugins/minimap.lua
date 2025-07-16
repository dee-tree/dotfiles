return {
    'dstein64/nvim-scrollview',
    branch = 'main',
    config = function(_, opts)
        local scrollview = require('scrollview')
        scrollview.setup(opts)
        local gitsigns = require('scrollview.contrib.gitsigns')
        gitsigns.setup(opts)
    end,
    opts = {
        excluded_filetypes = {'nerdtree', 'neotree'},
        signs_on_startup = { 'all' },

        enabled = true,
        add_priority = 100,
        change_priority = 100,
        delete_priority = 100,
    },
}
