local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- not recursive and don't show output
-- window management
keymap("n", "sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap("n", "sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap("n", "se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap("n", "sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Navigation between lines
keymap("n", "k", "gk", opts)
keymap("n", "gk", "k", opts)
keymap("n", "j", "gj", opts)
keymap("n", "gj", "j", opts)
keymap("n", "0", "g^", opts)
keymap("n", "$", "g$", opts)
keymap("n", "^", "g0", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Avoids yanking visual block after pasting
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv", opts)
keymap("x", "K", ":m '<-2<CR>gv", opts)

-- Write changes to file
keymap("n", "<C-s>", ":w<CR>", opts)
