vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "LspDiagnosticsError", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })

vim.api.nvim_create_user_command("DebugPython", "lua require('dap-python').test_method()", {})

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"mfussenegger/nvim-dap-python",
				config = function()
					local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
					require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
					require("dap-python").test_runner = "pytest"
				end,
			},
			{
				"rcarriga/nvim-dap-ui",
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
				end,
			},
      -- {
      --   "leoluz/nvim-dap-go",
      --   config = function()
      --     require("dap-go").setup()
      --   end
      -- }
		},
		config = function()
			-- vim.keymap.set("n", "<F5>", function()
			-- 	require("dap").continue()
			-- end)
			-- vim.keymap.set("n", "<F10>", function()
			-- 	require("dap").step_over()
			-- end)
			-- vim.keymap.set("n", "<F11>", function()
			-- 	require("dap").step_into()
			-- end)
			-- vim.keymap.set("n", "<F12>", function()
			-- 	require("dap").step_out()
			-- end)
			-- vim.keymap.set("n", "<Leader>b", function()
			-- 	require("dap").set_breakpoint()
			-- end)
			vim.keymap.set("n", "<Leader>B", function()
				require("dap").toggle_breakpoint()
			end, { desc = "Toggle breakpoint" })
			-- vim.keymap.set("n", "<Leader>lp", function()
			-- 	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			-- end)
			-- vim.keymap.set("n", "<Leader>dr", function()
			-- 	require("dap").repl.open()
			-- end)
			-- vim.keymap.set("n", "<Leader>dl", function()
			-- 	require("dap").run_last()
			-- end)
			-- vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			-- 	require("dap.ui.widgets").hover()
			-- end)
			-- vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			-- 	require("dap.ui.widgets").preview()
			-- end)
			-- vim.keymap.set("n", "<Leader>df", function()
			-- 	local widgets = require("dap.ui.widgets")
			-- 	widgets.centered_float(widgets.frames)
			-- end)
			-- vim.keymap.set("n", "<Leader>ds", function()
			-- 	local widgets = require("dap.ui.widgets")
			-- 	widgets.centered_float(widgets.scopes)
			-- end)
		end,
		keys = {
			-- "<F5>",
			-- "<F10>",
			-- "<F11>",
			-- "<F12>",
			-- "<Leader>b",
			{ "<Leader>B", desc = "Toggle breakpoint" },
			-- "<Leader>lp",
			-- "<Leader>dr",
			-- "<Leader>dl",
			-- "<Leader>dh",
			-- "<Leader>dp",
			-- "<Leader>df",
			-- "<Leader>ds",
		},
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
			-- "nvim-neotest/neotest-go",
      -- "fredrikaverpil/neotest-golang",
		},
		config = function()
			-- vim.builtin.dap.active = true
			require("neotest").setup({
				summary = {
					animated = true,
					enabled = true,
					expand_errors = true,
					follow = true,
					mappings = {
						attach = "a",
						clear_marked = "M",
						clear_target = "T",
						debug = "d",
						debug_marked = "D",
						expand = { "<CR>", "<2-LeftMouse>" },
						expand_all = "e",
						jumpto = "i",
						mark = "m",
						next_failed = "J",
						output = "o",
						prev_failed = "K",
						run = "r",
						run_marked = "R",
						short = "O",
						stop = "u",
						target = "t",
						watch = "w",
					},
					open = "lefta vsplit | vertical resize 40",
				},
				adapters = {
					require("neotest-python")({
						-- Extra arguments for nvim-dap configuration
						-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
						dap = { justMyCode = false },
						-- Command line arguments for runner
						-- Can also be a function to return dynamic values
						-- args = { "--log-level", "DEBUG" },
						-- Runner to use. Will use pytest if available by default.
						-- Can be a function to return dynamic value.
						runner = "pytest",
						-- Custom python path for the runner.
						-- Can be a string or a list of strings.
						-- Can also be a function to return dynamic value.
						-- If not provided, the path will be inferred by checking for
						-- virtual envs in the local directory and for Pipenev/Poetry configs
						python = ".venv/bin/python",
						-- Returns if a given file path is a test file.
						-- NB: This function is called a lot so don't perform any heavy tasks within it.
					}),
					-- require("neotest-go"),
          -- require("neotest-golang"),
				},
			})
			vim.keymap.set("n", "<leader>t", ":Neotest summary<CR>", { noremap = true, desc = "Neotest summary" })
		end,
		cmd = { "Neotest" },
		keys = { "<Leader>t", desc = "Neotest summary" },
	},
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }
}
