return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio",
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {
            },
        },
    },
    opts = function()
        local dapui = require 'dapui'
        local dap = require 'dap'

        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end

        return {
            expand_lines = true,
            layouts = {
                {
                    elements = {
                        { id = "scopes", size = 0.33 },
                        { id = "breakpoints", size = 0.17 },
                        { id = "stacks", size = 0.25 },
                        { id = "watches", size = 0.25 },
                    },
                    size = 0.33,
                    position = "right",
                },
                {
                    elements = {
                        { id = "repl", size = 0.45 },
                        { id = "console", size = 0.55 },
                    },
                    size = 0.27,
                    position = "bottom",
                },
		    },
        }
    end,
    keys = function()
        local dapui = require 'dapui'
        return {
            { '<leader>dd', dapui.toggle, desc = '[dap-ui] Toogle dap ui' },
            { '<leader>de', dapui.eval, desc = '[dap-ui] Eval' },
        }
    end,
}
