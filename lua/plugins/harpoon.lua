local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

return {
  "ThePrimeagen/harpoon",
  config = function()
    keymap("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
    keymap("n", "<leader>H", ":lua require('harpoon.mark').add_file()<cr>", opts)
  end,
  lazy = true,
  keys = { "<leader>h", "<leader>H" },
}
