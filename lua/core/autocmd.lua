local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General", { clear = true })

autocmd("FileType", {
    pattern = { "typescript", "javascript", "svelte", "json" },
    callback = function()
        vim.bo.expandtab = true
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
    end,
    group = general,
    desc = "Use 2 space indent for these filetypes",
})
