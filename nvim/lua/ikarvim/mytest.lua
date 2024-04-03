local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local harpoon = require("harpoon")
local conf = require("telescope.config").values

-- local printTable = function(t)
-- 	local printTable_cache = {}
--
-- 	local function sub_printTable(t, indent)
-- 		if printTable_cache[tostring(t)] then
-- 			print(indent .. "*" .. tostring(t))
-- 		else
-- 			printTable_cache[tostring(t)] = true
-- 			if type(t) == "table" then
-- 				for pos, val in pairs(t) do
-- 					if type(val) == "table" then
-- 						print(indent .. "[" .. pos .. "] => " .. tostring(t) .. " {")
-- 						sub_printTable(val, indent .. string.rep(" ", string.len(pos) + 8))
-- 						print(indent .. string.rep(" ", string.len(pos) + 6) .. "}")
-- 					elseif type(val) == "string" then
-- 						print(indent .. "[" .. pos .. '] => "' .. val .. '"')
-- 					else
-- 						print(indent .. "[" .. pos .. "] => " .. tostring(val))
-- 					end
-- 				end
-- 			else
-- 				print(indent .. tostring(t))
-- 			end
-- 		end
-- 	end
--
-- 	if type(t) == "table" then
-- 		print(tostring(t) .. " {")
-- 		sub_printTable(t, "  ")
-- 		print("}")
-- 	else
-- 		sub_printTable(t, "  ")
-- 	end
-- end

local make_finder = function()
	local file_paths = {}
	local harpoon_list = harpoon:list()
	for i, item in ipairs(harpoon_list.items) do
		table.insert(file_paths, { tostring(i), item.value })
	end
	return finders.new_table({
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

local hrpn = function()
	pickers
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
						print("Remove item")
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

hrpn()
