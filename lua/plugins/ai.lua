return {
	{
		"nomnivore/ollama.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("ollama").setup({
				model = "deepseek-coder:latest",
				request_timeout = 300000,
			})
		end,
	},
	---------------------------------------------------------------------------
	-- 2) Autocomplete like Copilot bit with cmp-ai + Ollama
	---------------------------------------------------------------------------
	{
		"tzachar/cmp-ai",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			local cmp_ai = require("cmp_ai.config")

			cmp_ai:setup({
				max_lines = 100,
				provider = "Ollama",
				provider_options = {
					model = "qwen2.5-coder:7b",
					auto_unload = true,
				},
				notify = true,
				notify_callback = function(msg)
					vim.notify("[cmp-ai] " .. msg)
				end,
				run_on_every_keystroke = true,
				ignored_file_types = {
					-- lua = true,
				},
			})
		end,
	},
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local cc = require("codecompanion")

			cc.setup({
				adapters = {
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							schema = {
								model = {
									default = "deepseek-coder:latest",
								},
							},
						})
					end,
				},
				strategies = {
					chat = {
						adapter = "ollama",
					},
					inline = {
						adapter = "ollama",
					},
				},
			})

			local map = vim.keymap.set

			map("n", "<leader>ac", function()
				vim.cmd("CodeCompanionChat")
			end, { desc = "[AI] Abrir chat CodeCompanion" })

			map("v", "<leader>ae", function()
				vim.cmd("CodeCompanionChat")
			end, { desc = "[AI] Chat sobre selección" })

			map("v", "<leader>ai", function()
				vim.cmd("CodeCompanionInline")
			end, { desc = "[AI] Editar selección con IA" })

			map("n", "<leader>ax", function()
				vim.cmd("CodeCompanionExplain")
			end, { desc = "[AI] Explicar código actual" })
		end,
	},
}
