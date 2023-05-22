vim.api.nvim_create_augroup("user_python", {})
vim.api.nvim_create_autocmd({ "SessionLoadPost" }, {
	group = "user_python",
	pattern = "*",
	callback = function()
    if vim.g.Swenv == nil then
      return
    end
		local ORIGINAL_PATH = vim.fn.getenv("PATH")
		vim.fn.setenv("VIRTUAL_ENV", vim.g.Swenv)
		vim.fn.setenv("PATH", vim.g.Swenv .. "/bin" .. ":" .. ORIGINAL_PATH)
    vim.cmd("LspRestart")
	end,
})

return {
	{
		"gennaro-tedesco/nvim-possession",
		dependencies = {
			"ibhagwan/fzf-lua",
		},
		config = true,
		init = function()
			local possession = require("nvim-possession")
			vim.keymap.set("n", "<leader>sl", function()
				possession.list()
			end)
			vim.keymap.set("n", "<leader>sn", function()
				possession.new()
			end)
			vim.keymap.set("n", "<leader>su", function()
				possession.update()
			end)
			vim.keymap.set("n", "<leader>sd", function()
				possession.delete()
			end)
		end,
	},
	{
		"AckslD/swenv.nvim",
		config = function()
			require("swenv").setup({
				-- Should return a list of tables with a `name` and a `path` entry each.
				-- Gets the argument `venvs_path` set below.
				-- By default just lists the entries in `venvs_path`.
				-- get_venvs = function(venvs_path)
				--     return require('swenv.api').get_venvs(venvs_path)
				-- end,
				-- Path passed to `get_venvs`.
				-- venvs_path = vim.fn.expand('~/.pyenv/versions/3.9.12/envs/'),
				-- Something to do after setting an environment, for example call vim.cmd.LspRestart
				-- post_set_venv = nil
				--
				get_venvs = function(_)
					local venvs = {}
					local handle = io.popen('pyenv versions | grep -e "-->"')
					local output = handle:read("*a")
					handle:close()

					for name, path in output:gmatch("(%S+)%s+-%->%s+(%S+)") do
						table.insert(venvs, { name = name, path = path })
					end

					return venvs
				end,
				venvs_path = vim.fn.expand("~/.pyenv/"),
				post_set_venv = function(venv)
					vim.cmd("LspRestart")
					vim.g.Swenv = venv.path
				end,
			})
			vim.cmd([[command! -nargs=0 SetEnv lua require('swenv.api').pick_venv()]])
		end,
	},
}
