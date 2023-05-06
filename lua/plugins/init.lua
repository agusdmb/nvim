return {
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

  "nvim-treesitter/nvim-treesitter-textobjects",

  {
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup()
    end
  },

  "numToStr/Comment.nvim",
  "kdheepak/lazygit.nvim",

  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end
  },

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
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require('lualine').setup {
        options = {
          globalstatus = true,
        }
      }
    end
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

  "ThePrimeagen/harpoon",

  {
    "github/copilot.vim",
    config = function()
      -- vim.cmd[[Copilot disable]]
      vim.g.copilot_no_tab_map = true
      -- vim.g.copilot_assume_mapped = true
      -- vim.g.copilot_tab_fallback = ""
      vim.cmd [[imap <silent><script><expr> <C-a> copilot#Accept("\CR")]]
    end
  },

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

  -- {
  --   'mfussenegger/nvim-dap-python',
  --   dependencies = { 'mfussenegger/nvim-dap' }
  -- },

  -- 'rcarriga/nvim-dap-ui',


  "folke/which-key.nvim",

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    version = "v4.0.0",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.export"] = {},
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
            name = "[Neorg]",
          }
        },
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = {      -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require("octo").setup()
    end
  },

  {
    'dhruvmanila/browser-bookmarks.nvim',
    dependencies = {
      'kkharji/sqlite.lua',
      'nvim-telescope/telescope.nvim',
    }
  },

  'folke/tokyonight.nvim',
  {
    "catppuccin/nvim",
    name = "catppuccin"
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
          height = 1,  -- height of the Zen window
          -- by default, no options are changed for the Zen window
          -- uncomment any of the options below, or add other vim.wo options you want to apply
          options = {
            signcolumn = "no",      -- disable signcolumn
            number = false,         -- disable number column
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
            ruler = false,                -- disables the ruler text in the cmd line area
            showcmd = false,              -- disables the command in the last line of the screen
          },
          twilight = { enabled = true },  -- enable to start Twilight when zen mode opens
          gitsigns = { enabled = false }, -- disables git signs
          tmux = { enabled = false },     -- disables the tmux statusline
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
        on_open = function()
        end,
        -- callback where you can add custom code when the Zen window closes
        on_close = function()
        end,
      })
    end
  }

}
