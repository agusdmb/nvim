return {
	{
		"ray-x/lsp_signature.nvim",
		opts = { hint_enable = true },
	},
	{
		"windwp/nvim-autopairs",
		config = true,
	},
	{
		"kdheepak/lazygit.nvim",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>l", ":LazyGit<cr>", { noremap = true, silent = true })
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && yarn install",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({ options = { globalstatus = true } })
		end,
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
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tpope/vim-rhubarb",
		},
	},
	"rhysd/git-messenger.vim", -- "bronson/vim-trailing-whitespace",
	"machakann/vim-highlightedyank",
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup()
		end,
	},

	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},
	{
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	"tpope/vim-repeat",
	"skywind3000/asyncrun.vim",
	"bronson/vim-visual-star-search",
	"junegunn/vim-easy-align",

	{
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({})
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		opts = {},
	},
	{
		"github/copilot.vim",
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.cmd([[imap <silent><script><expr> <C-a> copilot#Accept("\CR")]])
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup({})
		end,
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
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},

	-- {
	--   'sunjon/shade.nvim',
	--   config = {
	--     overlay_opacity = 50,
	--     opacity_step = 1,
	--     keys = {
	--       brightness_up   = '<C-Up>',
	--       brightness_down = '<C-Down>',
	--       toggle          = '<Leader>s',
	--     }
	--   }
	-- },

	"folke/which-key.nvim",
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		version = "v4.0.0",
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
	},
	{
		"dhruvmanila/browser-bookmarks.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		lazy = true,
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
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				window = {
					backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
					-- height and width can be:
					-- * an absolute number of cells when > 1
					-- * a percentage of the width / height of the editor when <= 1
					-- * a function that returns the width or the height
					width = 120, -- width of the Zen window
					height = 1, -- height of the Zen window
					-- by default, no options are changed for the Zen window
					-- uncomment any of the options below, or add other vim.wo options you want to apply
					options = {
						signcolumn = "no", -- disable signcolumn
						number = false, -- disable number column
						relativenumber = false, -- disable relative numbers
						-- cursorline = false, -- disable cursorline
						-- cursorcolumn = false, -- disable cursor column
						-- foldcolumn = "0", -- disable fold column
						-- list = false, -- disable whitespace characters
					},
				},
				plugins = {
					-- disable some global vim options (vim.o...)
					-- comment the lines to not apply the options
					options = {
						enabled = true,
						ruler = false, -- disables the ruler text in the cmd line area
						showcmd = false, -- disables the command in the last line of the screen
					},
					twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
					gitsigns = { enabled = false }, -- disables git signs
					tmux = { enabled = false }, -- disables the tmux statusline
					-- this will change the font size on kitty when in zen mode
					-- to make this work, you need to set the following kitty options:
					-- - allow_remote_control socket-only
					-- - listen_on unix:/tmp/kitty
					kitty = {
						enabled = false,
						font = "+4", -- font size increment
					},
					-- this will change the font size on alacritty when in zen mode
					-- requires  Alacritty Version 0.10.0 or higher
					-- uses `alacritty msg` subcommand to change font size
					alacritty = {
						enabled = false,
						font = "14", -- font size
					},
					-- this will change the font size on wezterm when in zen mode
					-- See alse also the Plugins/Wezterm section in this projects README
					wezterm = {
						enabled = false,
						-- can be either an absolute font size or the number of incremental steps
						font = "+4", -- (10% increase per step)
					},
				},
				-- callback where you can add custom code when the Zen window opens
				on_open = function() end,
				-- callback where you can add custom code when the Zen window closes
				on_close = function() end,
			})
		end,
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({})
			vim.api.nvim_set_keymap(
				"n",
				"gpd",
				"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"gpt",
				"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"gpi",
				"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"gP",
				"<cmd>lua require('goto-preview').close_all_win()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"gpr",
				"<cmd>lua require('goto-preview').goto_preview_references()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},

	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},
	{
		dir = "/home/agusdmb/dev/gh-review/",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("gh-review").setup()
		end,
	},
	{ "stevearc/dressing.nvim", opts = {} },
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
	},

	{
		"phaazon/hop.nvim",
		version = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdgfblzhckisuran" })
			vim.keymap.set("n", "s", ":HopChar2MW<cr>")
		end,
	},

	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "doom",
				config = {
					week_header = {
						enable = true,
						append = {
							"",
							"",
							"",
							"                                                                    ..;===+.",
							"                                                                .:=iiiiii=+=",
							"                                                             .=i))=;::+)i=+,",
							"                                                          ,=i);)I)))I):=i=; ",
							"                                                       .=i==))))ii)))I:i++  ",
							"                                                     +)+))iiiiiiii))I=i+:'  ",
							"                                .,:;;++++++;:,.       )iii+:::;iii))+i='    ",
							"                             .:;++=iiiiiiiiii=++;.    =::,,,:::=i));=+'     ",
							"                           ,;+==ii)))))))))))ii==+;,      ,,,:=i))+=:       ",
							"                         ,;+=ii))))))IIIIII))))ii===;.    ,,:=i)=i+         ",
							"                        ;+=ii)))IIIIITIIIIII))))iiii=+,   ,:=));=,          ",
							"                      ,+=i))IIIIIITTTTTITIIIIII)))I)i=+,,:+i)=i+            ",
							"                     ,+i))IIIIIITTTTTTTTTTTTI))IIII))i=::i))i='             ",
							"                    ,=i))IIIIITLLTTTTTTTTTTIITTTTIII)+;+i)+i`               ",
							"                    =i))IIITTLTLTTTTTTTTTIITTLLTTTII+:i)ii:'                ",
							"                   +i))IITTTLLLTTTTTTTTTTTTLLLTTTT+:i)))=,                  ",
							"                   =))ITTTTTTTTTTTLTTTTTTLLLLLLTi:=)IIiii;                  ",
							"                  .i)IIITTTTTTTTLTTTITLLLLLLLT);=)I)))))i;                  ",
							"                  :))IIITTTTTLTTTTTTLLHLLLLL);=)II)IIIIi=:                  ",
							"                  :i)IIITTTTTTTTTLLLHLLHLL)+=)II)ITTTI)i=                   ",
							"                  .i)IIITTTTITTLLLHHLLLL);=)II)ITTTTII)i+                   ",
							"                  =i)IIIIIITTLLLLLLHLL=:i)II)TTTTTTIII)i'                   ",
							"                +i)i)))IITTLLLLLLLLT=:i)II)TTTTLTTIII)i;                    ",
							"              +ii)i:)IITTLLTLLLLT=;+i)I)ITTTTLTTTII))i;                     ",
							"             =;)i=:,=)ITTTTLTTI=:i))I)TTTLLLTTTTTII)i;                      ",
							"           +i)ii::,  +)IIITI+:+i)I))TTTTLLTTTTTII))=,                       ",
							"         :=;)i=:,,    ,i++::i))I)ITTTTTTTTTTIIII)=+'                        ",
							"       .+ii)i=::,,   ,,::=i)))iIITTTTTTTTIIIII)=+                           ",
							"      ,==)ii=;:,,,,:::=ii)i)iIIIITIIITIIII))i+:'                            ",
							"     +=:))i==;:::;=iii)+)=  `:i)))IIIII)ii+'                                ",
							"   .+=:))iiiiiiii)))+ii;                                                    ",
							"  .+=;))iiiiii)));ii+                                                       ",
							" .+=i:)))))))=+ii+                                                          ",
							".;==i+::::=)i=;                                                             ",
							",+==iiiiii+,                                                                ",
							"`+=+++;`                                                                    ",
							"",
							"",
							"",
						},
					},
					center = {
						{
							icon = " ",
							icon_hl = "String",
							desc = "Session",
							desc_hl = "Title",
							key = "s",
							key_hl = "Number",
							action = "lua require('nvim-possession').list()",
						},
						{
							icon = " ",
							icon_hl = "String",
							desc = "Find File",
							desc_hl = "Title",
							key = "f",
							key_hl = "Number",
							action = "Telescope find_files",
						},
						{
							icon = "󱓧 ",
							icon_hl = "String",
							desc = "Notes",
							desc_hl = "Title",
							key = "n",
							key_hl = "Number",
							action = "Neorg index",
						},
						{
							icon = "󰉁 ",
							icon_hl = "String",
							desc = "Lazy Sync",
							desc_hl = "Title",
							key = "u",
							key_hl = "Number",
							action = "Lazy sync",
						},
						{
							icon = "󰩈 ",
							icon_hl = "String",
							desc = "Quit",
							desc_hl = "Title",
							key = "q",
							key_hl = "Number",
							action = "q",
						},
					},
					footer = {}, --your footer
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
