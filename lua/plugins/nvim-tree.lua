return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local tree = require("nvim-tree")

			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			tree.setup({
				view = {
					width = 35,
					relativenumber = true,
				},
				renderer = {
					indent_markers = {
						enable = true,
					},
				},
				-- disable window_picker for
				-- explorer to work well with
				-- window splits
				actions = {
					open_file = {
						window_picker = {
							enable = false,
						},
					},
				},
				filters = {
					custom = { ".DS_Store" },
				},
				git = {
					ignore = false,
				},
			})
		end,
		keys = {
			{ "<leader>e", ":NvimTreeFindFile<CR>", desc = "Toggle tree" },
		},
	},
}
