local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  vim.notify("Alpha not found!", "error")
  return
end

local startify = require 'alpha.themes.startify'

alpha.setup(startify.config)

vim.notify("Alpha enabled")
