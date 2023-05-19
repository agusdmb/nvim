return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            vim.keymap.set('n', '<F5>', function()
                require('dap').continue()
            end)
            vim.keymap.set('n', '<F10>',
                           function() require('dap').step_over() end)
            vim.keymap.set('n', '<F11>',
                           function() require('dap').step_into() end)
            vim.keymap.set('n', '<F12>',
                           function() require('dap').step_out() end)
            vim.keymap.set('n', '<Leader>b',
                           function()
                require('dap').toggle_breakpoint()
            end)
            vim.keymap.set('n', '<Leader>B',
                           function() require('dap').set_breakpoint() end)
            vim.keymap.set('n', '<Leader>lp', function()
                require('dap').set_breakpoint(nil, nil, vim.fn
                                                  .input('Log point message: '))
            end)
            vim.keymap.set('n', '<Leader>dr',
                           function() require('dap').repl.open() end)
            vim.keymap.set('n', '<Leader>dl',
                           function() require('dap').run_last() end)
            vim.keymap.set({'n', 'v'}, '<Leader>dh',
                           function()
                require('dap.ui.widgets').hover()
            end)
            vim.keymap.set({'n', 'v'}, '<Leader>dp',
                           function()
                require('dap.ui.widgets').preview()
            end)
            vim.keymap.set('n', '<Leader>df', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.frames)
            end)
            vim.keymap.set('n', '<Leader>ds', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end)
        end
    }, {
        'mfussenegger/nvim-dap-python',
        config = function()
            local mason_path = vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/')
            require('dap-python').setup(mason_path ..
                                            'packages/debugpy/venv/bin/python')
            require('dap-python').test_runner = "pytest"
        end
    }, {
        'rcarriga/nvim-dap-ui',
        config = function()
            require("dapui").setup()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    }, "nvim-neotest/neotest-go", {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim", "nvim-neotest/neotest-python"
        },
        config = function()
            -- vim.builtin.dap.active = true
            require("neotest").setup({
                quickfix = {enabled = true, open = false},
                adapters = {
                    require("neotest-python")({
                        -- Extra arguments for nvim-dap configuration
                        dap = {
                            justMyCode = false,
                            console = "integratedTerminal"
                        },
                        -- Command line arguments for runner
                        -- Can also be a function to return dynamic values
                        args = {"--log-level", "DEBUG", "-l"},
                        -- Runner to use. Will use pytest if available by default.
                        -- Can be a function to return dynamic value.
                        runner = "pytest"
                    }), require("neotest-go")
                }
            })
            -- vim.api.nvim_set_keymap("n", "<leader>r", ":lua require('neotest').run.run()<cr>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>r",
                                    ":lua require('neotest').summary.open()<cr>",
                                    {noremap = true, silent = true})
        end
    }
}
