-- Eclipse Java development tools (JDT) Language Server downloaded from:
-- https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.21.0/jdt-language-server-1.21.0-202303161431.tar.gz
local jdtls = require('jdtls')
-- Change or delete this if you don't depend on nvim-cmp for completions.
-- local cmp_nvim_lsp = require('cmp-nvim-lsp')
local printer = function(arg, str)
	print(str .. vim.inspect(arg))
end


-- Change jdtls_path to wherever you have your Eclipse Java development tools (JDT) Language Server downloaded to.
local mason_path = vim.fn.stdpath('data') .. '/mason'
local jdtls_path = mason_path .. '/packages/jdtls'
local launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "src" }
local root_dir = vim.fs.root(0, root_markers) or vim.fn.getcwd()
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
printer(root_dir, "Root Dir: ")
printer(workspace_dir, "Workspace Dir: ")


-- for completions
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)


-- for debugging
local bundles = {
	mason_path ..
	"/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar",
	mason_path ..
	"/share/java-debug-adapter/com.microsoft.java.debug.plugin-0.53.0.jar",

};

local java_test_bundles = vim.fn.glob(mason_path .. "/packages/java-test/extension/server/*.jar", true, true)
vim.list_extend(bundles, java_test_bundles)
-- printer(bundles, "BUNDLES")
-- printer(java_test_bundles, "BUNDLES")

local function get_config_dir()
	-- Unlike some other programming languages (e.g. JavaScript)
	-- lua considers 0 truthy!
	if vim.fn.has('linux') == 1 then
		return 'config_linux'
	elseif vim.fn.has('mac') == 1 then
		return 'config_mac'
	else
		return 'config_win'
	end
end

local create_configs = function()
	jdtls.setup_dap({ hotcodereplace = "auto" })
	require("jdtls.dap").setup_dap_main_class_configs()
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	-- capabilities = capabilities,
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1G",
		"--add-modules=ALL-SYSTEM",
		"--add-opens", "java.base/java.util=ALL-UNNAMED",
		"--add-opens", "java.base/java.lang=ALL-UNNAMED",
		"-jar", launcher_jar,
		"-configuration", vim.fs.normalize(jdtls_path .. '/' .. get_config_dir()),
		"-data", vim.fn.expand('~/.cache/jdtls-workspace/') .. workspace_dir },
	settings = {
		java = {
			project = {
				referencedLibraries = java_test_bundles,
			},
			testTimeout = 30000,
		},
	},
	root_dir = root_dir,
	init_options = {
		-- https://github.com/eclipse/eclipse.jdt.ls/wiki/Language-Server-Settings-&-Capabilities#extended-client-capabilities
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
		bundles = bundles,
	},
	on_attach = function(client, bufnr)
		-- https://github.com/mfussenegger/dotfiles/blob/833d634251ebf3bf7e9899ed06ac710735d392da/vim/.config/nvim/ftplugin/java.lua#L88-L94
		local opts = { silent = true, buffer = bufnr }
		create_configs()
		vim.keymap.set('n', "<leader>lo", jdtls.organize_imports, { desc = 'Organize imports', buffer = bufnr })
		-- Should 'd' be reserved for debug?
		vim.keymap.set('n', "<leader>df", jdtls.test_class, opts)
		vim.keymap.set('n', "<leader>dn", jdtls.test_nearest_method, opts)
		vim.keymap.set('n', '<leader>rv', jdtls.extract_variable_all, { desc = 'Extract variable', buffer = bufnr })
		vim.keymap.set('v', '<leader>rm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
			{ desc = 'Extract method', buffer = bufnr })
		vim.keymap.set('n', '<leader>rc', jdtls.extract_constant, { desc = 'Extract constant', buffer = bufnr })
	end
}


jdtls.start_or_attach(config)
