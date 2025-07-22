return {
    "mfussenegger/nvim-dap",
    keys = function()
        local dap = require 'dap'
        return {
            { "<leader>bb", dap.toggle_breakpoint, desc = "[dap] Toggle Breakpoint" },
            { "<leader>dj", dap.step_back, desc = "[dap] Step back" },
            { "<leader>dk", dap.step_into, desc = "[dap] Step into" },
            { "<leader>dl", dap.step_out, desc = "[dap] Step out" },
            { "<leader>d;", dap.step_over, desc = "[dap] Step over" },
            { "<leader>dn", dap.continue, desc = "[dap] Continue" },
            { "<leader>dc", dap.run_to_cursor, desc = "[dap] Run to cursor" },
            { "<leader>dw", dap.disconnect, desc = "[dap] Disconnect" },
            { "<leader>dq", dap.terminate, desc = "[dap] Terminate" },
        }
    end,
    config = function()
        -- signs
        for _, group in pairs({
            "DapBreakpoint",
            "DapBreakpointRejected",
            "DapLogPoint",
        }) do
            vim.fn.sign_define(group, { text = "●", texthl = group })
        end
        for _, group in pairs({
            "DapBreakpointCondition",
        }) do
            vim.fn.sign_define(group, { text = "◆", texthl = group })
        end
        vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl='DapStoppedLine', numhl = "DapStopped" })

        -- Decides when and how to jump when stopping at a breakpoint
        -- The order matters!
        --
        -- (1) If the line with the breakpoint is visible, don't jump at all
        -- (2) If the buffer is opened in a tab, jump to it instead
        -- (3) Else, create a new tab with the buffer
        --
        -- This avoid unnecessary jumps
        require("dap").defaults.fallback.switchbuf = "usevisible,usetab,newtab"

        -- llvm (lldb) adapter, C/C++/rust/etc
        require('config.dap.llvm')


    end
}
