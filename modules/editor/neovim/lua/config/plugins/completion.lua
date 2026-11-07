local default_sources = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' }
local debug_sources = vim.list_extend(vim.deepcopy(default_sources), { 'dap' })
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
    {
        'saghen/blink.compat',
        -- version = '*',
        lazy = true,
        opts = {},
    },
    { -- blink completion source for require statements and module annotations
        "saghen/blink.cmp",
        version = '1.*',
        dependencies = {
            "rcarriga/cmp-dap"
        },
        opts = {
            enabled = function()
                return vim.bo.buftype ~= 'prompt' or require('cmp_dap').is_dap_buffer()
            end,
            sources = {
                -- add lazydev to your completion providers
                default = default_sources,
                per_filetype = { ['dap-repl'] = debug_sources, dapui_watches = debug_sources, dapui_hover = debug_sources },
                providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
                dap = {
                    name = 'dap',
                    module = 'blink.compat.source',
                    enabled = function()
                      return require('cmp_dap').is_dap_buffer()
                    end,
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
