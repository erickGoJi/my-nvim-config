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
<<<<<<< HEAD
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
=======
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
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
>>>>>>> 26b16a0 ([fix] go: update lazy-lock.json and lsp-config.lua)
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})

			lspconfig.erlangls.setup({
				capabilities = capabilities,
			})

<<<<<<< HEAD
      lspconfig.gleam.setup({
        capabilities = capabilities,
      })

      lspconfig.bashls.setup({
        capabilities = capabilities,
      })

      lspconfig.yamlls.setup({
        capabilities = capabilities,
        settings = {
          yaml = {
            format = {
              enable = true,
            },
            validate = true,
            schemaStore = {
              enable = true,
              url = "https://www.schemastore.org/api/json/catalog.json",
            },
            schemas = {
              ["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/github-workflow.json"] = {
                ".github/workflows/*",
              },
              ["https://json.schemastore.org/composer"] = {
                "serverless.yml",
                "serverless.yaml",
              },
            },
          },
        },
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

=======
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})

			lspconfig.yamlls.setup({
				capabilities = capabilities,
				settings = {
					yaml = {
						format = {
							enable = true,
						},
						validate = true,
						schemaStore = {
							enable = true,
							url = "https://www.schemastore.org/api/json/catalog.json",
						},
						schemas = {
							["https://raw.githubusercontent.com/lalcebo/json-schema/master/serverless/reference.json"] = {
								"serverless.yml",
								"serverless.yaml",
							},
							["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/github-workflow.json"] = {
								".github/workflows/*",
							},
						},
					},
				},
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					pyright = {
						-- Using Ruff's import organizer
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							-- Ignore all files for analysis to exclusively use Ruff for linting
							ignore = { "*" },
						},
					},
				},
			})

			lspconfig.ruff.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
