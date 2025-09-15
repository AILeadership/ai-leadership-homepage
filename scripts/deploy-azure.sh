#!/bin/bash

# Azure Static Web Apps Deployment Script
# This script deploys the site directly to Azure using the SWA CLI

set -e

echo "🚀 Deploying to Azure Static Web Apps..."

# Check if SWA CLI is installed
if ! command -v swa &> /dev/null; then
    echo "Installing Azure Static Web Apps CLI..."
    npm install -g @azure/static-web-apps-cli
fi

# Build the project
echo "🔨 Building the project..."
npm run build

# Get deployment token from Azure
echo "🔐 Retrieving deployment token..."
DEPLOYMENT_TOKEN=$(az staticwebapp secrets list \
  --name swa-ai-leadership \
  --resource-group rg-ai-leadership \
  --query "properties.apiKey" \
  --output tsv)

if [ -z "$DEPLOYMENT_TOKEN" ]; then
    echo "❌ Failed to retrieve deployment token"
    echo "Make sure you're logged into Azure CLI: az login"
    exit 1
fi

# Deploy to Azure
echo "📦 Deploying to Azure..."
swa deploy ./dist --deployment-token $DEPLOYMENT_TOKEN --env production

echo "✅ Deployment complete!"
echo "🌐 Site URL: https://mango-bush-02dfbaf03.1.azurestaticapps.net"