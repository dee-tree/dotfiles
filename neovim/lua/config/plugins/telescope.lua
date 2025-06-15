local actions = require("telescope.actions")

return {
    'nvim-telescope/telescope.nvim',
    branch = "0.1.x",
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
        defaults = {
        mappings = {
            n = {
                ["k"] = actions.move_selection_next,
                ["l"] = actions.move_selection_previous,
                ["<C-LeftMouse>"] = actions.select_tab,
                ["<C-CR>"] = actions.select_tab,
                },
            },
            i = {
                ["<C-LeftMouse>"] = actions.select_tab,
                ["<C-CR>"] = actions.select_tab,
            }
        }
    }
}