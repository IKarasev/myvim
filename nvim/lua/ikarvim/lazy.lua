local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "ikarvim.plugins" },
	{ import = "ikarvim.plugins.lsp" },
})

vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Lazy: open lazy window" })
