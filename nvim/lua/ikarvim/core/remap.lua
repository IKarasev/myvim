vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move blocks of text with autoindent
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- keep cursor in start of line when inline text
vim.keymap.set("n", "J", "mzJ`z")

-- keep copyied text in buffer after repalce
vim.keymap.set("x", "<leader>p", '"_dP')

-- Turn of Q command
vim.keymap.set("n", "Q", "<nop>")

-- Replace current word in file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Seach in the middle of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Half page up-down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Nvim copy also copies to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Un\comment block in visual mode
vim.keymap.set("v", "<leader>cc", ":norm i")
vim.keymap.set("v", "<leader>cn", ":norm x")

-- Open terminal in vsplit block
vim.keymap.set("n", "<leader>tev", ":belowright vsplit term://bash<CR>")
vim.keymap.set("n", "<leader>teh", ":belowright split term://bash<CR>")
