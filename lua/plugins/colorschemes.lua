return {
	{
		"marko-cerovac/material.nvim",
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		priority = 1000,
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		config = function()
			Style = "darker"
			vim.cmd("colorscheme onedark")
		end,
	},
}
