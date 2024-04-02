return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "iceberg_dark",
		},
		sections = {
			lualine_c = {
				{
					"filename",
					path = 1,
				},
			},
		},
	},
}
