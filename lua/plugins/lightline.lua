return {
    {
        "itchyny/lightline.vim",
        config = function()
            vim.g.lightline = {
                colorscheme = "catppuccin",
                active = {
                    left = { { "mode", "paste" }, { "readonly", "absolutepath", "modified" } },
                }
            }
        end
    },
}
