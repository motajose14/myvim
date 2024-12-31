return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- Iconos opcionales
		},
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 30, -- Ancho del panel
				},
				renderer = {
					group_empty = true, -- Agrupar carpetas vacías
				},
			})
		end,
	},
}
