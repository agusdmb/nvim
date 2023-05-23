return {
  "akinsho/toggleterm.nvim",
  version = 'v2.*',
  config = function()
    require("toggleterm").setup {
      -- size can be a number or function which is passed the current terminal
      -- size = 20,
      -- open_mapping = [[<c-\>]],
      -- hide_numbers = true, -- hide the number column in toggleterm buffers
      -- shade_filetypes = {},
      -- shade_terminals = true,
      -- shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      -- start_in_insert = true,
      -- insert_mappings = true, -- whether or not the open mapping applies in insert mode
      -- persist_size = true,
      -- direction = 'horizontal',
    }
    vim.keymap.set("n", "<c-t>", vim.cmd.ToggleTerm)
    vim.keymap.set("t", "<c-t>", vim.cmd.ToggleTerm)
  end,
  lazy = true,
  cmd = { "ToggleTerm" },
  keys = { "<c-t>" },
}
