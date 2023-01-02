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

  " augroup user_copilot
  "   autocmd!
  "   autocmd VimEnter * Copilot disable
  " augroup end

  augroup user_postman
    autocmd!
    autocmd FileType sh nmap <buffer> <NL> :Exec<CR>
    command Exec set splitright | vnew | set filetype=json | read !sh #
  augroup end

  augroup user_markdown
    autocmd!
    autocmd FileType markdown setlocal shiftwidth=4
    autocmd FileType markdown setlocal tabstop=4
  augroup end

  augroup highlight_current_word
    autocmd!
    autocmd CursorHold * :exec 'match Search /\V\<' . expand('<cword>') . '\>/'
  augroup END

]]
