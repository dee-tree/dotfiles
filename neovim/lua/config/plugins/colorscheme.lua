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
                    NeoTreeRootName = { fg = colors.lavender, style = { "bold" } },
                    NeoTreeGitUntracked = { fg = colors.teal },
                    NeoTreeTitleBar = { fg = colors.mantle, bg = colors.lavender },

                    DapStopped = { bg = colors.surface0 },
                    DapStoppedLine = { bg = colors.surface0 },

                    IlluminatedWordText = { style = { "underline" } },
                    IlluminatedWordRead = { style = { "underline" } },
                    IlluminatedWordWrite = { style = { "underline" } },
                }
            end
        }
    })
        -- require("bufferline").setup {
        -- highlights = require("catppuccin.groups.integrations.bufferline").get()
        -- }
    end
}
