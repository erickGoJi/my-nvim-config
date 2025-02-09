return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- Cambia entre latte, frappe, macchiato, mocha
    })
    vim.cmd.colorscheme "catppuccin"
  end,
}
