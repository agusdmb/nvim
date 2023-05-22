-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>")
keymap("n", "<C-Down>", ":resize -2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "gb", ":bn<cr>")
keymap("n", "gB", ":bp<cr>")

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l")
-- keymap("t", "<esc>", "<C-\\><C-N>")

-- agusdmb --
keymap("n", ";", ":")
keymap("v", ";", ":")
keymap("n", ":", ";")
keymap("v", ":", ";")

-- Swapped this commands
keymap("n", "`", "'")
keymap("n", "'", "`")

keymap("n", "<leader>q", ":quit<cr>")
keymap("n", "<leader>x", ":exit<cr>")
keymap("n", "<leader>w", ":update<cr>")

keymap("n", "<leader>v", ":vert split<cr>")
keymap("n", "<leader>o", ":split<cr>")

keymap("n", "<leader>y", '"+y')
keymap("v", "<leader>y", '"+y')
keymap("n", "<leader>p", '"+p')

-- keymap('n', '<leader>', ':nohlsearch<cr>')

keymap("n", "<leader>c", ":bd<cr>")
keymap("n", "<leader>C", ":bd!<cr>")

keymap("n", "<leader>z", ":tab split<cr>")

keymap("i", "kj", "<esc>")
