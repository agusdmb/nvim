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

return {
	{
		"olimorris/persisted.nvim",
		config = function()
			require("persisted").setup({
				use_git_branch = false,
				autosave = false,
				autoload = true,
			})
			require("telescope").load_extension("persisted")
		end,
	},
	-- {
	-- 	"AckslD/swenv.nvim",
	-- 	config = function()
	-- 		require("swenv").setup({
	-- 			-- get_venvs = function(_)
	-- 			-- 	local venvs = {}
	-- 			-- 	local handle = io.popen('pyenv versions | grep -e "-->"')
	-- 			-- 	local output = handle:read("*a")
	-- 			-- 	handle:close()
	-- 			--
	-- 			-- 	for name, path in output:gmatch("(%S+)%s+-%->%s+(%S+)") do
	-- 			-- 		table.insert(venvs, { name = name, path = path })
	-- 			-- 	end
	-- 			--
	-- 			-- 	return venvs
	-- 			-- end,
	-- 			-- venvs_path = vim.fn.expand("~/.pyenv/"),
	-- 			-- post_set_venv = function(venv)
	-- 			-- 	vim.cmd("LspRestart")
	-- 			-- 	vim.g.Swenv = venv.path
	-- 			-- end,
	-- 		})
	-- 		vim.cmd([[command! -nargs=0 SetEnv lua require('swenv.api').pick_venv()]])
	-- 	end,
	-- 	cmd = { "SetEnv" },
	-- },
}
