return {
	"aznhe21/actions-preview.nvim",
	lazy = false,
	keys = {
		{ "<leader>fa", function() require("actions-preview").code_actions() end, desc = "Code Actions Preview (actions-preview)" },
	}

}
