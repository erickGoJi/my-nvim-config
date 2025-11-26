# Neovim Configuration Project Documentation

## Project Overview

This is a comprehensive Neovim configuration built in Lua, featuring modern plugin management, LSP integration, custom UI components, and AI-powered code assistance through CopilotChat.

## Project Structure

```
.
├── init.lua                          # Main entry point
├── lazy-lock.json                    # Plugin version lock file
├── lua/
│   ├── CopilotChat/                  # Custom CopilotChat plugin
│   │   ├── actions.lua               # Chat action definitions
│   │   ├── config.lua                # Plugin configuration
│   │   ├── context.lua               # Context management for chat
│   │   ├── copilot.lua               # Copilot API integration
│   │   ├── debuginfo.lua             # Debug information utilities
│   │   ├── diff.lua                  # Diff handling utilities
│   │   ├── health.lua                # Health check implementation
│   │   ├── init.lua                  # Plugin initialization
│   │   ├── overlay.lua               # Overlay window management
│   │   ├── prompts.lua               # Predefined prompts
│   │   ├── select.lua                # Selection UI components
│   │   ├── spinner.lua               # Loading spinner animation
│   │   ├── tiktoken.lua              # Token counting utilities
│   │   ├── ui.lua                    # UI components
│   │   ├── utils.lua                 # Utility functions
│   │   └── windows.lua               # Window management
│   ├── config/                       # Core configuration modules
│   │   ├── autocmds.lua              # Auto commands
│   │   ├── keymaps.lua               # Global keybindings
│   │   └── options.lua               # Neovim options
│   └── plugins/                      # Plugin specifications
│       ├── ai.lua                    # AI-related plugins
│       ├── colorscheme.lua           # Color scheme configuration
│       ├── comment.lua               # Comment plugins
│       ├── completion.lua            # Autocompletion setup
│       ├── conform.lua               # Code formatting
│       ├── debug.lua                 # Debugging tools
│       ├── gitsigns.lua              # Git integration
│       ├── indent_line.lua           # Indentation guides
│       ├── init.lua                  # Plugin manager setup
│       ├── lazygit.lua               # LazyGit integration
│       ├── linting.lua               # Linting configuration
│       ├── lsp/                      # LSP configuration
│       │   ├── init.lua              # LSP setup entry point
│       │   ├── keymaps.lua           # LSP keybindings
│       │   └── servers.lua           # Language server configs
│       ├── lualine.lua               # Status line
│       ├── mini.lua                  # Mini.nvim plugins
│       ├── neo-tree.lua              # File explorer
│       ├── nvim-cmp.lua              # Completion engine (deprecated)
│       ├── telescope.lua             # Fuzzy finder
│       ├── todo-comments.lua         # TODO highlighting
│       ├── treesitter.lua            # Syntax parsing
│       ├── trouble.lua               # Diagnostics UI
│       ├── vim-sleuth.lua            # Auto-detect indentation
│       ├── which-key.lua             # Keybinding helper
│       └── zen-mode.lua              # Distraction-free mode
└── stylua.toml                       # Lua formatter configuration
```

---

## Core Files

### init.lua

**Purpose**: Main entry point for the Neovim configuration.

**Responsibilities**:

- Sets up the Lua module path
- Loads core configuration (options, keymaps, autocmds)
- Initializes the plugin manager (lazy.nvim)
- Bootstraps the entire configuration

---

## Configuration Modules (`lua/config/`)

### options.lua

**Purpose**: Global Neovim settings and options.

**Key Configurations**:

- Editor behavior (line numbers, mouse, clipboard)
- UI settings (signcolumn, colors, completion menu)
- Search options (incremental search, case sensitivity)
- File handling (backup, swap, undo)
- Split window behavior
- Scrolling and display preferences

### keymaps.lua

**Purpose**: Global keybinding definitions.

**Key Mappings**:

- Leader key set to Space
- Window navigation (Ctrl+hjkl)
- Buffer management
- Quick save/quit shortcuts
- Search and replace helpers
- Terminal mode escaping
- Custom convenience mappings

### autocmds.lua

**Purpose**: Automatic command definitions that trigger on specific events.

**Key Autocommands**:

- Highlight yanked text
- Auto-create directories on save
- Clean trailing whitespace
- Auto-resize splits on window resize
- FileType-specific configurations
- LSP-related autocommands

---

## Plugin Modules (`lua/plugins/`)

### init.lua

**Purpose**: Bootstrap and configure the lazy.nvim plugin manager.

**Responsibilities**:

- Install lazy.nvim if not present
- Configure lazy.nvim options
- Load all plugin specifications from the plugins directory
- Set up plugin update checking

### colorscheme.lua

**Purpose**: Color scheme configuration.

**Features**:

- Multiple theme support (Catppuccin, Tokyo Night, Gruvbox, etc.)
- Theme-specific configurations
- Transparent background options
- Syntax highlighting customization

### lsp/ (Language Server Protocol)

