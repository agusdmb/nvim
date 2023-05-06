return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("telescope").setup {

      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
          theme = "dropdown",
          -- disable_devicons = true,
          hidden = true
        },
      }
    }

    local opts = { noremap = true, silent = true }
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<c-p>', builtin.git_files, opts)
    vim.keymap.set('n', '<leader>b', builtin.buffers, opts)
    vim.keymap.set('n', '<leader>t', builtin.tags, opts)
    vim.keymap.set("n", "gr", builtin.lsp_references, opts)
    vim.keymap.set("n", "<leader>d", builtin.diagnostics, opts)
    vim.keymap.set("n", "<leader>a", builtin.live_grep, opts)
    vim.keymap.set("n", "<leader>A", builtin.grep_string, opts)
    vim.keymap.set("n", "<leader>s", builtin.builtin, opts)

    require("telescope").load_extension("refactoring")
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("lazygit")
    require("telescope").load_extension("harpoon")
    require("telescope").load_extension('bookmarks')


    -- remap to open the Telescope refactoring menu in visual mode
    vim.api.nvim_set_keymap(
      "v",
      "<leader>R",
      "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
      { noremap = true }
    )
  end
}
