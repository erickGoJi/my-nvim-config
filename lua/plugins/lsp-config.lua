return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"gopls",
				"ts_ls",
				"dockerls",
				"erlangls",
				"bashls",
				"yamlls",
				"pyright",
				"ruff",
				"clangd",
			},
		},
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = {
					"lua_ls",
					"gopls",
					"ts_ls",
					"dockerls",
					"erlangls",
					"bashls",
					"yamlls",
					"pyright",
					"ruff",
					"clangd",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local function setup_server(name, opts)
				if vim.lsp and vim.lsp.config then
					vim.lsp.config(name, opts)
				else
					lspconfig[name].setup(opts)
				end
			end

			setup_server("lua_ls", { capabilities = capabilities })
			setup_server("gopls", { capabilities = capabilities })
			setup_server("ts_ls", { capabilities = capabilities })
			setup_server("dockerls", { capabilities = capabilities })
			setup_server("erlangls", { capabilities = capabilities })
			setup_server("gleam", { capabilities = capabilities })
			setup_server("bashls", { capabilities = capabilities })
			setup_server("pyright", {
				capabilities = capabilities,
				settings = {
					pyright = { disableOrganizeImports = true },
					python = { analysis = { ignore = { "*" } } },
				},
			})
			setup_server("ruff", { capabilities = capabilities })
			setup_server("clangd", { capabilities = capabilities })
			setup_server("yamlls", {
				capabilities = capabilities,
				settings = {
					yaml = {
						format = { enable = true },
						validate = true,
						schemaStore = {
							enable = true,
							url = "https://www.schemastore.org/api/json/catalog.json",
						},
						schemas = {
							["https://raw.githubusercontent.com/lalcebo/json-schema/master/serverless/reference.json"] = {
								"serverless.yml",
								"serverless.yaml",
								"functions.yml",
							},
							["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/github-workflow.json"] = {
								".github/workflows/*",
							},
						},
					},
				},
			})
		end,
	},
}
