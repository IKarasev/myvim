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

		local make_finder = function()
			local file_paths = {}
			local harpoon_list = harpoon:list()
			for i, item in ipairs(harpoon_list.items) do
				table.insert(file_paths, { tostring(i), item.value })
			end
			return require("telescope.finders").new_table({
				results = file_paths,
				entry_maker = function(entry)
					return {
						value = entry[2],
						display = string.format("[%s] %s", entry[1], entry[2]),
						ordinal = entry[2],
					}
				end,
			})
		end

		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for i, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, { tostring(i), item.value })
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = make_finder(),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
					attach_mappings = function(prompt_buffer_number, map)
						map(
							"i",
							"<C-R>", -- your mapping here
							function()
								local state = require("telescope.actions.state")
								local selected_entry = state.get_selected_entry()
								local current_picker = state.get_current_picker(prompt_buffer_number)

								harpoon:list():removeAt(selected_entry.index)
								current_picker:refresh(make_finder())
							end
						)

						return true
					end,
				})
				:find()
		end

		-- Keymapping
		vim.keymap.set("n", "<leader>he", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })

		vim.keymap.set("n", "<leader>ha", function()
			local f = vim.api.nvim_buf_get_name(0)
			print("Harpoon append: " .. f)
			harpoon:list():append()
		end, { desc = "Harpoon: append" })

		-- Navigate to item list
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
