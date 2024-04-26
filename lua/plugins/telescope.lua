return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    path_display = { "smart" },
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    },
                },
            })

            telescope.load_extension("fzf")
        end,
        keys = {
            { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Search Files" },
            { "<leader>so", "<cmd>Telescope oldfiles<cr>",   desc = "Search Recent Files" },
            { "<leader>sg", "<cmd>Telescope live_grep<cr>",  desc = "String Grep" },
        }
    }
}
