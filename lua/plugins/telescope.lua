local name = "Telescope"

local map_with_name = function(func)
	return func .. " [" .. name .. "]"
end

local lsp_picker_config = {
	path_display = { "tail" },
	wrap_results = false,
	theme = "cursor"
}

return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	lazy = true,
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = map_with_name("Find Files") },
		{ "<C-f>",      "<cmd>Telescope find_files<cr>", desc = map_with_name("Find Files") },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = map_with_name("Live Grep") },
		{ "<leader>fb", "<cmd>Telescope builtin<cr>",    desc = map_with_name("Open Built-in Pickers") },
		{ "<leader>ld", "<cmd>Telescope lsp_definitions<cr>",     desc = "Find LSP Definition(s) [Telescope]" },
		{
			"<leader>fc",
			function()
				require("catppuccin")
				require("material")
				vim.cmd("Telescope colorscheme")
			end,
			desc = "Telescope colorscheme"
		},
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					-- map actions.which_key to <C-h> (default: <C-/>)
					-- actions.which_key shows the mappings for your picker,
					-- e.g. git_{create, delete, ...}_branch for the git_branches picker
					["<C-h>"] = "which_key",
					["<Tab>"] = "move_selection_next",
					["<S-Tab>"] = "move_selection_previous"
				},
				n = {
					["<Tab>"] = "move_selection_next",
					["<S-Tab>"] = "move_selection_previous"
				}
			},
			sorting_strategy = "ascending",
			layout_config = {
				prompt_position = 'top',
			},
			winblend = 15,
			wrap_results = true,
			initial_mode = "insert",
			preview = {
				treesitter = true,
			}
		},
		pickers = {
			lsp_references = lsp_picker_config,
			lsp_definitions = lsp_picker_config,
			lsp_implementations = lsp_picker_config,
			colorscheme = {
				enable_preview = true,
			},
		},
		extensions = {
		},
	},
}
