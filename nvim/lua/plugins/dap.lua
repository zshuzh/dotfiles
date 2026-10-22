return {
    {
        'mfussenegger/nvim-dap',
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            -- 🚧 trying to debug neovim source 🚧
            dap.configurations.c = {
                {
                    name = 'Attach to a running Neovim instance',
                    type = 'codelldb',
                    request = 'attach',
                    pid = function()
                        return require('dap.utils').pick_process({ filter = "nvim" })
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                },
            }

            -- TODO: I think this can be combined with the above configuration
            -- ‼️ YOU NEED TO COMPILE WITH DEBUG SYMBOLS FOR THIS TO WORK ‼️
            -- dap.configurations.c = {
            --   {
            --     name = 'Launch and debug a C executable',
            --     type = 'codelldb',
            --     request = 'launch',
            --     program = function()
            --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            --     end,
            --     cwd = '${workspaceFolder}',
            --     stopOnEntry = false,
            --     args = {},
            --   },
            -- }

            -- not tested
            dap.configurations.cpp = dap.configurations.c
            dap.configurations.rust = dap.configurations.c

            dap.configurations.python = {
                {
                    type = 'python',
                    request = 'launch',
                    name = "Launch and debug the current Python file",
                    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
                    program = "${file}", -- This configuration will launch the current file if used.
                }
            }

            -- automatically open dapui
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
        end,
        keys = {
            -- { "<leader>b", "<CMD>DapToggleBreakpoint<CR>", desc = "Toggle breakpoint" },
            { "<F1>", "<CMD>DapContinue<CR>",  desc = "Continue" },
            { "<F2>", "<CMD>DapStepInto<CR>",  desc = "Step into" },
            { "<F3>", "<CMD>DapStepOver<CR>",  desc = "Step over" },
            { "<F4>", "<CMD>DapStepOut<CR>",   desc = "Step out" },
            { "<F5>", "<CMD>DapStepBack<CR>",  desc = "Step back" },
            { "<F6>", "<CMD>DapRestart<CR>",   desc = "Restart" },
            { "<F7>", "<CMD>DapTerminate<CR>", desc = "Terminate" },
        },
        dependencies = {
            'williamboman/mason.nvim',
            'jay-babu/mason-nvim-dap.nvim',
        }
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        lazy = true,
        opts = {
            -- inconsistent behavior, sometimes needs language name, sometimes needs debugger name
            -- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
            ensure_installed = {
                'codelldb',
                'python'
            },
            handlers = {},
        },
        dependencies = {
            'williamboman/mason.nvim'
        }
    },
    {
        'rcarriga/nvim-dap-ui',
        lazy = true,
        opts = {
            -- not working :(
            element_mappings = {
                breakpoints = {
                    open = "gd",
                    toggle = "<CR>",
                }
            }
        },
        dependencies = {
            'nvim-neotest/nvim-nio'
        }
    }
}
