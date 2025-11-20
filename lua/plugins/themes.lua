return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		enabled = true,
		config = function()
			local sign = vim.fn.sign_define
			require("catppuccin").setup({
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
				flavour = "macchiato", -- Cambia entre latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false,
				float = {
					transparent = true, -- enable transparent floating windows
					solid = false, -- use solid styling for floating windows, see |winborder|
				},
				dap = true,
			})
			-- vim.cmd.colorscheme("catppuccin")

			sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"uhs-robert/oasis.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("oasis").setup({
				dark_style = "mirage", -- Style to use when vim.o.background is "dark"
				light_style = "day", -- Style to use when vim.o.background is "light"
				style = nil, -- Optional: Set a single style to disable auto-switching (e.g., "lagoon", "desert")
				use_legacy_comments = false, -- Uses the legacy comment color from desert.vim for the "desert" style only (a bright sky blue)

				-- Text styling - disable individual styles if you like
				styles = {
					bold = true, -- Enable bold text (keywords, functions, etc.)
					italic = true, -- Enable italics (comments, certain keywords)
					underline = true, -- Enable underlined text (matching words)
					undercurl = true, -- Enable undercurl for diagnostics/spelling
					strikethrough = true, -- Enable strikethrough text (deprecations)
				},

				-- Display options
				transparent = false, -- Set to true for transparent backgrounds (bye bye theme backgrounds)
				terminal_colors = true, -- Apply Oasis colors to Neovim's built-in terminal

				palette_overrides = {}, -- Override colors in specific palettes
				highlight_overrides = {}, -- Override specific highlight groups
			})
			vim.cmd.colorscheme("oasis-mirage")
		end,
	},
}
