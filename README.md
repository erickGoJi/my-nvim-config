# my-nvim-config

This is my personal neovim configuration. It is a work in progress and is subject to change.

## Prerequisites

1. [Neovim](https://neovim.io/)
2. [Python](https://www.python.org/)
3. [Node.js](https://nodejs.org/)
4. [Go](https://golang.org/)

## Installation

1. Clone the repository to your home directory:
```bash
git clone https://github.com/erickGoJi/my-nvim-config.git ~/.config/nvim
```
2. Open neovim and run the following command:
```vim
:source %
```
3. Setup copilot by running the following command, but you need to verify that your node.js path is correct in lua/plugins/copilot.lua  for the setup to work:
```vim
:Copilot setup
```

## Plugins

1. Alpha
2. Catppuccino
3. Completion-nvim
4. Copilot
5. Lsp 
6. Lualine
7. Neo-tree
8. none-ls
9. Telescope
10. Treesitter


## Testing

Run the test suite with:
```bash
nvim --headless -c "PlenaryBustedDirectory tests { minimal_init = 'tests/minimal_init.lua' }"
```
