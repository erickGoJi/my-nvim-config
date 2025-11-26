# My Neovim Configuration

## 📖 Project Purpose

This is a personal Neovim configuration designed for modern software development with a focus on:
- **Multi-language support**: Go, TypeScript, Python, Lua, and more
- **AI-powered assistance**: GitHub Copilot integration for intelligent code suggestions and chat
- **Developer productivity**: LSP, autocompletion, fuzzy finding, and debugging tools
- **Clean and minimal setup**: Easy to install and customize for your needs

## 🏗️ Project Structure

```
.
├── init.lua                    # Main entry point - bootstraps lazy.nvim
├── lazy-lock.json              # Plugin version lock file (managed by lazy.nvim)
├── lua/
│   ├── vim-options.lua         # Core Neovim settings and keymaps
│   ├── plugins.lua             # Empty plugin registry
│   └── plugins/                # Individual plugin configurations
│       ├── alpha.lua           # Start screen/dashboard
│       ├── bar.lua             # Status bar configuration
│       ├── comments.lua        # Smart commenting
│       ├── completions.lua     # Autocompletion engine
│       ├── copilot.lua         # GitHub Copilot integration
│       ├── debugging.lua       # DAP debugging configuration
│       ├── git.lua             # Git integration (gitsigns)
│       ├── go.lua              # Go-specific tooling
│       ├── helpview.lua        # Enhanced help documentation
│       ├── lsp-config.lua      # LSP server configurations
│       ├── lualine.lua         # Status line
│       ├── neo-tree.lua        # File explorer
│       ├── none-ls.lua         # Formatting and linting
│       ├── sessions.lua        # Session management
│       ├── sonarq.lua          # Code quality tools
│       ├── telescope.lua       # Fuzzy finder
│       ├── themes.lua          # Color schemes
│       └── treesitter.lua      # Syntax parsing and highlighting
├── script/
│   └── install.sh              # Automated installation script
└── tests/                      # Test suite
    ├── install_script_spec.lua
    ├── minimal_init.lua
    └── vim_options_spec.lua
```

## ✨ Key Features

### 🎯 Core Functionality
- **Modern Plugin Management**: Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for fast, lazy-loading plugin management
- **LSP Integration**: Multiple language server support via Mason, including:
  - Lua (lua_ls)
  - Go (gopls)
  - TypeScript/JavaScript (ts_ls)
  - Python (pyright + ruff)
  - Docker (dockerls)
  - Erlang (erlangls)
  - Bash (bashls)
  - YAML (yamlls)
- **Intelligent Autocompletion**: LSP-powered completion with nvim-cmp
- **Fuzzy Finding**: File and text search with Telescope
- **File Explorer**: Neo-tree for intuitive file navigation

### 🤖 AI-Powered Development
- **GitHub Copilot**: Real-time code suggestions across all supported languages
- **CopilotChat**: Interactive AI pair programming with:
  - Claude Sonnet 4.5 model support
  - Floating chat window
  - Context-aware assistance
  - Customizable keybindings

### 🎨 Developer Experience
- **Syntax Highlighting**: Advanced parsing with Treesitter
- **Git Integration**: In-editor git status and diff visualization
- **Debugging**: DAP support for interactive debugging
- **Start Dashboard**: Beautiful alpha dashboard on startup
- **Status Line**: Informative lualine statusbar
- **Code Formatting**: Automatic formatting with none-ls
- **Smart Comments**: Toggle comments with context awareness
- **Session Management**: Persist and restore workspace sessions

### ⚙️ Configuration Highlights
- **Leader Key**: Space (` `)
- **Line Numbers**: Enabled
- **Clipboard**: System clipboard integration
- **Indentation**: 2 spaces, with visual guides for tabs/spaces
- **Auto-save**: `<leader>w` for quick saves
- **Diagnostics**: Automatic floating diagnostic window on hover

---

## 🚀 Setup from Scratch

### Prerequisites

Before installing, ensure you have the following installed:

