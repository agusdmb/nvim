local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify("Telescope not found!", "error")
  return
end

telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<c-p>', ':Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers initial_mode=normal<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>t', ':Telescope tags<cr>', opts)
vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references initial_mode=normal<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>d", ":Telescope diagnostics initial_mode=normal<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>a", ":Telescope live_grep<cr>", opts)
