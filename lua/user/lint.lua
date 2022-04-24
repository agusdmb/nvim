local lint = require('lint')
lint.linters_by_ft = {
  python = {'pylint', 'mypy'}
}

vim.cmd [[
  augroup lint_user_config
    au BufWritePost <buffer> lua require('lint').try_lint()
  augroup end
]]

    -- Im commenting this 2 out because they don't work with pylint (since it required a file)

    -- au InsertLeave <buffer> lua require('lint').try_lint()
    -- au TextChanged <buffer> lua require('lint').try_lint()
