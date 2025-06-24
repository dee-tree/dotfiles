return {
    'nvim-telescope/telescope.nvim',
    branch = "0.1.x",
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
        defaults = {
        mappings = {
            n = {
                ["k"] = require("telescope.actions").move_selection_next,
                ["l"] = require("telescope.actions").move_selection_previous,
                ["<C-LeftMouse>"] = require("telescope.actions").select_tab,
                ["<C-CR>"] = require("telescope.actions").select_tab,
                },
            },
            i = {
                ["<C-LeftMouse>"] = require("telescope.actions").select_tab,
                ["<C-CR>"] = require("telescope.actions").select_tab,
            }
        }
    }
}