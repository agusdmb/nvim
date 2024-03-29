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
				persisted = {
					layout_config = { width = 0.55, height = 0.55 },
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
			-- defaults = {
			-- 	layout_strategy = "vertical",
			-- 	layout_config = {
			-- 		preview_height = 0.7,
			-- 	},
			-- },
		})

		local builtin = require("telescope.builtin")

		-- vim.keymap.set("n", "<c-p>", builtin.find_files, { desc = "find files" })
		vim.keymap.set("n", "<c-p>", function()
			builtin.find_files({ hidden = true })
		end, { desc = "find files (hidden)" })
		vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "buffers" })
		-- vim.keymap.set("n", "<leader>t", builtin.tags, { desc = "tags" })
		-- vim.keymap.set("n", "<leader>t", builtin.lsp_dynamic_workspace_symbols, { desc = "lsp document symbols" })
		vim.keymap.set("n", "<leader>T", function()
			builtin.lsp_dynamic_workspace_symbols({
				require("telescope.themes").get_dropdown({ windblend = 10, previewer = true }),
				ignore_symbols = "variable",
			})
		end, { desc = "lsp document symbols" })
		vim.keymap.set("n", "gr", function()
			builtin.lsp_references(
				require("telescope.themes").get_dropdown({ windblend = 10, previewer = true }),
				{ include_declaration = false, show_line = false }
			)
		end, { desc = "lsp references" })
		vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "diagnostics" })
		vim.keymap.set("n", "<leader>a", builtin.live_grep, { desc = "live grep" })
		vim.keymap.set("n", "<leader>A", builtin.grep_string, { desc = "grep string" })
		vim.keymap.set("n", "<leader>s", builtin.builtin, { desc = "builtin" })
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(
				require("telescope.themes").get_dropdown({ windblend = 10, previewer = false })
			)
		end, { desc = "fuzzy find" })

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("persisted")

		-- remap to open the Telescope refactoring menu in visual mode
		vim.keymap.set(
			"v",
			"<leader>R",
			"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
			{ noremap = true, desc = "refactoring" }
		)
	end,
	lazy = true,
	cmd = "Telescope",
	keys = {
		"<c-p>",
		"<leader>b",
		"<leader>T",
		"gr",
		"<leader>d",
		"<leader>a",
		"<leader>A",
		"<leader>s",
		"<leader>R",
		"<leader>/",
	},
}
