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
telescope.load_extension("fzf")
telescope.load_extension("lazygit")

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

-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
  "v",
  "<leader>R",
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true }
)
