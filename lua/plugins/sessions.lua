vim.opt.sessionoptions:append("globals")
vim.opt.sessionoptions:append("winpos")

vim.api.nvim_create_augroup("user_python", {})
vim.api.nvim_create_autocmd({ "SessionLoadPost" }, {
	group = "user_python",
	pattern = "*",
	callback = function()
		if vim.g.LdLibraryPath ~= nil then
			vim.fn.setenv("LD_LIBRARY_PATH", vim.g.LdLibraryPath)
		end
		if vim.g.PythonPath ~= nil then
			vim.fn.setenv("PYTHONPATH", vim.g.PythonPath)
		end
		if vim.g.SavedPath ~= nil then
			vim.fn.setenv("PATH", vim.g.SavedPath)
		end
		if vim.g.VirtualEnv ~= nil then
			vim.fn.setenv("VIRTUAL_ENV", vim.g.VirtualEnv)
			vim.cmd("LspRestart")
		end
		-- require("gh-review").setup()
	end,
})

-- vim.api.nvim_create_user_command("SetVirtualEnv", 'lua vim.g.VirtualEnv = vim.fn.getcwd() .. "/.venv"', {})

local group = vim.api.nvim_create_augroup("PersistedHooks", {})

vim.api.nvim_create_autocmd({ "User" }, {
	pattern = "PersistedSavePre",
	group = group,
	callback = function()
    vim.g.SavedPath = vim.fn.getenv("PATH")
		if vim.fn.getenv("VIRTUAL_ENV") ~= "" then
			vim.g.VirtualEnv = vim.fn.getenv("VIRTUAL_ENV")
		end
		if vim.fn.getenv("PYTHONPATH") ~= "" then
			vim.g.PythonPath = vim.fn.getenv("PYTHONPATH")
		end
		if vim.fn.getenv("LD_LIBRARY_PATH") ~= "" then
			vim.g.LdLibraryPath = vim.fn.getenv("LD_LIBRARY_PATH")
		end
	end,
})

return {
	{
		"olimorris/persisted.nvim",
		config = function()
			require("persisted").setup({
				use_git_branch = false,
				autostart = false,
				autosave = false,
				autoload = false,
			})
		end,
		event = "VeryLazy",
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = false,
		branch = "regexp", -- This is the regexp branch, use this for the new version
		config = function()
			require("venv-selector").setup()
		end,
		keys = {
			{ ",v", "<cmd>VenvSelect<cr>" },
		},
	},
}
