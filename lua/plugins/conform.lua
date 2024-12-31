return {
	{
		"stevearc/conform.nvim",
		lazy = false,
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" }, -- Para JSX
					typescriptreact = { "prettier" },
					php = { "php_cs_fixer" },
				},
				format_on_save = {
					lsp_fallback = true,
					timeout_ms = 2000,
				},
			})
		end,
	},
}
