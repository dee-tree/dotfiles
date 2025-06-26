return {
    "catppuccin/nvim",
    priority = 1000, -- Ensure it loads first
    -- dependencies = "akinsho/bufferline.nvim",
    config = function()
        require("catppuccin").setup({
        flavour = "macchiato",
        transparent_background = true,
        no_italic = true,
        term_colors = true,
    })
        -- require("bufferline").setup {
        -- highlights = require("catppuccin.groups.integrations.bufferline").get()
        -- }
    end
}
