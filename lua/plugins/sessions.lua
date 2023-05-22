vim.api.nvim_create_augroup("user_python", {})
vim.api.nvim_create_autocmd({ "SessionLoadPost" }, {
  group = "user_python",
  pattern = "*",
  callback = function()
    if vim.g.Swenv == nil then
      return
    end
    local ORIGINAL_PATH = vim.fn.getenv("PATH")
    vim.fn.setenv("VIRTUAL_ENV", vim.g.Swenv)
    vim.fn.setenv("PATH", vim.g.Swenv .. "/bin" .. ":" .. ORIGINAL_PATH)
    vim.cmd("LspRestart")
    require("gh-review").setup()
  end,
})

return {
  {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    config = {
      fzf_winopts = {
        width = 0.5,
      },
    },
    init = function()
      local possession = require("nvim-possession")
      vim.keymap.set("n", "<leader>sl", function()
        possession.list()
      end)
      vim.keymap.set("n", "<leader>sn", function()
        possession.new()
      end)
      vim.keymap.set("n", "<leader>su", function()
        possession.update()
      end)
      vim.keymap.set("n", "<leader>sd", function()
        possession.delete()
      end)
    end,
  },
  {
    "AckslD/swenv.nvim",
    config = function()
      require("swenv").setup({
        get_venvs = function(_)
          local venvs = {}
          local handle = io.popen('pyenv versions | grep -e "-->"')
          local output = handle:read("*a")
          handle:close()

          for name, path in output:gmatch("(%S+)%s+-%->%s+(%S+)") do
            table.insert(venvs, { name = name, path = path })
          end

          return venvs
        end,
        venvs_path = vim.fn.expand("~/.pyenv/"),
        post_set_venv = function(venv)
          vim.cmd("LspRestart")
          vim.g.Swenv = venv.path
        end,
      })
      vim.cmd([[command! -nargs=0 SetEnv lua require('swenv.api').pick_venv()]])
    end,
  },
}
