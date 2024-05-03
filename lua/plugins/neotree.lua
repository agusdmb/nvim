vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
		},
	},
	keys = {
		{ "<leader>e", ":Neotree toggle dir=./ <CR>", noremap = true, silent = true },
	},
	cmd = {
		"Neotree",
	},
}
