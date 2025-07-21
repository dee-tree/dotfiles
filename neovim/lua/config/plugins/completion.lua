
local default_border = 'rounded'

return {
    { -- cmp completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require('cmp')
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },
    { -- blink completion source for require statements and module annotations
        "saghen/blink.cmp",
        version = '1.*',
        opts = {
            sources = {
                -- add lazydev to your completion providers
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
                },
            },
            signature = { window = { border = default_border } },
            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    window = { border = default_border },
                },
                menu = {
                    border = default_border,
                },
                keyword = { range = 'full' },
                ghost_text = {
                    enabled = true,
                    show_with_menu = true,
                    show_without_menu = true,
                    show_without_selection = true,
                },
                list = {
                    selection = {
                        preselect = false,
                    },
                },
            },
            keymap = {
                ['<CR>'] = { 'select_and_accept', 'fallback' },
                ['<C-Right>'] = { 'select_and_accept', 'fallback' },
                ['<ESC>'] = { 'cancel', 'fallback' },
                ['<TAB>'] = { 'select_next', 'fallback' },
                ['<S-TAB>'] = { 'select_prev', 'fallback' },
            }
        },
    }
}
