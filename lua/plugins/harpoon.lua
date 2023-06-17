local keymap = vim.keymap.set

keymap("n", "<leader>h", ":HarpoonOpen<CR>")
keymap("n", "<leader>H", ":HarpoonMark<CR>")
keymap("n", "<up>", ":HarpoonPrev<CR>")
keymap("n", "<down>", ":HarpoonNext<CR>")

return {
  "ThePrimeagen/harpoon",
  config = function()
    vim.api.nvim_create_user_command("HarpoonOpen", "lua require('harpoon.ui').toggle_quick_menu()", {})
    vim.api.nvim_create_user_command("HarpoonMark", "lua require('harpoon.mark').add_file()", {})
    vim.api.nvim_create_user_command("HarpoonNext", "lua require('harpoon.ui').nav_next()", {})
    vim.api.nvim_create_user_command("HarpoonPrev", "lua require('harpoon.ui').nav_prev()", {})
		require("telescope").load_extension("harpoon")
  end,
  cmd = { "HarpoonOpen", "HarpoonMark", "HarpoonNext", "HarpoonPrev" },
}
