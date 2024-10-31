return
{
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.clang_format.with({
					filetypes = { "c", "cpp", "java", }, -- Include both C/C++ and Java
				}),
			},
		})
	end,
	on_attach = function(client, bufnr)
		if client.name == "jdtls" then
			client.resolved_capabilities.document_formatting = false
		end

		if client.supports_method("textDocument/formatting") or client.name == "jdtls" then
			vim.api.nvim_clear_autocmds({ buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
}
