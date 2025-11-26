# Neovim Configuration Mappings

This document provides a comprehensive reference of all key mappings configured in this Neovim setup.

## Leader Key

The leader key is set to **Space** (` `).

```lua
vim.g.mapleader = " "
```

---

## General Mappings

### File Operations

| Mode | Mapping | Action | Description |
|------|---------|--------|-------------|
| Normal | `<leader>w` | `:w<CR>` | Quick save current file |

### Clipboard Operations

| Mode | Mapping | Action | Description |
|------|---------|--------|-------------|
| Visual | `<leader>y` | `"+y` | Copy (yank) selection to system clipboard |
| Normal | `<leader>p` | `"+yy` | Copy (yank) current line to system clipboard |

> **Important Note**: Despite using 'p' in the mapping (which typically means paste in Vim), `<leader>p` is configured to **copy** (yank) the current line to the system clipboard, not paste. This is an unconventional choice in this configuration.
>
> For **pasting** from system clipboard:
> - Use the standard `p` or `P` keys in Normal mode (works due to `clipboard=unnamedplus`)
> - Or use `"+p` explicitly to paste from system clipboard
>
> System clipboard integration is enabled with `set clipboard=unnamedplus`, allowing seamless copy/paste between Neovim and the system.

---

## Telescope (Fuzzy Finder)

Telescope provides powerful fuzzy finding capabilities for files, text, and more.

| Mode | Mapping | Action | Description |
|------|---------|--------|-------------|
| Normal | `<C-p>` | Find files | Open file finder |
| Normal | `<leader>fg` | Live grep | Search text across all files |
| Normal | `<leader>fs` | Grep string | Search word under cursor |
| Normal | `<C-f>` | Current buffer fuzzy find | Search within current file (Note: also used in Insert mode for completion docs - see Completion section) |
| Normal | `<leader>fi` | Live grep with args | Advanced grep with arguments |

**Configuration file**: `lua/plugins/telescope.lua`

---

## Neo-tree (File Explorer)

Neo-tree is the file explorer with git integration and buffer management.

### Basic Navigation

| Mode | Mapping | Action | Description |
|------|---------|--------|-------------|
| Normal | `<C-n>` | `:Neotree filesystem reveal left<CR>` | Toggle file explorer on left side |
| Normal | `<leader>bf` | `:Neotree buffers reveal float<CR>` | Show open buffers in floating window |
| Normal | `<leader>bg` | `:Neotree git_status float<CR>` | Show git status in floating window |

### Git Status Window Mappings

When in the Neo-tree git status window, the following mappings are available:

| Mapping | Action | Description |
|---------|--------|-------------|
| `A` | `git_add_all` | Stage all changes |
| `gu` | `git_unstage_file` | Unstage file |
| `ga` | `git_add_file` | Stage current file |
| `gr` | `git_revert_file` | Revert file changes |
| `gc` | `git_commit` | Commit staged changes |
| `gp` | `git_push` | Push commits |
| `gg` | `git_commit_and_push` | Commit and push in one action |

**Configuration file**: `lua/plugins/neo-tree.lua`

---

## GitHub Copilot

AI-powered code completion and assistance.

### Copilot Suggestions

| Mode | Mapping | Action | Description |
|------|---------|--------|-------------|
| Insert | `<S-Tab>` | Accept suggestion | Accept Copilot's code suggestion |
| Normal | `cp` | `vim.cmd("Copilot panel")` | Open Copilot panel |

### Copilot Chat

CopilotChat provides an interactive AI assistant for code help, explanations, and refactoring.

**Access via commands**:
- `:CopilotChat` - Start a chat session
- `:CopilotChatOpen` - Open chat window
- `:CopilotChatClose` - Close chat window
- `:CopilotChatToggle` - Toggle chat window
- `:CopilotChatReset` - Reset chat history

**Configuration file**: `lua/plugins/copilot.lua`

---

## LSP (Language Server Protocol)

LSP keybindings are automatically set up by the nvim-lspconfig plugin. Common LSP actions include:

| Mode | Mapping | Action | Description |
|------|---------|--------|-------------|
| Normal | `K` | Hover documentation | Show documentation for symbol under cursor |
| Normal | `gd` | Go to definition | Jump to definition |
| Normal | `gD` | Go to declaration | Jump to declaration |
| Normal | `gi` | Go to implementation | Jump to implementation |
| Normal | `gr` | References | Show all references |
| Normal | `<leader>rn` | Rename | Rename symbol |
| Normal | `<leader>ca` | Code action | Show available code actions |

