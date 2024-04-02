return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open fuigitive git" })
		vim.keymap.set("n", "<leader>gsp", "<cmd>:Git! push<CR>", { desc = "Figitive git push" })
	end,
}
