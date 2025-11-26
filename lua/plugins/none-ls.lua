return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local augrup = vim.api.nvim_create_augroup("LspFormatting", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.goimports_reviser,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.yamlfmt,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.ruff,
					null_ls.builtins.diagnostics.golangci_lint,
					require("none-ls.diagnostics.eslint"),
				},
				on_attach = function(client, bufnr)
					if client:supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augrup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augrup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
			vim.lsp.buf.format({ timeout_ms = 2000 })
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		end,
	},
}
