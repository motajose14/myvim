return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp", -- Plugin de completado
			"hrsh7th/cmp-nvim-lsp", -- Fuente para LSP
			"onsails/lspkind.nvim",
		},
		config = function()
			-- Configurar Mason para instalar los servidores automáticamente
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "eslint" }, -- Instalar ts_ls en lugar de tsserver
			})

			-- Configurar `ts_ls`
			local lspconfig = require("lspconfig")
			lspconfig.ts_ls.setup({
				on_attach = function(client, bufnr)
					local bufopts = { noremap = true, silent = true, buffer = bufnr }
					-- Mapear atajos de teclado básicos para LSP
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
				end,
				settings = {
					javascript = {
						suggest = {
							autoImports = true, -- Habilitar autoimportaciones
						},
					},
					typescript = {
						suggest = {
							autoImports = true,
						},
					},
				},
			})
		end,
	},
}
