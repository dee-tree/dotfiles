return {
    "neovim/nvim-lspconfig",
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

    end
}
