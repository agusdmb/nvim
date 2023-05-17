return {
    "nvim-neotest/neotest-go",
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
                    dap = {justMyCode = false, console = "integratedTerminal"},
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
    end,
    {
        'mfussenegger/nvim-dap-python',
        dependencies = {'mfussenegger/nvim-dap'},
        config = function()
            local mason_path = vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/')
            require('dap-python').setup(mason_path ..
                                            'packages/debugpy/venv/bin/python')
        end
    },
    {
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
    }
}
