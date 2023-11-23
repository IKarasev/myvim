return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },
	event = { "BufReadPre", "BufNewFile", "BufWritePre" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "gofmt" },
				javascript = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 1000,
				async = false,
				lsp_fallback = true,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>fc", function()
			conform.format({
				timeout_ms = 1000,
				async = false,
				lsp_fallback = true,
			})
		end, { desc = "Format code in normal or visual mode" })
	end,
}
