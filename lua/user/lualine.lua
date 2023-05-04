local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("Lualine not found!", "error")
  return
end

lualine.setup({
  options = {
    globalstatus = true,
  }
})
