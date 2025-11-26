return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
		vim.keymap.set("n", "<leader>bg", ":Neotree git_status float<CR>", {})
		local configTree = require("neo-tree")
		configTree.setup({
			filesystem = {
				filtered_items = {
					visible = true, -- Show hidden files
					hide_dotfiles = false, -- Do not hide files starting with `.`
					hide_gitignored = false, -- Show git-ignored files
					never_show_by_pattern = {
						".null_ls_*",
						"node_modules",
					}, -- Do not hide any files by pattern
				},
			},
			default_component_configs = {
				git_status = {
					symbols = {
						-- Change type
						added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "➜", -- this can only be used in the git_status source
						-- Status type
						untracked = "★",
						ignored = "◌",
						unstaged = "✗",
						staged = "✓",
						conflict = "",
					},
				},
			},
			git_status = {
				window = {
					position = "float",
					mappings = {
						["A"] = "git_add_all",
						["gu"] = "git_unstage_file",
						["ga"] = "git_add_file",
						["gr"] = "git_revert_file",
						["gc"] = "git_commit",
						["gp"] = "git_push",
						["gg"] = "git_commit_and_push",
						["o"] = {
							"show_help",
							nowait = false,
							config = {
								title = "Order by",
								prefix_key = "o",
							},
						},
					},
				},
			},
		})
	end,
}
