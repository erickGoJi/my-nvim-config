return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		enabled = false,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- Cambia entre latte, frappe, macchiato, mocha
			})
			-- vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"yorumicolors/yorumi.nvim",
		lazy = false,
		name = "yorumi",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("yorumi")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.g.tokyonight_style = "storm"
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
