return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        search = {
            pattern = [[\b(KEYWORDS)\b]], -- without extra colon
        },
        highlight = {
            pattern = [[.*<(KEYWORDS)\s*]],
        },
    },
    keys = function()
        local td = require('todo-comments')
        local k = {
            { '<leader>ft', '<cmd>TodoTelescope<cr>' },
            { ']t', function() td.jump_next() end },
            { '[t', function() td.jump_prev() end },
        }
        return k
    end
}

