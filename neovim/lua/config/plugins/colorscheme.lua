return {
    "catppuccin/nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        require("catppuccin").setup({
        flavour = "macchiato",
        transparent_background = true,
        no_italic = true,
    })
    end
}
