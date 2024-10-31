return {
	load_plugins = function()
		local plugins = {}

		-- Ensure we search for all Lua files inside `lua/plugins` and its subdirectories
		local search_path = vim.fn.stdpath("config") .. "/lua/plugins/**/*.lua"
		local plugin_files = vim.fn.glob(search_path, true, true)
		for _, file in ipairs(plugin_files) do
			local module_path = file:match(".*\\lua\\(.*)%.lua$")
			module_path = module_path:gsub("\\", ".")

			if module_path ~= "plugins.init" then -- Prevent loading this file itself
				local ok, plugin = pcall(require, module_path)

				if ok and type(plugin) == "table" then
					table.insert(plugins, plugin)
				else
					vim.notify("Failed to load plugin: " .. module_path, vim.log.levels.ERROR)
				end
			end
		end
		return plugins
	end,
	load_plugins_on_excluded_filetypes = function()
		vim.defer_fn(function()
			local plugins =
			{
				"mason-lspconfig.nvim", "none-ls.nvim", "nvim-treesitter", "LspUI"
			}
			local excluded_filetypes = { "text", "lrc" }
			local excluded_fts = function()
				local current_buf = vim.api.nvim_get_current_buf()
				local filename = vim.fn.fnamemodify(vim.fn.bufname(current_buf), ':t')
				local current_filetype =
					vim.api.nvim_buf_get_option(current_buf, 'filetype')

				-- Excluded filetype
				-- Can either add the filetype or file extensions
				-- ex. 'text' or 'txt'

				for _, filetype in ipairs(excluded_filetypes) do -- Checks filetype
					if current_filetype == filetype then
						return true                  -- Skip for excluded excluded_filetypes
					end
				end

				local patterns = {}
				for _, ext in ipairs(excluded_filetypes) do
					table.insert(patterns, string.format('.*%s$', ext))
				end

				local is_not_desired_filetype = false
				for _, pattern in ipairs(patterns) do -- Checks file extension
					if string.match(filename, pattern) then
						is_not_desired_filetype = true
						break
					end
				end

				return is_not_desired_filetype
			end
			if not excluded_fts() then
				for _, plugin in ipairs(plugins) do
					local isLoaded = package.loaded[plugin] ~= nil
					print("Loading " .. plugin)
					if not isLoaded then
						vim.cmd("Lazy load " .. plugin)
					end
				end
			end
		end, 500)
	end
}
