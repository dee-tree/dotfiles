return {
    'nvim-telescope/telescope.nvim',
    branch = "0.1.x",
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = (build_cmd ~= "cmake") and "make"
            or "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
        {
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
        'debugloop/telescope-undo.nvim',
    },
    keys = {
        {
            "<leader><leader>",
            "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
            desc = "Switch Buffer",
        },
        {
            "<leader>fg",
            function()
                require("telescope").extensions.live_grep_args.live_grep_args()
            end,
            desc = "Show grep result"
        },
        {
            "<leader>fb",
            "<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>",
            desc = "Show buffers"
        },
        {
            "<leader>fc",
            function()
                require('telescope.builtin').find_files {
                    cwd = vim.fn.stdpath('config')
                }
            end,
            desc = "Show nvim config"
        },
        {
            "<leader>fl",
            function()
                vim.cmd('Flog')
            end,
            desc = "Show git log"
        },
        {
            "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Show undo tree"
        },
    },
    opts = function()
        local t_act = require("telescope.actions")
        local lga_act = require("telescope-live-grep-args.actions")

        return {
        pickers = {
            find_files = {
                follow = true,
            },
        },
        defaults = {
        mappings = {
            n = {
                ["k"] = t_act.move_selection_next,
                ["l"] = t_act.move_selection_previous,
                ["<C-LeftMouse>"] = t_act.select_tab,
                ["<C-CR>"] = t_act.select_tab,
                ["i"] = t_act.preview_scrolling_down,
                ["o"] = t_act.preview_scrolling_up,
                ["<RightMouse>"] = t_act.close,
                ["<LeftMouse>"] = t_act.select_default,
                ["<ScrollWheelDown>"] = t_act.move_selection_next,
                ["<ScrollWheelUp>"] = t_act.move_selection_previous,
                ["dd"] = require('telescope.actions').delete_buffer,
            },
            i = {
                ["<C-LeftMouse>"] = t_act.select_tab,
                ["<C-CR>"] = t_act.select_tab,
                ["<C-k>"] = t_act.preview_scrolling_down,
                ["<C-l>"] = t_act.preview_scrolling_up,
                ["<C-c>"] = function()
                    local entry = require("telescope.actions.state").get_selected_entry()
                    local value = entry.value
                    local cb_opts = vim.opt.clipboard:get()
                    if entry.path then
                        value = entry.path
                    end
                    if vim.tbl_contains(cb_opts, "unnamed") then vim.fn.setreg("*", value) end
                    if vim.tbl_contains(cb_opts, "unnamedplus") then
                        vim.fn.setreg("+", value)
                    end
                    vim.fn.setreg("", value)
                end,
                ["<RightMouse>"] = t_act.close,
                ["<LeftMouse>"] = t_act.select_default,
                ["<ScrollWheelDown>"] = t_act.move_selection_next,
                ["<ScrollWheelUp>"] = t_act.move_selection_previous,
                ["<C-d>"] = require('telescope.actions').delete_buffer,

                -- until Telescope 0.2.0
                -- ["<C-j>"] = require('telescope.actions').preview_scrolling_left,
                -- ["<C-;>"] = require('telescope.actions').preview_scrolling_right,
            }
        },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                case_mode = "smart_case",
            },
            live_grep_args = {
                auto_quoting = false,
                mappings = {
                    i = {
                        ['<C-g>'] = lga_act.quote_prompt({ postfix = ' --iglob ' }),
                    },
                }
            },
            undo = {
                side_by_side = false,
                layout_strategy = 'vertical',
                layout_config = {
                    preview_cutoff = 10,
                    preview_height = 0.5,
                }
            },
        }
    }
    end,
}

