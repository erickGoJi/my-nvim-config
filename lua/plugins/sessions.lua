return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "~/fork" },
        session_lens = {
          buftypes_to_ignore = {},
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
        vim.keymap.set("n", "<Leader>ss", "<cmd>SessionSave<cr>", { desc = "Save Session" }),
        vim.keymap.set(
          "n",
          "<Leader>ls",
          require("auto-session.session-lens").search_session,
          { noremap = true, silent = true, desc = "Search Sessions" }
        ),
      })
    end,
  },
}
