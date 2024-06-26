return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"bash",
				"python",
				"html",
				"json",
				"yaml",
				"xml",
				"dockerfile",
				"ssh_config",
				"git_config",
				"gitcommit",
				"gitignore",
				"markdown",
				"markdown_inline",
				"java",
				"regex",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
