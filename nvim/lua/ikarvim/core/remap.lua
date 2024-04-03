vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- {{ Move blocks of text with autoindent }} --
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move seleted block UP", silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected block DOWN", silent = true })

-- {{ keep cursor in start of line when inline text }} --
vim.keymap.set("n", "J", "mzJ`z")

-- {{ keep copyied text in buffer after repalce }} --
vim.keymap.set("x", "<leader>p", '"_dP')

-- {{ Turn of Q command }} --
vim.keymap.set("n", "Q", "<nop>", { desc = "Turn off Q key" })

-- {{ Replace current word in file }} --
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace current word in file" }
)

-- {{ Seach in the middle of screen }} --
vim.keymap.set("n", "n", "nzzzv", { desc = "Keep searched text in middle of screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep searched text in middle of screen" })

-- {{ Half page up-down }} --
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page DOWN" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page UP" })

-- {{ Nvim copy also copies to system clipboard }} --
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- {{ Un\comment block in visual mode (inser\remove give chars at start of line) }} --
vim.keymap.set("v", "<leader>cc", ":norm i", { desc = "Prepend text in selected lines" })
vim.keymap.set("v", "<leader>cn", ":norm x", { desc = "Remove first-x chars in selected line" })

-- {{ Open terminal in vsplit block }} --
vim.keymap.set(
	"n",
	"<leader>tev",
	":belowright 50 vsplit term://bash<CR>",
	{ desc = "Open terminal iv vertical split", silent = true }
)
vim.keymap.set(
	"n",
	"<leader>tt",
	":belowright 15 split term://bash<CR>",
	{ desc = "Open terimnal in horizontal split", silent = true }
)

-- {{ Add empty lines before and after current line in normal mode }} --
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

-- {{ Open explorer in project dir }} --
vim.keymap.set("n", "<leader>exp", ':!"explorer ."<CR>', { desc = "Open root dir in explorer" })

-- {{ Win splits manipulations }} --
-- change to vetical
vim.keymap.set("n", "<leader>wv", "<C-w>t<C-w>H", { desc = "Split screen cahnge to vertical" })
-- change to horizonstal
vim.keymap.set("n", "<leader>wh", "<C-w>t<C-w>K", { desc = "Split screen chage to horizontal" })
-- resize splits
vim.keymap.set("n", "<C-Left>", ":vertical resize +3<CR>", { desc = "Split screen size taller", silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize -3<CR>", { desc = "Split screen size shorter", silent = true })
vim.keymap.set("n", "<C-Up>", ":resize +3<CR>", { desc = "Split screen size wider", silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -3<CR>", { desc = "Split screen size narrower", silent = true })

-- {{ Budder manipulations }} --
-- Previous buffer
vim.keymap.set("n", "<leader>bn", ":b#<CR>", { desc = "Go to previous buffer" })

-- {{ Treminal mode maps }} --
-- to terminal normal mode
vim.keymap.set("t", "<esc>", "<C-\\><C-N>", { desc = "From terminal mode to normal" })
