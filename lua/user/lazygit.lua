local status_ok, _ = pcall(require, "lazygit")
if not status_ok then
  return
end

vim.api.nvim_set_keymap("n", "<leader>l", ":LazyGit<cr>", { noremap = true, silent = true })
