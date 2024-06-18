return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		local extensions = require("harpoon.extensions")

		harpoon.setup()
		harpoon:extend(extensions.builtins.navigate_with_number())

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

		local ks = vim.keymap.set

		ks("n", "<leader>ns", function()
			harpoon:list():add()
		end)
		ks("n", "<C-e>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
		ks("n", "<leader>n1", function()
			harpoon:list():select(1)
		end)
		ks("n", "<leader>n2", function()
			harpoon:list():select(2)
		end)
		ks("n", "<leader>n3", function()
			harpoon:list():select(3)
		end)
		ks("n", "<leader>n4", function()
			harpoon:list():select(4)
		end)
		ks("n", "<leader>np", function()
			harpoon:list():prev()
		end)
		ks("n", "<leader>nn", function()
			harpoon:list():next()
		end)
	end,
}
