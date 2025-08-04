#!/bin/bash

# Neovim Configuration Installation Script
# This script sets up the my-nvim-config environment

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
REPO_URL="https://github.com/erickGoJi/my-nvim-config.git"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"

# Helper functions
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

check_command() {
    if command -v "$1" &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Check if Neovim is installed
check_neovim() {
    print_info "Checking for Neovim installation..."
    
    if check_command nvim; then
        NVIM_VERSION=$(nvim --version | head -n1)
        print_success "Neovim found: $NVIM_VERSION"
        
        # Check if it's version 0.8+ (required for lazy.nvim)
        NVIM_VER_NUM=$(nvim --version | head -n1 | grep -oE 'v[0-9]+\.[0-9]+' | sed 's/v//' | tr -d '.')
        if [ "$NVIM_VER_NUM" -lt 80 ]; then
            print_error "Neovim version 0.8+ is required. Please update Neovim."
            exit 1
        fi
    else
        print_error "Neovim is not installed or not in PATH"
        print_info "Please install Neovim from: https://neovim.io/"
        print_info "For Ubuntu/Debian: sudo apt install neovim"
        print_info "For macOS: brew install neovim"
        print_info "For other systems, visit: https://github.com/neovim/neovim/releases"
        exit 1
    fi
}

# Check prerequisites
check_prerequisites() {
    print_info "Checking prerequisites..."
    
    local missing_deps=()
    
    # Check Python
    if check_command python3; then
        PYTHON_VERSION=$(python3 --version)
        print_success "Python found: $PYTHON_VERSION"
    else
        print_warning "Python3 not found - some plugins may not work correctly"
        missing_deps+=("python3")
    fi
    
    # Check Node.js
    if check_command node; then
        NODE_VERSION=$(node --version)
        print_success "Node.js found: $NODE_VERSION"
    else
        print_warning "Node.js not found - Copilot and some LSP servers may not work"
        missing_deps+=("nodejs")
    fi
    
    # Check Go
    if check_command go; then
        GO_VERSION=$(go version)
        print_success "Go found: $GO_VERSION"
    else
        print_warning "Go not found - Go development features may not work"
        missing_deps+=("go")
    fi
    
    # Check Git
    if check_command git; then
        GIT_VERSION=$(git --version)
        print_success "Git found: $GIT_VERSION"
    else
        print_error "Git is required but not found"
        missing_deps+=("git")
    fi
    
    if [ ${#missing_deps[@]} -gt 0 ]; then
        print_warning "Missing dependencies: ${missing_deps[*]}"
        print_info "While Neovim will work, some features may be limited without these dependencies."
        
        if [[ " ${missing_deps[*]} " =~ " git " ]]; then
            print_error "Git is required for installation. Please install git first."
            exit 1
        fi
        
        read -p "Continue anyway? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_info "Installation cancelled. Please install missing dependencies and try again."
            exit 1
        fi
    fi
}

# Backup existing configuration
backup_existing_config() {
    if [ -d "$NVIM_CONFIG_DIR" ]; then
        print_warning "Existing Neovim configuration found at $NVIM_CONFIG_DIR"
        read -p "Do you want to backup and replace it? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            print_info "Creating backup at $BACKUP_DIR"
            mv "$NVIM_CONFIG_DIR" "$BACKUP_DIR"
            print_success "Backup created successfully"
        else
            print_error "Installation cancelled to preserve existing configuration"
            exit 1
        fi
    fi
}

# Clone or update repository
setup_config() {
    print_info "Setting up Neovim configuration..."
    
    # Create config directory
    mkdir -p "$(dirname "$NVIM_CONFIG_DIR")"
    
    # Check if we're already in the repo directory
    if [ -f "$(pwd)/init.lua" ] && [ -d "$(pwd)/.git" ]; then
        CURRENT_REMOTE=$(git remote get-url origin 2>/dev/null || echo "")
        if [[ "$CURRENT_REMOTE" == *"my-nvim-config"* ]]; then
            print_info "Already in the repository directory. Copying configuration..."
            cp -r "$(pwd)" "$NVIM_CONFIG_DIR"
            print_success "Configuration copied from current directory"
            return
        fi
    fi
    
    # Clone the repository
    print_info "Cloning repository from $REPO_URL"
    if git clone "$REPO_URL" "$NVIM_CONFIG_DIR"; then
        print_success "Repository cloned successfully"
    else
        print_error "Failed to clone repository"
        exit 1
    fi
}

# Install plugins
install_plugins() {
    print_info "Installing plugins with lazy.nvim..."
    print_info "This may take a few minutes on first installation..."
    
    # lazy.nvim will auto-install on first run, but we can trigger sync
    if nvim --headless -c "lua require('lazy').sync()" -c "qa" 2>/dev/null; then
        print_success "Plugins installed successfully"
    else
        print_warning "Plugin installation completed (some warnings may be normal on first run)"
    fi
}

# Setup copilot if available
setup_copilot() {
    if check_command node; then
        print_info "Node.js detected. You can set up GitHub Copilot later by running:"
        print_info "  :Copilot setup"
        print_info "Make sure to verify the Node.js path in lua/plugins/copilot.lua"
    fi
}

# Main installation function
main() {
    print_info "Starting Neovim configuration installation..."
    echo
    
    check_neovim
    echo
    
    check_prerequisites
    echo
    
    backup_existing_config
    echo
    
    setup_config
    echo
    
    install_plugins
    echo
    
    setup_copilot
    echo
    
    print_success "Installation completed successfully!"
    print_info "You can now start Neovim with: nvim"
    print_info "The configuration will finish setting up on first launch."
    
    if [ -d "$BACKUP_DIR" ]; then
        print_info "Your previous configuration was backed up to: $BACKUP_DIR"
    fi
    
    echo
    print_info "Next steps:"
    print_info "1. Start Neovim: nvim"
    print_info "2. Wait for plugins to finish installing"
    print_info "3. If using Copilot, run: :Copilot setup"
    print_info "4. Run tests (optional): nvim --headless -c \"PlenaryBustedDirectory tests { minimal_init = 'tests/minimal_init.lua' }\""
}

# Run main function
main "$@"