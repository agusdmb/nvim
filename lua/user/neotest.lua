require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      dap = { justMyCode = false },
      -- Command line arguments for runner
      -- Can also be a function to return dynamic values
      args = { "--log-level", "DEBUG", "-l" },
      -- Runner to use. Will use pytest if available by default.
      -- Can be a function to return dynamic value.
      runner = "pytest",
    })
  }
})

-- vim.api.nvim_set_keymap("n", "<leader>r", ":lua require('neotest').run.run()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>r", ":lua require('neotest').summary.open()<cr>", { noremap = true, silent = true })
