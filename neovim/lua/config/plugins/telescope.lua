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
                },
            },
            i = {
                ["<C-LeftMouse>"] = require("telescope.actions").select_tab,
                ["<C-CR>"] = require("telescope.actions").select_tab,
            }
        },
        extensions = {
            fzf = {
                fuzzy = true,
                case_mode = "smart_case",
            }
        }
    }
}
