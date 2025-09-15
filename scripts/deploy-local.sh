#!/bin/bash

# Local deployment script for testing Azure Static Web Apps configuration
# This script simulates the deployment process locally

set -e

echo "🚀 Starting local deployment simulation..."

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install Node.js and npm first."
    exit 1
fi

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
    echo -e "${YELLOW}📦 Installing dependencies...${NC}"
    npm ci
fi

# Build the project
echo -e "${YELLOW}🔨 Building Astro site...${NC}"
npm run build

# Check if build was successful
if [ -d "dist" ]; then
    echo -e "${GREEN}✅ Build successful!${NC}"
    echo ""
    echo "📁 Build output in: ./dist"
    echo ""

    # List build artifacts
    echo "📋 Build artifacts:"
    ls -la dist/

    # Check for Azure config
    if [ -f "staticwebapp.config.json" ]; then
        echo -e "${GREEN}✅ Azure Static Web App configuration found${NC}"
    else
        echo -e "${YELLOW}⚠️  No staticwebapp.config.json found${NC}"
    fi

    echo ""
    echo "🎯 Next steps:"
    echo "1. Commit and push your changes to GitHub"
    echo "2. Add AZURE_STATIC_WEB_APPS_API_TOKEN to GitHub Secrets"
    echo "3. The GitHub Action will automatically deploy to Azure"
    echo ""
    echo "To preview locally, run: npm run preview"
else
    echo "❌ Build failed. Please check the error messages above."
    exit 1
fi