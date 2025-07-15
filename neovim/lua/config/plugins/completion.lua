
local default_border = 'rounded'

-- This function is a copy with adoptation of `list.select` function in blink internals
local function select(list, shift, opts)
  if #list.items == 0 or list.context == nil then return end

  -- haven't selected anything yet, select the first item, if cycling enabled
  if list.selected_item_idx == nil then return list.select(1, opts) end

  -- end of the list
  if list.selected_item_idx == #list.items then
    -- preselect is not enabled, we go back to no selection
    local select_mode = list.get_selection_mode(list.context)
    if not select_mode.preselect or select_mode.auto_insert then return list.select(nil, opts) end

    -- cycling around has been disabled, ignore
    if not list.config.cycle.from_bottom then return end

    -- otherwise, we cycle around
    return list.select(1, opts)
  end

  -- typical case, select the next item
  list.select(list.selected_item_idx + shift, opts)
end

local function select_cur(cmp, shift, opts)
    local on_ghost_text = opts and opts.on_ghost_text
    if not cmp.is_menu_visible() and (not on_ghost_text or not cmp.is_ghost_text_visible()) then return end
    vim.schedule(function()
        select(require('blink.cmp.completion.list'), shift, opts)
        require('blink.cmp.completion.windows.ghost_text').clear_preview()
    end)
    return true
end


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
                    -- auto_show = false
                    border = default_border,
                },
                keyword = { range = 'full' },
                ghost_text = {
                    enabled = true,
                    show_with_menu = true,
                    show_without_menu = true,
                },
            },
            keymap = {
                ['<CR>'] = { 'select_and_accept', 'fallback' },
                ['<C-Right>'] = { 'select_and_accept', 'fallback' },
                ['<ESC>'] = { 'cancel', 'fallback' },
                ['<TAB>'] = {
                    function (cmp)
                        if cmp.is_ghost_text_visible() then
                            return select_cur(cmp, 0, { on_ghost_text = true })
                        end
                     end,
                    function(cmp)
                        return select_cur(cmp, 1, { on_ghost_text = true })
                    end,
                    'fallback',
                },
                ['<S-TAB>'] = { 'select_prev', 'fallback' },
            }
        },
    }
}
