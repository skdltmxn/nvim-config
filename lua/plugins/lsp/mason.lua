return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"lua_ls",
					"svelte",
					"gopls",
				},
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"eslint_d", -- javascript/typescript formatter
					"pylint", -- python linter
				},
			})
		end,
	},
}
