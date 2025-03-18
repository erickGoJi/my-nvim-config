return {
  --{
  --	"catppuccin/nvim",
  --	lazy = false,
  --	name = "catppuccin",
  --	priority = 1000,
  --	enabled = false,
  --	config = function()
  --		require("catppuccin").setup({
  --			flavour = "macchiato", -- Cambia entre latte, frappe, macchiato, mocha
  --		})
  --		vim.cmd.colorscheme("catppuccin")
  --	end,
  --},
  {
    "yorumicolors/yorumi.nvim",
    lazy = false,
    name = "yorumi",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("yorumi")
    end,
  },
}