#### lsp/init.lua

**Purpose**: LSP setup and initialization.

**Features**:

- Mason integration for server management
- Automatic server installation
- LSP capabilities configuration
- Server-specific settings
- Diagnostic configuration
- UI customization (borders, signs)

#### lsp/servers.lua

**Purpose**: Individual language server configurations.

**Supported Languages**:

- Lua (lua_ls)
- Python (pyright)
- TypeScript/JavaScript (ts_ls)
- Go (gopls)
- Rust (rust_analyzer)
- And many more...

#### lsp/keymaps.lua

**Purpose**: LSP-specific keybindings.

**Key Mappings**:

- Go to definition/declaration/implementation
- Hover documentation
- Signature help
- Rename symbol
- Code actions
- References
- Diagnostics navigation

### completion.lua

**Purpose**: Autocompletion configuration using blink.cmp.

**Features**:

- Fuzzy matching completion
- Snippet support
- LSP source integration
- Buffer and path completion
- Ghost text preview
- Signature help integration
- Custom keybindings for completion menu

### nvim-cmp.lua

**Purpose**: Legacy completion configuration (deprecated, replaced by blink.cmp).

### telescope.lua

**Purpose**: Fuzzy finder and picker interface.

**Features**:

- File finding
- Live grep across project
- Buffer switching
- Git integration
- Diagnostics browser
- LSP symbol search
- Custom pickers

### treesitter.lua

**Purpose**: Advanced syntax parsing and highlighting.

**Features**:

- Syntax highlighting
- Code folding
- Incremental selection
- Context-aware comments
- Textobjects for code navigation
- Auto-installation of parsers

### neo-tree.lua

**Purpose**: File explorer sidebar.

**Features**:

- Tree-style file browser
- Git status integration
- File operations (create, delete, rename, move)
- Buffer list view
- Fuzzy finder integration
- Custom mappings

### lualine.lua

**Purpose**: Status line configuration.

**Features**:

- Mode indicator
- Git branch and diff stats
- Diagnostics summary
- File information
- LSP status
- Custom sections and themes

### gitsigns.lua

**Purpose**: Git integration and diff visualization.

**Features**:

- Inline git diff signs
- Hunk navigation
- Stage/unstage hunks
- Blame information
- Git status in statusline

### lazygit.lua

**Purpose**: LazyGit terminal UI integration.

**Features**:

- Full-featured Git UI in a floating window
- Keybinding to toggle LazyGit
- Terminal integration

### conform.lua

**Purpose**: Code formatting with multiple formatter support.

**Features**:

- Formatter configuration per filetype
- Format on save option
- Manual format command
- Support for prettier, stylua, black, etc.

### linting.lua

**Purpose**: Linting integration.

**Features**:

- Linter configuration per filetype
- Auto-linting on events (save, insert leave)
- Integration with diagnostics system
- Support for eslint, pylint, etc.

### which-key.lua

**Purpose**: Keybinding helper and documentation.

**Features**:

- Shows available keybindings in popup
- Grouped keybinding documentation
- Custom prefix grouping
- Visual feedback for incomplete key sequences

### trouble.lua

**Purpose**: Diagnostics and quickfix UI.

**Features**:

- Pretty list of diagnostics
- Quickfix integration
- LSP references viewer
- Jump to location
- Custom filtering

### indent_line.lua

**Purpose**: Visual indentation guides.

**Features**:

- Indentation level markers
- Scope highlighting
- Rainbow brackets
- Customizable characters

### todo-comments.lua

**Purpose**: Highlight and search TODO comments.

**Features**:

- Highlights TODO, FIXME, NOTE, etc.
- Search across project
- Custom keywords
- Telescope integration

### comment.lua

**Purpose**: Smart comment toggling.

**Features**:

- Line and block comments
- Language-aware commenting
- Visual mode support
- Treesitter integration

### mini.lua

**Purpose**: Collection of small, useful plugins from mini.nvim.

**Included Modules**:

- mini.ai: Enhanced text objects
- mini.surround: Surround operations
- mini.pairs: Auto-pair brackets
- And more...

### debug.lua

**Purpose**: DAP (Debug Adapter Protocol) configuration.

**Features**:

- Debugger integration
- Breakpoint management
- Debug UI
- Step through code
- Variable inspection

### zen-mode.lua

**Purpose**: Distraction-free writing mode.

**Features**:

- Center content
- Hide UI elements
- Focus on current buffer
- Twilight integration for dimming

### vim-sleuth.lua

**Purpose**: Automatic indentation detection.

**Features**:

- Detects tabs vs spaces
- Detects indentation width
- Per-buffer configuration

### ai.lua

**Purpose**: AI-powered coding assistance plugins.

**Features**:

- GitHub Copilot integration
- CopilotChat for AI pair programming
- Suggestion and completion

---

## CopilotChat Plugin (`lua/CopilotChat/`)

Custom implementation of an AI chat interface for Neovim.

### init.lua

**Purpose**: Main plugin initialization and public API.

