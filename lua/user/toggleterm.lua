local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  vim.notify("Toggleterm not found!", "error")
  return
end

toggleterm.setup()
