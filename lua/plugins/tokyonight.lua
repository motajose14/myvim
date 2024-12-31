return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
      require("tokyonight").setup({
        style = "night", -- Estilo: opciones son "night", "storm", "day", "moon"
        transparent = false, -- Fondo opaco (true si quieres transparente)
        terminal_colors = true, -- Usar los colores en la terminal
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
          variables = {},
        },
        sidebars = { "qf", "vista_kind", "terminal", "packer" }, -- Fondo específico para estas ventanas
        dim_inactive = true, -- Atenuar ventanas inactivas
        lualine_bold = true, -- Negrita en la barra de estado
      })
      vim.cmd("colorscheme tokyonight-night")
  end,
}