#### Required
- **Neovim** >= 0.8.0
  - Ubuntu/Debian: `sudo apt install neovim`
  - macOS: `brew install neovim`
  - Arch: `sudo pacman -S neovim`
  - From source: [Neovim Installation Guide](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- **Git**
  - Ubuntu/Debian: `sudo apt install git`
  - macOS: `brew install git`
  - Arch: `sudo pacman -S git`

#### Recommended (for full functionality)
- **Node.js** (v16+) - Required for Copilot and many LSP servers
  - Ubuntu/Debian: Use [NodeSource](https://github.com/nodesource/distributions)
  - macOS: `brew install node`
  - Using nvm: `nvm install --lts`
- **Python 3** - For Python development and some plugins
- **Go** - For Go development features
- **ripgrep** - For Telescope text search
  - `sudo apt install ripgrep` (Ubuntu/Debian)
  - `brew install ripgrep` (macOS)
- **fd** - For faster file finding
  - `sudo apt install fd-find` (Ubuntu/Debian)
  - `brew install fd` (macOS)
- **A Nerd Font** - For icons in UI
  - Download from [Nerd Fonts](https://www.nerdfonts.com/)
  - Recommended: JetBrainsMono Nerd Font, FiraCode Nerd Font

### Installation Methods

#### Method 1: Automated Installation (Recommended)

The repository includes an automated installation script that handles prerequisites, backups, and setup:

```bash
# Clone the repository
git clone https://github.com/erickGoJi/my-nvim-config.git
cd my-nvim-config

# Run the installation script
bash script/install.sh
```

The script will:
1. ✅ Check for Neovim and required dependencies
2. 💾 Backup your existing Neovim configuration (if any)
3. 📂 Install the configuration to `~/.config/nvim`
4. 📦 Bootstrap lazy.nvim and install plugins
5. 🔧 Set up GitHub Copilot integration

#### Method 2: Manual Installation

```bash
# Backup existing configuration (if any)
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)

# Clone this repository to your Neovim config directory
git clone https://github.com/erickGoJi/my-nvim-config.git ~/.config/nvim

# Start Neovim - it will automatically install lazy.nvim and all plugins
nvim
```

### Post-Installation Setup

1. **First Launch**
   ```bash
   nvim
   ```
   - Wait for lazy.nvim to install all plugins (this may take a few minutes)
   - Press `q` to close the lazy.nvim window once installation completes

2. **Install Language Servers**
   ```vim
   :Mason
   ```
   - Mason will open - press `i` to install language servers
   - Or use `:MasonInstall <server-name>` to install specific servers

3. **Configure GitHub Copilot** (if you have a subscription)
   ```vim
   :Copilot setup
   ```
   - Follow the authentication prompts
   - **Important**: Update the Node.js path in `lua/plugins/copilot.lua` if needed:
     ```lua
     -- Find your Node.js path
     which node  # or: whereis node
     
     -- Edit lua/plugins/copilot.lua and update:
     vim.g.copilot_node_command = "/path/to/your/node"
     ```

4. **Verify Installation**
   ```vim
   :checkhealth
   ```
   - Review any warnings or errors
   - Install missing dependencies as recommended

5. **Test Key Features**
   - Press `Space` (leader key) to see available commands
   - Try `:Telescope find_files` to search files
   - Open a code file and test LSP features (hover, go-to-definition)
   - Test Copilot suggestions by typing code

### Configuration Customization

All configurations are modular and easy to customize:

#### Core Settings (`lua/vim-options.lua`)
```lua
vim.cmd("set number")           -- Line numbers
vim.cmd("set expandtab")        -- Use spaces instead of tabs
vim.cmd("set tabstop=2")        -- Tab width
vim.g.mapleader = " "           -- Leader key (Space)
vim.cmd("set clipboard=unnamedplus")  -- System clipboard
```

#### Plugin Configurations (`lua/plugins/`)
Each plugin has its own configuration file. To customize or disable a plugin:
- Edit the corresponding file in `lua/plugins/`
- To disable a plugin, comment out or delete its file
- Changes take effect after restart or `:Lazy reload`

#### Customizing Copilot
Edit `lua/plugins/copilot.lua` to:
- Change the AI model (Claude, GPT-4, GPT-3.5)
- Adjust temperature and token limits
- Modify window layout and appearance
- Enable/disable for specific file types

---

## 📖 Usage Guide

### Essential Keybindings

**General**
- `<leader>w` - Quick save
- `<leader>y` (visual) - Copy to system clipboard
- `<leader>p` - Paste from system clipboard

**Copilot**
- `<Shift-Tab>` (insert mode) - Accept Copilot suggestion
- `cp` - Open Copilot panel

**CopilotChat**
- Commands available via `:CopilotChat`

**File Navigation**
- `<leader>ff` - Find files (requires Telescope)
- `<leader>fg` - Live grep search (requires Telescope)
- File explorer commands available via Neo-tree

### Running Tests

This configuration includes a test suite using [plenary.nvim](https://github.com/nvim-lua/plenary.nvim):

```bash
# Run all tests
nvim --headless -c "PlenaryBustedDirectory tests { minimal_init = 'tests/minimal_init.lua' }"

# Or use the install script's recommendation:
cd ~/.config/nvim
nvim --headless -c "PlenaryBustedDirectory tests { minimal_init = 'tests/minimal_init.lua' }"
```

---

## 🔧 Troubleshooting

### Plugins not loading
```vim
:Lazy sync     " Sync plugins
:Lazy clean    " Remove unused plugins
:Lazy restore  " Restore from lockfile
```

### LSP not working
```vim
:Mason         " Check installed servers
:LspInfo       " Check active LSP clients
:checkhealth   " Full system check
```

### Copilot issues
1. Verify Node.js path in `lua/plugins/copilot.lua`
2. Check Node.js version: `node --version` (should be v16+)
3. Re-authenticate: `:Copilot setup`
4. Check Copilot status: `:Copilot status`

### Performance issues
- Check startup time: `nvim --startuptime startup.log`
- Review lazy-loading configuration in plugin files
- Consider disabling heavy plugins you don't use

### Common errors
- **"lazy.nvim not found"**: Delete `~/.local/share/nvim` and restart Neovim
- **"Mason servers failing"**: Ensure you have internet connection and required build tools
- **"Telescope not finding files"**: Install `ripgrep` and `fd`

---

## 🤝 Contributing

This is a personal configuration, but suggestions and improvements are welcome:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

---

## 📝 License

This configuration is provided as-is for personal use. Feel free to fork, modify, and customize for your own needs.
