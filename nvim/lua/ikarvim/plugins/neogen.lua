return {
	"danymat/neogen",
	version = "*",
	dependencies = { "nvim-treesitter/nvim-treesitter", "L3MON4D3/LuaSnip" },
	cmd = { "Neogen" },
	ft = { "python" },
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
			},
		})
		vim.keymap.set("n", "<leader>nc", "<cmd>:Neogen class<CR>")
		vim.keymap.set("n", "<leader>nf", "<cmd>:Neogen func<CR>")
	end,
}
