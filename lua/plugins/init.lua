return {
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	},
	{
		"windwp/nvim-autopairs",
		config = true,
		event = "InsertEnter",
	},
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
		"iamcco/markdown-preview.nvim",
		build = "cd app && yarn install",
		event = "VeryLazy",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = { globalstatus = true },
		event = "BufRead",
	},
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					last_active = "<C-\\>",
					next = "<C-Space>",
				},
			})
		end,
		event = "VeryLazy",
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
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = true,
		event = "VeryLazy",
	},
	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},
	{
		"skywind3000/asyncrun.vim",
		cmd = { "AsyncRun", "AsyncStop", "AsyncTask" },
	},
	{
		"bronson/vim-visual-star-search",
		keys = { "*", "#" },
	},
	{
		"junegunn/vim-easy-align",
		keys = { "ga" },
	},
	{
		"folke/twilight.nvim",
		opts = {
			dimming = {
				alpha = 0.25, -- amount of dimming
				-- we try to get the foreground from the highlight groups or fallback color
				color = { "Normal", "ffffff" },
				term_bg = "000000", -- if guibg=NONE, this will be used to calculate text color
				inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
			},
			context = 10, -- amount of lines we will try to show around the current line
			treesitter = true, -- use treesitter when available for the filetype
			-- treesitter is used to automatically expand the visible text,
			-- but you can further control the types of nodes that should always be fully expanded
			expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
				"function",
				"method",
				"table",
				"if_statement",
				"method_definition",
			},
			exclude = {}, -- exclude these filetypes
		},
		cmd = { "Twilight", "TwilightEnable" },
	},
	{
		"github/copilot.vim",
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.cmd([[imap <silent><script><expr> <C-a> copilot#Accept("\CR")]])
		end,
		event = "InsertEnter",
	},
	{
		"simrat39/symbols-outline.nvim",
		config = true,
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
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		version = "v5.0.0",
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.export"] = {},
				["core.presenter"] = { config = { zen_mode = "zen-mode" } },
				["core.completion"] = {
					config = { engine = "nvim-cmp", name = "[Neorg]" },
				},
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = { notes = "~/notes" },
						default_workspace = "notes",
					},
				},
			},
		},
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Neorg",
	},
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		config = true,
		cmd = "Octo",
	},
	{
		"dhruvmanila/browser-bookmarks.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").load_extension("bookmarks")
		end,
		cmd = "BrowserBookmarks",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
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
	-- {
	-- 	dir = "/home/agusdmb/dev/gh-review/",
	-- 	dependencies = "nvim-lua/plenary.nvim",
	-- 	config = function()
	-- 		require("gh-review").setup()
	-- 	end,
	-- 	event = "VeryLazy",
	-- },
	{
		"stevearc/dressing.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
		cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
		enabled = false,
	},
	{
		"phaazon/hop.nvim",
		version = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdgfblzhckisuran" })
			vim.keymap.set("n", "s", ":HopChar2MW<cr>")
		end,
		keys = { "s" },
	},

	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		config = function()
			-- vim.g.gitblame_delay = 1000
		end,
	},
}
