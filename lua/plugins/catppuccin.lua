return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "frappe",
            transparent_background = true,
            integrations = {
                cmp = true,
                nvimtree = true,
                treesitter = true,
                mason = true,
            }
        }
    }
}
