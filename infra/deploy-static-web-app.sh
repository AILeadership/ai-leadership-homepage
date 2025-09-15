#!/bin/bash

# Azure Static Web App Deployment Script
# This script creates all necessary Azure resources for hosting the AI Leadership site

set -e

# Configuration
RESOURCE_GROUP_NAME="rg-ai-leadership"
LOCATION="westeurope"
STATIC_WEB_APP_NAME="swa-ai-leadership"
TAGS="project=ai-leadership environment=production"

echo "Creating Azure Static Web App infrastructure..."

# Create Resource Group
echo "Creating resource group: $RESOURCE_GROUP_NAME"
az group create \
  --name $RESOURCE_GROUP_NAME \
  --location $LOCATION \
  --tags $TAGS

# Create Static Web App
echo "Creating Static Web App: $STATIC_WEB_APP_NAME"
az staticwebapp create \
  --name $STATIC_WEB_APP_NAME \
  --resource-group $RESOURCE_GROUP_NAME \
  --location $LOCATION \
  --source https://github.com/AILeadership/ai-leadership-homepage \
  --branch main \
  --app-location "/" \
  --api-location "" \
  --output-location "dist" \
  --sku Free \
  --tags $TAGS

# Get deployment token
echo "Retrieving deployment token..."
DEPLOYMENT_TOKEN=$(az staticwebapp secrets list \
  --name $STATIC_WEB_APP_NAME \
  --resource-group $RESOURCE_GROUP_NAME \
  --query "properties.apiKey" \
  --output tsv)

echo "Static Web App created successfully!"
echo ""
echo "Next steps:"
echo "1. Add the deployment token as a GitHub secret named 'AZURE_STATIC_WEB_APPS_API_TOKEN'"
echo "   Token: $DEPLOYMENT_TOKEN"
echo "2. Update the GitHub repository URL in this script"
echo "3. Push your code to trigger the deployment"
echo ""
echo "Static Web App URL: https://${STATIC_WEB_APP_NAME}.azurestaticapps.net"