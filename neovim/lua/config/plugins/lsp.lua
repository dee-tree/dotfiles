return {
    {
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
                        "lua_ls",
                        "rust_analyzer",
                        "bashls",
                        "clangd",
                        "cmake",

                        "jsonls",
                    },
                },
        },
        },
        config = function()
            local cfg = require('lspconfig')

            vim.diagnostic.config({
                virtual_text = {
                    source = 'if_many',
                    prefix = "●",
                    spacing = 2,
                },

                underline = true,
                severity_sort = true,
                signs = {
                    active = true,
                    text = {
                      [vim.diagnostic.severity.ERROR] = '',
                      [vim.diagnostic.severity.WARN]  = '',
                      [vim.diagnostic.severity.HINT]  = '',
                      [vim.diagnostic.severity.INFO]  = '',
                    }
                }
            })
        end
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
        library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
        },
    },
}
