return {
    "williamboman/mason.nvim",
    buid = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
    end
}
