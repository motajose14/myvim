return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = {
		size = 20, -- Tamaño por defecto
		open_mapping = [[<F7>]],
		direction = "float", -- Dirección de la terminal: ventana flotante
		float_opts = {
			border = "curved", -- Borde de la ventana flotante
			width = 160,
			height = 30,
			winblend = 10,
		},
	},
}
