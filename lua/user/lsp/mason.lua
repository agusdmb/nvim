local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("Mason not found!", "error")
  return
end

mason.setup {
    ui = {
        icons = {
            package_installed = "✓"
        }
    }
}

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("Mason LspConfig not found!", "error")
  return
end

mason_lspconfig.setup {
    -- ensure_installed = { "sumneko_lua" },
}

require('fidget').setup()
