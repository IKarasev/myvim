return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		"L3MON4D3/LuaSnip",
		{
			"benfowler/telescope-luasnip.nvim",
			module = "telescope._extensions.luasnip",
		},
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["<C-b>"] = require("telescope.actions").delete_buffer,
					},
					i = {
						["<C-s>"] = actions.select_vertical,
						["<C-b>"] = require("telescope.actions").delete_buffer,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("luasnip")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search files" })
		vim.keymap.set("n", "<leader>fp", builtin.git_files, { desc = "Search in git" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Search in buffers" })
		vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Search string under cursor" })
		vim.keymap.set("n", "<leader>fg", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Promt to search string in files" })
	end,
}
