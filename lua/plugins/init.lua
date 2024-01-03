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
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    event = "VeryLazy",
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
    enabled = false,
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
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    version = "v7.0.0",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.export"] = {},
        ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
        ["core.completion"] = {
          config = { engine = "nvim-cmp", name = "[Neorg]" },
        },
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = {      -- Manages Neorg workspaces
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

  -- {
  -- 	dir = "/home/agusdmb/dev/gh-review/",
  -- 	dependencies = "nvim-lua/plenary.nvim",
  -- 	config = function()
  -- 		require("gh-review").setup()
  -- 	end,
  -- 	event = "VeryLazy",
  -- },

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
}
