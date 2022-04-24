local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  return
end

formatter.setup({
  filetype = {
    lua = {
      -- luafmt
      function()
        return {
          exe = "luafmt",
          args = { "--indent-count", 2, "--stdin" },
          stdin = true
        }
      end
    },
    python = {
      -- Configuration for psf/black
      function()
        vim.notify("aca")
        return {
          exe = "black", -- this should be available on your $PATH
          args = { '-' },
          stdin = true,
        }
      end
    }
  }
})

vim.api.nvim_set_keymap("n", "<leader>f", ":Format<cr>", { noremap = true, silent = false })
