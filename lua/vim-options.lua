vim.cmd("set number")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+yy')
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.cmd("set list")
vim.cmd("set listchars=tab:»·,trail:·,space:·,nbsp:␣")
vim.cmd("set clipboard=unnamedplus")
vim.g.mapleader = " "
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
  end,
})
