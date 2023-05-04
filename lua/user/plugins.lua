local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don"t error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

-- Install your plugins here
return lazy.setup({
  -- My plugins here
  "lunarvim/colorschemes",

  -- cmp plugins
  "hrsh7th/nvim-cmp",    -- The completion plugin
  "hrsh7th/cmp-buffer",  -- buffer completions
  "hrsh7th/cmp-path",    -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "hrsh7th/cmp-nvim-lsp",

  -- snippets
  "L3MON4D3/LuaSnip",             --snippet engine
  "saadparwaiz1/cmp_luasnip",     -- snippet completions
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = "nvim-lua/plenary.nvim"
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require('lsp_signature').setup({
        hint_enable = false
      })
    end
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  "nvim-treesitter/nvim-treesitter-textobjects",

  "windwp/nvim-autopairs",
  "numToStr/Comment.nvim",
  "kdheepak/lazygit.nvim",

  "rcarriga/nvim-notify",

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install"
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true }
  },

  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require "nvim-tmux-navigation".setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        }
      }
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb" }
  },

  "rhysd/git-messenger.vim",

  --"bronson/vim-trailing-whitespace",

  "machakann/vim-highlightedyank",

  {
    "petertriho/nvim-scrollbar",
    config = function()
      require('scrollbar').setup()
    end
  },

  {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup()
    end
  },

  {
    'nacro90/numb.nvim',
    config = function()
      require('numb').setup()
    end
  },

  -- {
  --   "ur4ltz/surround.nvim",
  --   config = function()
  --     require "surround".setup { mappings_style = "surround" }
  --   end
  -- },

  ({
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }),

  "tpope/vim-repeat",

  --"tpope/vim-surround",

  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
      }
    end
  },

  "lewis6991/impatient.nvim",

  "skywind3000/asyncrun.vim",

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
    }
  },

  {
    "akinsho/toggleterm.nvim",
    version = 'v2.*'
  },

  "bronson/vim-visual-star-search",

  "chentoast/marks.nvim",

  "junegunn/vim-easy-align",

  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    }
  },

  "github/copilot.vim",

  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require('symbols-outline').setup({})
    end
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

  -- Lua
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
})
