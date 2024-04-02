return {
	"williamboman/mason.nvim",
	lazy = false,
	config = true,
	opts = function(_, opts)
		opts.ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		}
		opts.ensure_installed = opts.ensure_installed or {}
		vim.list_extend(opts.ensure_installed, { "goimports", "delve" })
	end,
}
