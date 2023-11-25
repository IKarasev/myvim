return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set("n", "<C-s>", api.node.open.vertical, opts("Open: Vertical Split"))
		end

		nvimtree.setup({
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			git = {
				ignore = false,
			},
			on_attach = my_on_attach,
		})

		vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
		vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
		vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
		vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
	end,
}
