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
		local configTree = require("neo-tree")
		configTree.setup({
			filesystem = {
				filtered_items = {
                                        visible = true, -- Show hidden files
                                        hide_dotfiles = false, -- Do not hide files starting with `.`
                                        hide_gitignored = false, -- Show git-ignored files
				},
			},
		})
	end,
}
