vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- {{ Move blocks of text with autoindent }} --
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- {{ keep cursor in start of line when inline text }} --
vim.keymap.set("n", "J", "mzJ`z")

-- {{ keep copyied text in buffer after repalce }} --
vim.keymap.set("x", "<leader>p", '"_dP')

-- {{ Turn of Q command }} --
vim.keymap.set("n", "Q", "<nop>")

-- {{ Replace current word in file }} --
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- {{ Seach in the middle of screen }} --
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- {{ Half page up-down }} --
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- {{ Nvim copy also copies to system clipboard }} --
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- {{ Un\comment block in visual mode (inser\remove give chars at start of line) }} --
vim.keymap.set("v", "<leader>cc", ":norm i")
vim.keymap.set("v", "<leader>cn", ":norm x")

-- {{ Open terminal in vsplit block }} --
vim.keymap.set("n", "<leader>tev", ":belowright 50 vsplit term://bash<CR>")
vim.keymap.set("n", "<leader>tt", ":belowright 15 split term://bash<CR>")

-- {{ Add empty lines before and after current line in normal mode }} --
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

-- {{ Win splits manipulations }} --
-- change to vetical
vim.keymap.set("n", "<leader>wv", "<C-w>t<C-w>H")
-- change to horizonstal
vim.keymap.set("n", "<leader>wh", "<C-w>t<C-w>K")
-- resize splits
vim.keymap.set("n", "<C-Left>", ":vertical resize +3<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -3<CR>")
vim.keymap.set("n", "<C-Up>", ":resize +3<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -3<CR>")

-- {{ Budder manipulations }} --
-- Previous buffer
vim.keymap.set("n", "<leader>bn", ":b#<CR>")

-- {{ Treminal mode maps }} --
-- to terminal normal mode
vim.keymap.set("t", "<esc>", "<C-\\><C-N>")
