return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
        keys = {
            { "<leader>e", ":NvimTreeFindFile<CR>", desc = "Toggle tree" },
        }
    }
}
