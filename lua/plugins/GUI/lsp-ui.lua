return {
	"jinzhongjia/LspUI.nvim",
	keys =
	{
		{ "gf",         vim.lsp.buf.format,              desc = "Format File [LSP]" },
		{ "<leader>r",  "<cmd>LspUI rename<cr>",         desc = "Rename Variable [LSP]" },
		{ "<leader>la", "<cmd>LspUI code_action<cr>",    desc = "Code Actions [LSP]" },
		{ "<Tab>",      "<cmd>LspUI hover<cr>",          desc = "Toggle Hover [LSP]" },
		{ "<leader>lr", "<cmd>LspUI reference<cr>",      desc = "Find Reference(s) [LSP]" },
		{ "<leader>li", "<cmd>LspUI implementation<cr>", desc = "Find LSP Implementation(s) [LSP]" },

	},
	opts =
	{
		pos_keybind =
		{
			main = {
				back = "<leader>l",
				hide_secondary = "<leader>h",
			},
			secondary = {
				jump = "<CR>",
				jump_split = "sh",
				jump_vsplit = "sv",
				jump_tab = "t",
				toggle_fold = "`",
				next_entry = "J",
				prev_entry = "K",
				quit = "<Esc>",
				hide_main = "<leader>h",
				fold_all = "w",
				expand_all = "e",
				enter = "<leader>l",
			},
		}




	}
}