**Features**:

- Plugin setup and configuration
- Command registration
- Main chat interface
- Public functions for external use

### config.lua

**Purpose**: Default configuration and settings.

**Configuration Options**:

- Model selection
- Temperature and API parameters
- Window layout options
- Prompt templates
- Keybindings
- Auto-insert mode settings

### actions.lua

**Purpose**: Predefined chat actions and workflows.

**Available Actions**:

- Explain code
- Review code
- Fix bugs
- Optimize code
- Generate docs
- Generate tests
- Commit message generation

### prompts.lua

**Purpose**: System and user prompt templates.

**Features**:

- Role definitions
- Context formatting
- Code block handling
- Project-aware prompts

### context.lua

**Purpose**: Manage context for chat conversations.

**Features**:

- Buffer content extraction
- Visual selection handling
- File reference management
- Diagnostic information
- Git diff integration
- LSP symbol information

### copilot.lua

**Purpose**: GitHub Copilot API client.

**Features**:

- Authentication
- API requests (chat, completions)
- Token management
- Model selection
- Streaming responses

### ui.lua

**Purpose**: Chat UI components and rendering.

**Features**:

- Chat window layout
- Message rendering
- Markdown formatting
- Code block highlighting
- Diff visualization
- Input handling

### windows.lua

**Purpose**: Window and buffer management.

**Features**:

- Split window creation
- Floating window creation
- Buffer lifecycle management
- Window state management
- Layout options (vertical, horizontal, float)

### overlay.lua

**Purpose**: Overlay window for inline suggestions.

**Features**:

- Floating overlay creation
- Positioning relative to cursor
- Temporary display
- Auto-dismiss

### select.lua

**Purpose**: Selection UI for choosing actions or options.

**Features**:

- Interactive menu
- Fuzzy filtering
- Keybinding navigation
- Custom formatting

### spinner.lua

**Purpose**: Loading animation during API requests.

**Features**:

- Animated spinner frames
- Status messages
- Timer-based updates
- Automatic cleanup

### tiktoken.lua

**Purpose**: Token counting for API usage.

**Features**:

- Estimate token count
- Model-specific encoding
- Context size management

### diff.lua

**Purpose**: Diff generation and application utilities.

**Features**:

- Generate unified diffs
- Parse diff format
- Apply changes to buffers
- Syntax highlighting for diffs

### utils.lua

**Purpose**: Shared utility functions.

**Features**:

- String manipulation
- Table operations
- File system helpers
- Vim API wrappers
- Logging utilities

### debuginfo.lua

**Purpose**: Debug information collection.

**Features**:

- System information
- Plugin versions
- Configuration dump
- Log access

### health.lua

**Purpose**: Health check integration.

**Features**:

- Dependency verification
- Configuration validation
- API connectivity check
- Diagnostic reporting

---

## Configuration Files

### stylua.toml

**Purpose**: Lua code formatter configuration.

**Settings**:

- Column width
- Line endings
- Indent type and width
- Quote style

### lazy-lock.json

**Purpose**: Plugin version lock file.

**Purpose**:

- Ensures consistent plugin versions
- Generated by lazy.nvim
- Should be committed to version control

---

## Key Features Summary

### 1. Modern Plugin Management

- Lazy loading for fast startup
- Automatic plugin updates
- Version locking

### 2. LSP Integration

- Multiple language support
- Auto-completion
- Diagnostics
- Code actions
- Formatting

### 3. AI-Powered Coding

- GitHub Copilot suggestions
- Interactive chat interface
- Code explanation and review
- Context-aware assistance

### 4. Git Integration

- Inline diff signs
- LazyGit UI
- Commit message generation
- Blame information

### 5. Fuzzy Finding

- File search
- Text search
- Buffer navigation
- Symbol search

### 6. Code Intelligence

- Treesitter parsing
- Semantic highlighting
- Smart text objects
- Code folding

### 7. Developer Experience

- Distraction-free mode
- Indentation guides
- TODO highlighting
- Comment toggling
- Auto-pairs

---

## Getting Started

1. **Installation**: Copy this configuration to `~/.config/nvim/`
2. **First Run**: Neovim will automatically install lazy.nvim and all plugins
3. **LSP Setup**: Run `:Mason` to install language servers
4. **Health Check**: Run `:checkhealth` to verify setup
5. **Learn Keybindings**: Press `<Space>` to see available commands with which-key

## Dependencies

- Neovim >= 0.9.0
- Git
- Node.js (for some LSP servers)
- ripgrep (for telescope grep)
- fd (for telescope file finding)
- A Nerd Font (for icons)
- GitHub Copilot subscription (for AI features)

---

## Customization

All configurations are modular and can be customized by editing the respective files in:

- `lua/config/` - Core settings
- `lua/plugins/` - Plugin configurations
- `lua/CopilotChat/config.lua` - AI chat settings

Each plugin module is self-contained and can be disabled by removing or commenting out the corresponding file.
