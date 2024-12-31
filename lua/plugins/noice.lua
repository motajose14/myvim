return {
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim", -- Requerido para ventanas flotantes
			"rcarriga/nvim-notify", -- Opcional: notificaciones flotantes
			"nvim-tree/nvim-web-devicons", -- Opcional: iconos para mejor apariencia
		},
		config = function()
			require("noice").setup({
				cmdline = {
					enabled = true, -- Activa la línea de comandos flotante
					view = "cmdline_popup", -- Configura como ventana flotante
					format = {
						cmdline = { icon = ">" }, -- Icono personalizado para la línea de comandos
						search_down = { icon = "🔍⌄" },
						search_up = { icon = "🔍⌃" },
						filter = { icon = "$" },
					},
				},
				popupmenu = {
					enabled = true, -- Habilita el menú emergente flotante
					backend = "nui", -- Usa "nui" para ventanas flotantes
				},
				messages = {
					enabled = false, -- Desactiva los mensajes flotantes (puedes cambiar a true si los necesitas)
				},
				views = {
					cmdline_popup = {
						border = {
							style = "rounded", -- Bordes redondeados
							text = { top = " Command Line " }, -- Título del borde superior
						},
						position = {
							row = "10%", -- Centrado verticalmente
							col = "50%", -- Centrado horizontalmente
						},
						size = {
							width = 60, -- Ancho de la ventana flotante
							height = "auto", -- Altura automática
						},
						win_options = {
							winblend = 10, -- Transparencia de la ventana
							winhighlight = "NormalFloat:Normal,FloatBorder:FloatBorder",
						},
					},
				},
				lsp = {
					progress = { enabled = false }, -- Desactiva barra de progreso de LSP (opcional)
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = false, -- Usa la búsqueda flotante en lugar de la barra inferior
					command_palette = false, -- No usar el estilo "command palette" (puedes activarlo si lo prefieres)
					long_message_to_split = true, -- Divide mensajes largos en buffers flotantes
				},
			})

			-- Configuración para usar `nvim-notify` como notificador por defecto
			local notify = require("notify")
			vim.notify = notify
		end,
	},
}
