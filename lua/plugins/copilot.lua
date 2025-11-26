return {
	{
		"github/copilot.vim",
		config = function()
			local uname = vim.loop.os_uname().sysname
			if uname == "Darwin" then
				-- macOS path
				vim.g.copilot_node_command = "/Users/erickeduardogomezjimenez/.nvm/versions/node/v24.11.0/bin/node"
			elseif uname == "Linux" then
				-- Linux path
				local node_path = "/home/eegomezj/.nvm/versions/node/v24.11.0/bin/node"
				if vim.fn.filereadable(node_path) == 1 then
					vim.g.copilot_node_command = node_path
				else
					vim.g.copilot_node_command = "/usr/bin/node"
				end
			else
				-- fallback or error
				vim.g.copilot_node_command = "node"
			end
			vim.g.copilot_filetypes = {
				["*"] = true, -- Enable Copilot for all file types
				["markdown"] = true, -- Disable Copilot for markdown files
				["text"] = false, -- Disable Copilot for text files
				["html"] = false, -- Disable Copilot for HTML files
				["css"] = false, -- Disable Copilot for CSS files
				["javascript"] = true, -- Enable Copilot for JavaScript files
				["typescript"] = true, -- Enable Copilot for TypeScript files
				["python"] = true, -- Enable Copilot for Python files
				["lua"] = true, -- Enable Copilot for Lua files
				["go"] = true, -- Enable Copilot for Go files
				["rust"] = true, -- Enable Copilot for Rust files
				["c"] = true, -- Enable Copilot for C files
				["cpp"] = true, -- Enable Copilot for C++ files
				["java"] = true, -- Enable Copilot for Java files
				["bash"] = true, -- Enable Copilot for Bash scripts
				["json"] = true, -- Enable Copilot for JSON files
				["yaml"] = true, -- Enable Copilot for YAML files
				["xml"] = true, -- Enable Copilot for XML files
			}

			vim.keymap.set("n", "cp", function()
				vim.cmd("Copilot panel")
			end, { desc = "Open Copilot Panel" })
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			-- See Configuration section for options
			model = "claude-sonnet-4.5", -- AI model to use
			-- model = "gpt-4o", -- AI model to use
			-- model = "gpt-4o-mini", -- AI model to use
			-- model = "gpt-3.5-turbo", -- AI model to use
			max_tokens = 1000, -- Max tokens in response
			-- temperature = 0.7, -- Lower = focused, higher = creative
			temperature = 0.1, -- Lower = focused, higher = creative
			window = {
				layout = "float",
				width = 80, -- Fixed width in columns
				height = 20, -- Fixed height in rows
				border = "rounded", -- 'single', 'double', 'rounded', 'solid'
				title = "🤖 AI Assistant",
				zindex = 100, -- Ensure window stays on top
			},

			headers = {
				user = "👤 You: ",
				assistant = "🤖 Copilot: ",
				tool = "🔧 Tool: ",
			},
			separator = "━━",
			show_folds = false, -- Disable folding for cleaner look
			auto_insert_mode = true, -- Enter insert mode when opening
		},
		config = function(_, opts)
			require("CopilotChat").setup(opts)
			vim.g.copilot_no_tab_map = true
			vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
		end,
	},
}
