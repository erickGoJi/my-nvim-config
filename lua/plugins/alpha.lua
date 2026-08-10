return {
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			{
				"nhattVim/alpha-ascii.nvim",
				opts = {
					header = "Izutsumi",
					user_path = vim.fn.expand("~/.config/nvim/ascii"),
				},
			},
		},

		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", ":enew<CR>"),
				dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
				dashboard.button("h", "  Recently opened files", ":Telescope oldfiles<CR>"),
				dashboard.button("b", "  Find buffer", ":Telescope buffers<CR>"),
				dashboard.button("p", "  Find project", ":Telescope project<CR>"),
				dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
				dashboard.button("c", "𝌡 Change header image", ":AlphaAsciiNext<CR>"),
				dashboard.button("q", "  Quit", ":qa<CR>"),
			}

			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					dashboard.section.footer.val = {
						" ",
						" Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins  in " .. ms .. " ms ",
					}
					pcall(vim.cmd.AlphaRedraw)
				end,
			})

			alpha.setup(dashboard.opts)
		end,
	},
}
