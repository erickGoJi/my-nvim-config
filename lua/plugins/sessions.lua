return {
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "info",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "~/fork" },
				auto_session_enable_last_session = true,
				auto_save_enabled = true,
				auto_restore_enabled = true,
				session_lens = {
					buftype_filter = {},
					load_on_setup = true,
					theme_conf = { border = true },
					previewer = false,
				},
				vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Save Session" }),
				vim.keymap.set(
					"n",
					"leader>ls",
					require("auto-session.session-lens").search_session,
					{ noremap = true, silent = true, desc = "Search Sessions" }
				),
			})
		end,
	},
}
