local status_ok, _ = pcall(require, "lazygit")
if not status_ok then
  vim.notify("LazyGit not found!", "error")
  return
end

vim.api.nvim_set_keymap("n", "<leader>l", ":LazyGit<cr>", { noremap = true, silent = true })
