return {
	"danymat/neogen",
	version = "*",
	dependencies = { "nvim-treesitter/nvim-treesitter", "L3MON4D3/LuaSnip" },
	cmd = { "Neogen" },
	ft = { "python", "go" },
	config = function()
		local neogen = require("neogen")

		neogen.setup({
			snippet_engine = "luasnip",
			enabled = true,
			languages = {
				python = {
					template = {
						annotation_convention = "google_docstrings",
					},
				},
				go = {
					template = {
						annotation_convention = "godoc",
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>nc", "<cmd>:Neogen class<CR>")
		vim.keymap.set("n", "<leader>nf", "<cmd>:Neogen func<CR>")
		vim.keymap.set("n", "<leader>nt", "<cmd>:Neogen type<CR>")
	end,
}
