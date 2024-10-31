return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "lua_ls", "clangd" },
	},
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp"
	},
	config = function()
		-- Setup LSP config automatically
		require("mason-lspconfig").setup()
		require("mason-lspconfig").setup_handlers({
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- default handler (optional)
				local completions = require("cmp_nvim_lsp")
				if server_name ~= "jdtls" then
					local capabilities = completions.default_capabilities()
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end
			end,
			-- Next, you can provide a dedicated handler for specific servers.
			-- For example, a handler override for the `rust_analyzer`:
			-- ["rust_analyzer"] = function ()
			--     require("rust-tools").setup {}
			-- end
		})
	end,
}
