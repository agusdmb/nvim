return {

	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			globalstatus = true,
			sections = {
				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
			},
		},
		event = "BufRead",
	},

	{
		"machakann/vim-highlightedyank",
		event = "VeryLazy",
	},

	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup()
		end,
		event = "BufRead",
		enabled = false,
	},

	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
		event = "VeryLazy",
	},

	{
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
		event = "VeryLazy",
	},

	{
		"utilyre/barbecue.nvim",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("barbecue").setup()
		end,
		event = "VeryLazy",
	},

	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
		event = "VeryLazy",
	},

	{
		"sunjon/shade.nvim",
		config = {
			overlay_opacity = 50,
			opacity_step = 1,
			keys = {
				brightness_up = "<C-Up>",
				brightness_down = "<C-Down>",
				toggle = "<Leader>s",
			},
		},
		enabled = false,
	},

	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
		event = "VeryLazy",
	},

	{
		"stevearc/dressing.nvim",
		opts = {},
		event = "VeryLazy",
	},
}