> **Note**: These are default LSP mappings provided by nvim-lspconfig. Custom mappings may vary based on your specific setup.

**Configuration file**: `lua/plugins/lsp-config.lua`

---

## Debugging (DAP)

Debug Adapter Protocol support for interactive debugging.

| Mode | Mapping | Action | Description |
|------|---------|--------|-------------|
| Normal | `<leader>dt` | Toggle breakpoint | Add/remove breakpoint at current line |
| Normal | `<leader>dc` | Continue | Continue execution |
| Normal | `<leader>do` | Step over | Step over current line |
| Normal | `<leader>di` | Step into | Step into function |
| Normal | `<leader>du` | Step out | Step out of function |
| Normal | `<leader>dr` | Toggle REPL | Open/close debug REPL |
| Normal | `<leader>dl` | Run last | Re-run last debug configuration |
| Normal | `<leader>de` | Toggle UI | Show/hide debug UI |

**Configuration file**: `lua/plugins/debugging.lua`

---

## Completion (nvim-cmp)

Autocompletion mappings within the completion menu.

| Mode | Mapping | Action | Description |
|------|---------|--------|-------------|
| Insert | `<C-b>` | Scroll docs up | Scroll documentation window up |
| Insert | `<C-f>` | Scroll docs down | Scroll documentation window down (Note: `<C-f>` in Normal mode is for Telescope fuzzy find) |
| Insert | `<C-Space>` | Trigger completion | Manually trigger completion menu |
| Insert | `<C-e>` | Abort | Close completion menu |
| Insert | `<CR>` | Confirm | Confirm selected completion item |

**Configuration file**: `lua/plugins/completions.lua`

---

## Comments

Smart commenting powered by Comment.nvim.

### Normal Mode

| Mapping | Action | Description |
|---------|--------|-------------|
| `gcc` | Toggle line comment | Comment/uncomment current line |
| `gbc` | Toggle block comment | Block comment current line |
| `[count]gcc` | Toggle multiple lines | Comment/uncomment multiple lines |
| `[count]gbc` | Toggle block on lines | Block comment multiple lines |
| `gc{motion}` | Comment with motion | Comment using motion (e.g., `gcap` for paragraph) |
| `gb{motion}` | Block comment with motion | Block comment using motion |

### Visual Mode

| Mapping | Action | Description |
|---------|--------|-------------|
| `gc` | Toggle line comment | Comment/uncomment selection |
| `gb` | Toggle block comment | Block comment selection |

**Configuration file**: `lua/plugins/comments.lua`

---

## Additional Features

### Diagnostics

Diagnostics are automatically displayed when the cursor is held over an issue:

- **CursorHold** event triggers a floating diagnostic window
- Shows source of diagnostic when multiple sources are available
- Non-focusable to avoid interrupting workflow

**Configuration file**: `lua/vim-options.lua`

---

## Mason (LSP/DAP/Linter Installer)

Mason provides an interactive UI for installing and managing language servers, formatters, and linters.

**Commands**:
- `:Mason` - Open Mason UI
- `:MasonInstall <package>` - Install a package
- `:MasonUninstall <package>` - Uninstall a package
- `:MasonUpdate` - Update all packages

**Configuration file**: `lua/plugins/lsp-config.lua`

---

## Customization

All mappings are defined in their respective plugin configuration files under `lua/plugins/`. To customize a mapping:

1. Open the relevant plugin file (e.g., `lua/plugins/telescope.lua`)
2. Modify the `vim.keymap.set()` call
3. Restart Neovim or run `:source %` to reload the configuration

### Example: Change File Finder Mapping

```lua
-- In lua/plugins/telescope.lua
-- Change from <C-p> to <leader>ff
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
```

---

## Tips

1. **Discover more mappings**: Run `:map` to see all active mappings
2. **Plugin-specific help**: Use `:help <plugin-name>` for detailed documentation
3. **Leader key timeout**: Adjust `timeoutlen` in `vim-options.lua` if you need more time to complete leader sequences
4. **Check conflicts**: Use `:verbose map <key>` to see where a mapping is defined

---

## Quick Reference Card

### Most Frequently Used

| Mapping | Action |
|---------|--------|
| `<leader>w` | Save file |
| `<C-p>` | Find files |
| `<C-n>` | Toggle file tree |
| `<leader>fg` | Search in files |
| `<leader>dt` | Toggle breakpoint |
| `gcc` | Toggle comment |
| `<S-Tab>` | Accept Copilot (insert mode) |

---

**Last Updated**: 2025-11-26
