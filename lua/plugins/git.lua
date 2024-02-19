return {
	{
		"kdheepak/lazygit.nvim",
		config = function()
			vim.keymap.set("n", "<leader>l", ":LazyGit<cr>", { silent = true, noremap = true })
			require("telescope").load_extension("lazygit")
		end,
		keys = { { "<leader>l", nil, desc = "LazyGit" } },
		cmd = { "LazyGit", "LazyGitFilterCurrentFile" },
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
		event = "VeryLazy",
	},
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tpope/vim-rhubarb",
		},
		cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
	},
	{
		"rhysd/git-messenger.vim",
		cmd = "GitMessenger",
		keys = { { "<leader>gm", nil, desc = "Git Messenger" } },
	},
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		config = function()
			-- vim.g.gitblame_delay = 1000
		end,
		keys = { { "<leader>gt", ":GitBlameToggle<CR>", desc = "Git Virtual Blame" } },
	},
}
