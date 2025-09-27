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
        goimport = "gopls",    -- can be "gopls", "goimports", "goimport", "gofumpt"
        gofmt = "gofumpt",     -- can be "gofumpt", "goimports", "gofmt"
        max_line_len = 120,    -- max line length in golang source code
        tag_transform = false, -- tag transform function
        verbose = false,       -- verbose output
      })
    end,
  },
  {
    "rafaelsq/nvim-goc.lua",
    ft = "go",
    config = function()
      local goc = require("nvim-goc").setup({
        vertivalSplit = false,                                                 -- open in vertical split
      })
      vim.keymap.set("n", "<Leader>gcf", goc.Coverage, { silent = true })      -- run for the whole File
      vim.keymap.set("n", "<Leader>gct", goc.CoverageFunc, { silent = true })  -- run only for a specific Test unit
      vim.keymap.set("n", "<Leader>gcc", goc.ClearCoverage, { silent = true }) -- clear coverage highlights

      vim.keymap.set("n", "]a", goc.Alternate, { silent = true })
      vim.keymap.set("n", "[a", goc.AlternateSplit, { silent = true }) -- set verticalSplit=true for vertical

      cf = function(testCurrentFunction)
        local cb = function(path, index)
          if path then
            -- `xdg-open|open` command performs the same function as double-clicking on the file.
            -- change from `xdg-open` to `open` on MacOSx
            vim.cmd(':silent exec "!xdg-open file://' .. path .. "\\\\#file" .. index .. '"')
          end
        end

        if testCurrentFunction then
          goc.CoverageFunc(nil, cb, 0)
        else
          goc.Coverage(nil, cb)
        end
      end

      -- If you want to open it in your browser, you can use the commands below.
      -- You need to create a callback function to configure which command to use to open the HTML.
      -- On Linux, `xdg-open` is generally used, on MacOSx it's just `open`.
      vim.keymap.set("n", "<leader>gca", cf, { silent = true })
      vim.keymap.set("n", "<Leader>gcb", function()
        cf(true)
      end, { silent = true })

      -- default colors
      -- vim.api.nvim_set_hl(0, 'GocNormal', {link='Comment'})
      -- vim.api.nvim_set_hl(0, 'GocCovered', {link='String'})
      -- vim.api.nvim_set_hl(0, 'GocUncovered', {link='Error'})
    end,
  },
}
