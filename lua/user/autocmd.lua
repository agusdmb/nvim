vim.cmd [[
  augroup user_terminal
    autocmd!
    autocmd TermOpen,TermEnter,BufWinEnter,WinEnter term://* startinsert
    autocmd TermOpen,TermEnter term://* setlocal nonumber
    autocmd TermOpen,TermEnter term://* setlocal norelativenumber
  augroup end

  augroup user_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup user_copilot
    autocmd!
    autocmd VimEnter * Copilot disable
  augroup end
]]

