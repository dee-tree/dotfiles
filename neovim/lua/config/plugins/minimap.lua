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
        enabled = true,
        excluded_filetypes = {'nerdtree', 'neotree', 'neo-tree'},
        signs_on_startup = { 'all' },
        signs_scrollbar_overlap = 'over',
        hide_on_cursor_intersect = true,
        signs_max_per_row = 1,

        cursor_priority = 100,
        diagnostics_error_priority = 96,
        diagnostics_warn_priority = 95,
        change_priority = 91,
        add_priority = 90,
        delete_priority = 89,
    },
}
