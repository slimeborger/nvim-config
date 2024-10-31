return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = true,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle File Explorer (Neotree)" },
	},
	opts = {
		close_if_last_window = true,
		filesystem = {
			follow_current_file = { enabled = true, leave_dirs_open = false }
		}
	},
}
