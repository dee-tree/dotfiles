return {
    -- "olimorris/onedarkpro.nvim",
    "rmehri01/onenord.nvim",
    priority = 1000, -- Ensure it loads first
    opts = {
        styles = {
            diagnostics = "underline",
        },
        disable = {
            background = true,
        }

    --   colors = {
    -- -- red = "#e06c75" -- default
    -- red = "#E97B84"
    --   }
    }
}
