return {
	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {
			theme_conf = { border = true },
			previewer = false,
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "~/fork" },
		},
		keys = {
			-- Will use Telescope if installed or a vim.ui.select picker otherwise
			{ "<leader>wr", "<cmd>AutoSession search<CR>", desc = "Session search" },
			{ "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session" },
			{ "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
		},
		config = function()
			require("auto-session").setup({})
		end,
	},
}
