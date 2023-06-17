-- Shorten function name
local keymap = vim.keymap.set

vim.o.silent = true

--Remap space as leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- Navigate buffers
keymap("n", "gb", ":bn<cr>", { desc = "Next buffer", noremap = true, silent = true })
keymap("n", "gB", ":bp<cr>", { desc = "Previous buffer", noremap = true, silent = true })

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", { noremap = true, silent = true })
keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { noremap = true, silent = true })
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { noremap = true, silent = true })
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { noremap = true, silent = true })
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { noremap = true, silent = true })
-- keymap("t", "<esc>", "<C-\\><C-N>")

-- agusdmb --
keymap("n", ";", ":", { noremap = true, silent = true })
keymap("v", ";", ":", { noremap = true, silent = true })
keymap("n", ":", ";", { noremap = true, silent = true })
keymap("v", ":", ";", { noremap = true, silent = true })

-- Swapped this commands
keymap("n", "`", "'", { noremap = true, silent = true })
keymap("n", "'", "`", { noremap = true, silent = true })

keymap("n", "<leader>q", ":quit<cr>", { noremap = true, silent = true })
keymap("n", "<leader>x", ":exit<cr>", { noremap = true, silent = true })
keymap("n", "<leader>w", ":update<cr>", { noremap = true, silent = true })

keymap("n", "<leader>v", ":vert split<cr>", { noremap = true, silent = true })
keymap("n", "<leader>o", ":split<cr>", { noremap = true, silent = true })

keymap("n", "<leader>y", '"+y', { desc = "Copy to clipboard", noremap = true, silent = true })
keymap("v", "<leader>y", '"+y', { desc = "Copy to clipboard", noremap = true, silent = true })
keymap("n", "<leader>p", '"+p', { desc = "Paste from clipboard", noremap = true, silent = true })

-- keymap('n', '<leader>', ':nohlsearch<cr>')

keymap("n", "<leader>c", ":bd<cr>", { desc = "Close buffer", noremap = true, silent = true })
keymap("n", "<leader>C", ":bd!<cr>", { desc = "Force close buffer", noremap = true, silent = true })

keymap("n", "<leader>z", ":tab split<cr>", { desc = "Zoom in tab", noremap = true, silent = true })

-- keymap("i", "kj", "<esc>")

keymap("n", "J", "J0")
