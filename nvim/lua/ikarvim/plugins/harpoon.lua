return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		-- Keymapping
		vim.keymap.set("n", "<leader>he", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():append()
		end, { desc = "Harpoon: append" })
		vim.keymap.set("n", "1", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon: select 1" })
		vim.keymap.set("n", "2", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon: select 2" })
		vim.keymap.set("n", "3", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon: select 3" })
		vim.keymap.set("n", "4", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon: select 4" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-z>", function()
			harpoon:list():prev()
		end, { desc = "Harpoon: select previous" })
		vim.keymap.set("n", "<C-x>", function()
			harpoon:list():next()
		end, { desc = "Harpoon: select next" })
	end,
}
