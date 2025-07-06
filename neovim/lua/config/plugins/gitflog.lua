return {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
        "tpope/vim-fugitive",
    },
    -- keys = {
        -- ['<leader>fl'] = "<cmd>Flog<cr>",
    -- }
}
