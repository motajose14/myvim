return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- Fuente para LSP
			"hrsh7th/cmp-buffer", -- Fuente para el contenido del buffer
			"hrsh7th/cmp-path", -- Fuente para rutas de archivo
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind") -- Opcional: íconos en el menú de completado

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- Usa Luasnip como motor de snippets
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Selecciona el primer elemento
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- Fuente de LSP
					{ name = "buffer" }, -- Contenido del buffer
					{ name = "path" }, -- Rutas de archivos
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text", -- Muestra texto e íconos
						maxwidth = 50, -- Ancho máximo del menú
					}),
				},
			})

			-- Configura el cliente LSP para usar `nvim-cmp`
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("lspconfig").ts_ls.setup({
				capabilities = capabilities,
			})
		end,
	},
}
