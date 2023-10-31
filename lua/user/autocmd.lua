vim.api.nvim_create_augroup("user_terminal", {})
vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter", "BufWinEnter", "WinEnter" }, {
  group = "user_terminal",
  pattern = "term://*",
  command = "startinsert",
})
vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter" }, {
  group = "user_terminal",
  pattern = "term://*",
  command = "setlocal nonumber",
})
vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter" }, {
  group = "user_terminal",
  pattern = "term://*",
  command = "setlocal norelativenumber",
})

vim.api.nvim_create_augroup("user_resize", {})
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = "user_resize",
  command = "tabdo wincmd =",
})

vim.api.nvim_create_augroup("user_postman", {})
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "user_postman",
  pattern = "sh",
  command = "nmap <buffer> <NL> :Exec<CR>",
})
vim.api.nvim_command("command Exec set splitright | vnew | set filetype=json | read !sh #")

vim.api.nvim_create_augroup("user_markdown", {})
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "user_markdown",
  pattern = "markdown",
  command = "setlocal shiftwidth=4",
})
