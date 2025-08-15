return {
  {
    url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    config = function()
      require("sonarlint").setup({
        server = {
          cmd = {
            "sonarlint-language-server",
            "--stdio",
            "--analyzers",
            -- PATH where is all the sonar analyzers /Users/erickeduardogomezjimenez/projects/sonar/extension/analyzers
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpyhton.jar"),
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonargo.jar"),
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarhtml.jar"),
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonariac.jar"),
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
          },
        },
        filetypes = {
          "python",
          "go",
          "html",
          "js",
          "tp",
        },
      })
    end,
  },
}
