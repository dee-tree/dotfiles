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
        integrations = {
            notify = true,
            noice = true,
            neotree = true,
        },

        highlight_overrides = {
            all = function(colors)
                return {
                    NeoTreeDirectoryIcon = { fg = colors.lavender },
                    NeoTreeDirectoryName = { fg = colors.lavender },
                    NeoTreeTitleBar = { fg = colors.lavender },
                    NeoTreeRootName = { fg = colors.lavender },
                    NeoTreeGitUntracked = { fg = colors.teal },
                }
            end
        }
    })
        -- require("bufferline").setup {
        -- highlights = require("catppuccin.groups.integrations.bufferline").get()
        -- }
    end
}
