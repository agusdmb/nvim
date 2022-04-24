local lint = require('lint')
lint.linters_by_ft = {
  python = {'pylint',}
}

vim.cmd [[au BufWritePost <buffer> lua require('lint').try_lint()]]
