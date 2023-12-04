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
            { "<leader>sf", "<cmd>Telescope find_files hidden=true<cr>", desc = "Search Files" },
            { "<leader>so", "<cmd>Telescope oldfiles<cr>",               desc = "Search Recent Files" },
            {
                "<leader>sg",
                function()
                    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep: ") })
                end,
                desc = "String Grep"
            },
        }
    }
}
