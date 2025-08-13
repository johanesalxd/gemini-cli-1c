# NVM, Node.js, NPM, and Gemini CLI Installation Script

This repository contains an automated installation script for setting up a complete development environment with NVM, Node.js, NPM, and Google's Gemini CLI.

## What's Included

- **NVM (Node Version Manager)** v0.39.0 - Manage multiple Node.js versions
- **Node.js** (Latest LTS) - JavaScript runtime
- **NPM** - Node.js package manager
- **Gemini CLI** - Google's AI CLI tool
- **Environment Setup** - Adds GOOGLE_CLOUD_PROJECT to bashrc

## Quick Start

### Option 1: Run the script directly
```bash
# Make the script executable and run it
chmod +x install_nvm_node_gemini.sh
./install_nvm_node_gemini.sh
```

### Option 2: Download and run in one command
```bash
# Download and execute the script
curl -o install_nvm_node_gemini.sh https://raw.githubusercontent.com/your-repo/install_nvm_node_gemini.sh
chmod +x install_nvm_node_gemini.sh
./install_nvm_node_gemini.sh
```

## Post-Installation Steps

1. **Restart your terminal** or run:
   ```bash
   source ~/.bashrc
   ```

2. **Set your Google Cloud Project ID** by editing `~/.bashrc`:
   ```bash
   nano ~/.bashrc
   ```
   Find the line with `GOOGLE_CLOUD_PROJECT` and replace `your-project-id-here` with your actual project ID.

3. **Load the environment variable**:
   ```bash
   source ~/.bashrc
   ```

4. **Verify installation**:
   ```bash
   nvm --version
   node --version
   npm --version
   gemini --version
   echo $GOOGLE_CLOUD_PROJECT
   ```

## Usage Examples

### NVM Commands
```bash
# List installed Node.js versions
nvm list

# Install a specific Node.js version
nvm install 18.17.0

# Switch to a specific version
nvm use 18.17.0

# Set default version
nvm alias default 18.17.0
```

### Gemini CLI Commands
```bash
# Get help
gemini --help

# Start interactive session
gemini

# Run a specific command
gemini "Explain how to use Node.js"
```

## System Requirements

- Linux (Ubuntu, Debian, CentOS, etc.)
- curl (for downloading NVM)
- bash shell
- Internet connection

## Troubleshooting

### NVM not found after installation
```bash
# Manually load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

### Permission issues with npm global packages
```bash
# Configure npm to use a different directory for global packages
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### Gemini CLI authentication
Make sure you have:
1. Set up your Google Cloud Project ID
2. Configured authentication (gcloud auth or API keys)

## What the Script Does

1. ✅ Downloads and installs NVM v0.39.0
2. ✅ Installs the latest LTS version of Node.js
3. ✅ Verifies NPM installation
4. ✅ Installs Google Gemini CLI globally
5. ✅ Adds GOOGLE_CLOUD_PROJECT environment variable to bashrc
6. ✅ Provides colored output and error handling
7. ✅ Includes verification steps for all installations

## License

This script is provided as-is for educational and development purposes.
