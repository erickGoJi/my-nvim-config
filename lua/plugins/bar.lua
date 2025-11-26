return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"lewis6991/gitsigns.nvim",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		config = function()
			require("barbar").setup({
				-- Add your options here
				animation = true,
				sidebar_filetypes = {
					NvimTree = true,
					-- Add other filetypes here
					["neo-tree"] = { event = "BufWipeout" },
				},
			})
			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }

			-- Navegar buffers
			map("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
			map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)

			-- Mover buffer a la izquierda o derecha
			map("n", "<A-Left>", "<Cmd>BufferMovePrevious<CR>", opts)
			map("n", "<A-Right>", "<Cmd>BufferMoveNext<CR>", opts)

			-- Cerrar buffer actual
			map("n", "<leader>c", "<Cmd>BufferClose<CR>", opts)
		end,
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
}
