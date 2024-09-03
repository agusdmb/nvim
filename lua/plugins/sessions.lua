vim.opt.sessionoptions:append("globals")
vim.opt.sessionoptions:append("winpos")

vim.api.nvim_create_augroup("user_python", {})
vim.api.nvim_create_autocmd({ "SessionLoadPost" }, {
	group = "user_python",
	pattern = "*",
	callback = function()
		if vim.g.PythonPath ~= nil then
			vim.fn.setenv("PYTHONPATH", vim.g.PythonPath)
		end
		if vim.g.VirtualEnv ~= nil then
			vim.fn.setenv("VIRTUAL_ENV", vim.g.VirtualEnv)
			local ORIGINAL_PATH = vim.fn.getenv("PATH")
			vim.fn.setenv("PATH", vim.g.VirtualEnv .. "/bin" .. ":" .. ORIGINAL_PATH)
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
		if vim.fn.getenv("VIRTUAL_ENV") ~= "" then
			vim.g.VirtualEnv = vim.fn.getenv("VIRTUAL_ENV")
		end
		if vim.fn.getenv("PYTHONPATH") ~= "" then
			vim.g.PythonPath = vim.fn.getenv("PYTHONPATH")
		end
	end,
})

return {
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
}
