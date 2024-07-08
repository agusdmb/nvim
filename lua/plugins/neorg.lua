return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  version = "v8.x.x",
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.export"] = {},
      ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
      ["core.completion"] = {
        config = { engine = "nvim-cmp", name = "[Neorg]" },
      },
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = { notes = "~/notes" },
          default_workspace = "notes",
        },
      },
    },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Neorg",
  keys = {
    { "<leader>n", ":Neorg index<CR>", noremap = true, silent = true },
  },
}
