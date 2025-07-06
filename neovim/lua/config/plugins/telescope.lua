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
    },
    keys = {
        {
            "<leader><leader>",
            "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
            desc = "Switch Buffer",
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
            desc = "Show buffers"
        },

        
    },
    opts = {
        pickers = {
            find_files = {
                follow = true,
            },
        },
        defaults = {
        mappings = {
            n = {
                ["k"] = require("telescope.actions").move_selection_next,
                ["l"] = require("telescope.actions").move_selection_previous,
                ["<C-LeftMouse>"] = require("telescope.actions").select_tab,
                ["<C-CR>"] = require("telescope.actions").select_tab,
                ["i"] = require("telescope.actions").preview_scrolling_down,
                ["o"] = require("telescope.actions").preview_scrolling_up,
            },
            i = {
                ["<C-LeftMouse>"] = require("telescope.actions").select_tab,
                ["<C-CR>"] = require("telescope.actions").select_tab,
                ["<C-k>"] = require("telescope.actions").preview_scrolling_down,
                ["<C-l>"] = require("telescope.actions").preview_scrolling_up,
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
                end
            }
        },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                case_mode = "smart_case",
            }
        }
    },
}
