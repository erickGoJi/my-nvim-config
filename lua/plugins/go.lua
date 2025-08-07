return {
  {
    "olexsmir/gopher.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = "go",
    -- branch = "develop"
    -- (optional) will update plugin's deps on every update
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    ---@type gopher.Config
    opts = {},
    config = function()
      require("gopher").setup({
        goimport = "gopls", -- can be "gopls", "goimports", "goimport", "gofumpt"
        gofmt = "gofumpt", -- can be "gofumpt", "goimports", "gofmt"
        max_line_len = 120, -- max line length in golang source code
        tag_transform = false, -- tag transform function
        verbose = false,   -- verbose output
      })
    end,
  },
}
