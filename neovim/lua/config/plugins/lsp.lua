return {
    "neovim/nvim-lspconfig",
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "mason-org/mason-lspconfig.nvim",
            dependencies = {
                { "mason-org/mason.nvim", opts = {} },
            },
            opts = {
                ensure_installed = {
                    "lua_ls"
                },
            },
    },
    },
    config = function()
        local cfg = require('lspconfig')

        vim.diagnostic.config({
            virtual_text = true,
            underline = true
        })
    end
}
