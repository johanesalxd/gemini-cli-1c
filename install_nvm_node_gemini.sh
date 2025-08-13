#!/bin/bash

# Installation script for NVM, Node.js, NPM, and Gemini CLI
# This script also adds GOOGLE_CLOUD_PROJECT to bashrc

set -e  # Exit on any error

echo "🚀 Starting installation of NVM, Node.js, NPM, and Gemini CLI..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    print_error "This script is designed for Linux systems only."
    exit 1
fi

# Step 1: Install NVM
print_status "Installing/Updating NVM..."
if [ -d "$HOME/.nvm" ]; then
    print_warning "NVM directory already exists. Updating..."
fi

# Download and install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Step 2: Load NVM in current session
print_status "Loading NVM in current session..."
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Verify NVM installation
if ! command -v nvm &> /dev/null; then
    print_error "NVM installation failed or not loaded properly"
    exit 1
fi

print_status "NVM version: $(nvm --version)"

# Step 3: Install Node.js LTS
print_status "Installing Node.js LTS..."
nvm install --lts
nvm use --lts

# Verify Node.js and NPM installation
if ! command -v node &> /dev/null; then
    print_error "Node.js installation failed"
    exit 1
fi

if ! command -v npm &> /dev/null; then
    print_error "NPM installation failed"
    exit 1
fi

print_status "Node.js version: $(node --version)"
print_status "NPM version: $(npm --version)"

# Step 4: Install Gemini CLI
print_status "Installing Gemini CLI..."
npm install -g @google/gemini-cli

# Verify Gemini CLI installation
if ! command -v gemini &> /dev/null; then
    print_error "Gemini CLI installation failed"
    exit 1
fi

print_status "Gemini CLI version: $(gemini --version)"

# Step 5: Add GOOGLE_CLOUD_PROJECT to bashrc
print_status "Adding GOOGLE_CLOUD_PROJECT environment variable to ~/.bashrc..."

# Check if GOOGLE_CLOUD_PROJECT is already in bashrc
if grep -q "export GOOGLE_CLOUD_PROJECT=" ~/.bashrc; then
    print_warning "GOOGLE_CLOUD_PROJECT already exists in ~/.bashrc"
else
    echo "" >> ~/.bashrc
    echo "# Google Cloud Project ID" >> ~/.bashrc
    echo "export GOOGLE_CLOUD_PROJECT=\"your-project-id-here\"" >> ~/.bashrc
    print_status "Added GOOGLE_CLOUD_PROJECT to ~/.bashrc"
    print_warning "Please edit ~/.bashrc and replace 'your-project-id-here' with your actual Google Cloud Project ID"
fi

# Step 6: Final verification and instructions
print_status "Installation completed successfully! 🎉"
echo ""
echo "📋 Summary:"
echo "  ✅ NVM: $(nvm --version)"
echo "  ✅ Node.js: $(node --version)"
echo "  ✅ NPM: $(npm --version)"
echo "  ✅ Gemini CLI: $(gemini --version)"
echo ""
echo "📝 Next steps:"
echo "  1. Close and reopen your terminal (or run 'source ~/.bashrc')"
echo "  2. Edit ~/.bashrc and set your Google Cloud Project ID:"
echo "     export GOOGLE_CLOUD_PROJECT=\"your-actual-project-id\""
echo "  3. Run 'source ~/.bashrc' to load the environment variable"
echo "  4. You can now use 'gemini --help' to get started with Gemini CLI"
echo ""
echo "🔧 Useful commands:"
echo "  - nvm list: Show installed Node.js versions"
echo "  - nvm use <version>: Switch to a specific Node.js version"
echo "  - nvm install <version>: Install a specific Node.js version"
echo "  - gemini --help: Show Gemini CLI help"
