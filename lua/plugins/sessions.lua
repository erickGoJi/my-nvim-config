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
			})
		end,
	},
}
