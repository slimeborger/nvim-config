return {
	'rmagatti/auto-session',
	lazy = false,
	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	keys = {
		-- Will use Telescope if installed or a vim.ui.select picker otherwise
		{ '<leader>fs', '<cmd>SessionSearch<CR>',         desc = 'Session search' },
	},
	opts = {
		suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
		-- log_level = 'debug',
		auto_restore = false
	}
}
