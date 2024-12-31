return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "html", "javascript", "typescript", "tsx", "vue" }, -- Instala los lenguajes necesarios
			highlight = {
				enable = true, -- Habilita el resaltado
			},
			indent = {
				enable = true, -- Habilita la indentación automática
			},
		})

		-- Configuración específica para `nvim-ts-autotag`
		require("nvim-ts-autotag").setup()
	end,
}
