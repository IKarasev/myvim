return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local action_state = require("telescope.actions.state")
		local finders = require("telescope.finders")
		local pickers = require("telescope.pickers")
		local entry_display = require("telescope.pickers.entry_display")
		local conf = require("telescope.config").values
		local harpoon = require("harpoon")

		harpoon:setup()

		local function filter_empty_string(list)
			local next = {}
			for idx = 1, #list do
				if not (list[idx] == nil) then
					if list[idx].value ~= "" then
						table.insert(next, { idx = idx, item = list[idx] })
					end
				end
			end

			return next
		end

		local make_finder = function()
			local res = filter_empty_string(harpoon:list().items)
			return finders.new_table({
				results = res,
				entry_maker = function(entry)
					local line = entry.item.value
					local displayer = entry_display.create({
						separator = "",
						items = {
							{ width = 4 },
							{ width = 50 },
							{ remaining = true },
						},
					})
					local make_display = function()
						return displayer({
							"[" .. tostring(entry.idx) .. "]",
							line,
						})
					end
					return {
						value = entry.item,
						ordinal = line,
						display = make_display,
						lnum = entry.item.row,
						col = entry.item.col,
						filename = entry.item.value,
					}
				end,
			})
		end

		local delete_mark = function(prompt_buffer_number)
			local selected = action_state.get_selected_entry()
			harpoon:list():remove(selected.value)
			-- remove_empty()
			local current_picker = action_state.get_current_picker(prompt_buffer_number)
			current_picker:refresh(make_finder(), { reset_prompt = true })
		end

		local function toggle_telescope()
			pickers
				.new({}, {
					prompt_title = "Harpoon",
					finder = make_finder(),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
					attach_mappings = function(_, map)
						map("i", "<C-R>", delete_mark)
						map("n", "<C-R>", delete_mark)
						return true
					end,
				})
				:find()
		end

		-- Keymapping
		vim.keymap.set("n", "<leader>he", function()
			toggle_telescope()
		end, { desc = "Open harpoon window" })

		vim.keymap.set("n", "<leader>ha", function()
			local f = vim.api.nvim_buf_get_name(0)
			print("Harpoon add: " .. f)
			harpoon:list():add()
		end, { desc = "Harpoon: append" })

		-- Navigate to item list
		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon: select 1" })
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon: select 2" })
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon: select 3" })
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon: select 4" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-z>", function()
			harpoon:list():prev({ ui_nav_wrap = true })
		end, { desc = "Harpoon: select previous" })
		vim.keymap.set("n", "<C-c>", function()
			harpoon:list():next({ ui_nav_wrap = true })
		end, { desc = "Harpoon: select next" })
	end,
}
