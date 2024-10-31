vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
	pattern = '*',
	callback = function() require("config.functions").load_plugins_on_excluded_filetypes() end
})
