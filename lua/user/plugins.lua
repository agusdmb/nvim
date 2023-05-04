-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install your plugins here
return packer.startup({
  function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "lunarvim/colorschemes"

    -- cmp plugins
    use "hrsh7th/nvim-cmp"    -- The completion plugin
    use "hrsh7th/cmp-buffer"  -- buffer completions
    use "hrsh7th/cmp-path"    -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "hrsh7th/cmp-nvim-lsp"

    -- snippets
    use "L3MON4D3/LuaSnip"             --snippet engine
    use "saadparwaiz1/cmp_luasnip"     -- snippet completions
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    use {                              -- LSP Configuration & Plugins
      'neovim/nvim-lspconfig',
      requires = {
        -- Automatically install LSPs to stdpath for neovim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        'j-hui/fidget.nvim',

        -- Additional lua configuration, makes nvim stuff amazing
        'folke/neodev.nvim',
      },
    }

    use { "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" }

    use {
      "ray-x/lsp_signature.nvim",
      config = function()
        require('lsp_signature').setup({
          hint_enable = false
        })
      end
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }

    use "nvim-treesitter/nvim-treesitter-textobjects"

    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"
    use "kdheepak/lazygit.nvim"

    use "rcarriga/nvim-notify"

    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
    }

    use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }

    use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    use { "alexghergh/nvim-tmux-navigation", config = function()
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
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }

    use { "tpope/vim-fugitive", requires = { "tpope/vim-rhubarb" } }

    use "rhysd/git-messenger.vim"

    -- use "bronson/vim-trailing-whitespace"

    use "machakann/vim-highlightedyank"

    use {
      "petertriho/nvim-scrollbar",
      config = function()
        require('scrollbar').setup()
      end
    }

    use {
      "karb94/neoscroll.nvim",
      config = function()
        require('neoscroll').setup()
      end
    }

    use {
      'nacro90/numb.nvim',
      config = function()
        require('numb').setup()
      end
    }

    -- use {
    --   "ur4ltz/surround.nvim",
    --   config = function()
    --     require "surround".setup { mappings_style = "surround" }
    --   end
    -- }

    use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end
    })

    use "tpope/vim-repeat"

    -- use "tpope/vim-surround"

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {
        }
      end
    }

    use "lewis6991/impatient.nvim"

    use "skywind3000/asyncrun.vim"

    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-go",
      }
    }

    use { "akinsho/toggleterm.nvim", tag = 'v2.*' }

    use "bronson/vim-visual-star-search"

    use "chentoast/marks.nvim"

    use "junegunn/vim-easy-align"

    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    use {
      "ThePrimeagen/refactoring.nvim",
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" }
      }
    }

    use "github/copilot.vim"

    use {
      'simrat39/symbols-outline.nvim',
      config = function()
        require('symbols-outline').setup({})
      end
    }

    use {
      "utilyre/barbecue.nvim",
      tag = "*",
      requires = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
      },
      after = "nvim-web-devicons",     -- keep this if you're using NvChad
      config = function()
        require("barbecue").setup()
      end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
