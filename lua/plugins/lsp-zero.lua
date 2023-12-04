return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp = require("lsp-zero")
            lsp.extend_lspconfig()

            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })

                local ks = vim.keymap.set
                local opt = { buffer = bufnr, silent = true }
                ks("n", "<leader>lk", vim.lsp.buf.hover, opt)
                ks("n", "<leader>la", vim.lsp.buf.code_action, opt)
                ks("n", "<leader>li", vim.lsp.buf.implementation, opt)
                ks("n", "<leader>lr", vim.lsp.buf.references, opt)
                ks("n", "<leader>lR", vim.lsp.buf.rename, opt)
                ks("n", "<leader>lt", vim.lsp.buf.type_definition, opt)

                vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
                    vim.lsp.buf.format()
                end, { desc = "Format current buffer with LSP" })

                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                    end
                })
            end)
            lsp.setup()
        end
    },

    {
        "williamboman/mason.nvim",
        config = true
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "eslint",
                    "tsserver",
                    "lua_ls",
                },
                automatic_installation = true,
                handlers = {
                    require("lsp-zero").default_setup,
                    tsserver = function()
                        require('lspconfig').tsserver.setup({
                            settings = {
                                completions = {
                                    completeFunctionCalls = true
                                }
                            }
                        })
                    end,
                    eslint = function()
                        require('lspconfig').eslint.setup({
                            on_attach = function(client, bufnr)
                                vim.api.nvim_create_autocmd("BufWritePre", {
                                    buffer = bufnr,
                                    command = "EslintFixAll",
                                })
                            end
                        })
                    end
                }
            })
        end
    },

    -- LSP Support
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
        },
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            local lsp = require("lsp-zero")
            lsp.extend_cmp()

            local cmp = require("cmp")
            local cmp_action = lsp.cmp_action()

            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,preview,noselect",
                },
                formatting = lsp.cmp_format(),
                sources = {
                    { name = 'copilot' },
                    { name = 'nvim_lsp' },
                    { name = "buffer" },
                    { name = "path" },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({
                        -- documentation says this is important.
                        -- I don't know why.
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    })
                })
            })
        end
    }
}
