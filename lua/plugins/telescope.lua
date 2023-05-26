return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("telescope").setup({
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
					theme = "dropdown",
					-- disable_devicons = true,
					hidden = true,
				},
			},
		})

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<c-p>", builtin.find_files)
		vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "buffers" })
		vim.keymap.set("n", "<leader>t", builtin.tags, { desc = "tags" })
		vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "references" })
		vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "diagnostics" })
		vim.keymap.set("n", "<leader>a", builtin.live_grep, { desc = "live grep" })
		vim.keymap.set("n", "<leader>A", builtin.grep_string, { desc = "grep string" })
		vim.keymap.set("n", "<leader>s", builtin.builtin, { desc = "builtin" })
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(
				require("telescope.themes").get_dropdown({ windblend = 10, previewer = false })
			)
		end, { desc = "fuzzy find" })

		require("telescope").load_extension("refactoring")
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("lazygit")
		require("telescope").load_extension("harpoon")

		-- remap to open the Telescope refactoring menu in visual mode
		vim.api.nvim_set_keymap(
			"v",
			"<leader>R",
			"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
			{ noremap = true }
		)
	end,
	lazy = true,
	cmd = "Telescope",
	keys = {
		"<c-p>",
		"<leader>b",
		"<leader>t",
		"gr",
		"<leader>d",
		"<leader>a",
		"<leader>A",
		"<leader>s",
		"<leader>R",
    "<leader>/",
	},
}
