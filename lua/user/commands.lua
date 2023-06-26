vim.api.nvim_create_user_command("SplitLine", ":s/\\s\\+/\r/g | :nohlsearch", {})
