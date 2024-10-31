return
{
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup {
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"vimdoc",
				"luadoc",
				"vim",
				"lua",
				"markdown",
				"c",
				"java",
			}
		}
	end,
}
