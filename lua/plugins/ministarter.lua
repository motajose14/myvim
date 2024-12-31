return {
	{
		"echasnovski/mini.starter",
		event = "VimEnter",
		opts = function()
			local starter = require("mini.starter")
			return {
				evaluate_single = true, -- Ejecuta una opción automáticamente si es la única
				header = [[	
██████╗ ██╗   ██╗██╗     ███████╗ ██████╗ ███████╗████████╗
██╔══██╗██║   ██║██║     ██╔════╝██╔═══██╗██╔════╝╚══██╔══╝
██║  ██║██║   ██║██║     ███████╗██║   ██║█████╗     ██║   
██║  ██║╚██╗ ██╔╝██║     ╚════██║██║   ██║██╔══╝     ██║   
██████╔╝ ╚████╔╝ ███████╗███████║╚██████╔╝██║        ██║   
╚═════╝   ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝        ╚═╝
						                    
                                            Por Jose Mota
                                                           
        ]], -- Cambia el encabezado del dashboard
				items = {
					starter.sections.builtin_actions(), -- Acciones comunes (editar, abrir, etc.)
					{ name = "Find File", action = "Telescope find_files", section = "Search" },
					{ name = "Recent Files", action = "Telescope oldfiles", section = "Search" },
					{ name = "Config", action = "edit ~/.config/nvim/init.lua", section = "Config" },
				},
				content_hooks = {
					starter.gen_hook.adding_bullet("• "), -- Añade un ícono antes de cada opción
					starter.gen_hook.aligning("center", "center"), -- Centra el contenido
				},
			}
		end,
		config = function(_, opts)
			require("mini.starter").setup(opts)
		end,
	},
}
