return {
    "RRethy/vim-illuminate",
    opts = {
        delay = 200,
    },

    config = function(_, opts)
    end,

    keys = function()
        local ilu = require("illuminate")
        return {
            { "]r", ilu.goto_next_reference },
            { "[r", ilu.goto_prev_reference },
        }
    end,
}
