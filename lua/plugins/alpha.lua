return {
	{
		"princejoogie/chafa.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"m00qek/baleia.nvim",
		},
	},
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                     ",
			}

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", ":enew<CR>"),
				dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
				dashboard.button("h", "  Recently opened files", ":Telescope oldfiles<CR>"),
				dashboard.button("b", "  Find buffer", ":Telescope buffers<CR>"),
				dashboard.button("p", "  Find project", ":Telescope project<CR>"),
				dashboard.button("q", "  Quit", ":qa<CR>"),
			}

			alpha.setup(dashboard.opts)
		end,
	},
}
