#!/bin/bash

# Bicep deployment script for AI Leadership Static Web App

set -e

# Configuration
RESOURCE_GROUP_NAME="rg-ai-leadership"
LOCATION="westeurope"
DEPLOYMENT_NAME="ai-leadership-deployment-$(date +%Y%m%d%H%M%S)"

echo "Deploying AI Leadership infrastructure using Bicep..."

# Create Resource Group if it doesn't exist
echo "Ensuring resource group exists: $RESOURCE_GROUP_NAME"
az group create \
  --name $RESOURCE_GROUP_NAME \
  --location $LOCATION \
  --output none 2>/dev/null || true

# Deploy Bicep template
echo "Deploying Bicep template..."
az deployment group create \
  --name $DEPLOYMENT_NAME \
  --resource-group $RESOURCE_GROUP_NAME \
  --template-file main.bicep \
  --parameters @parameters.json \
  --output table

# Get outputs
echo ""
echo "Deployment completed successfully!"
echo ""
echo "Getting deployment outputs..."
STATIC_WEB_APP_NAME=$(az deployment group show \
  --name $DEPLOYMENT_NAME \
  --resource-group $RESOURCE_GROUP_NAME \
  --query properties.outputs.staticWebAppName.value \
  --output tsv)

STATIC_WEB_APP_URL=$(az deployment group show \
  --name $DEPLOYMENT_NAME \
  --resource-group $RESOURCE_GROUP_NAME \
  --query properties.outputs.staticWebAppUrl.value \
  --output tsv)

# Get deployment token for GitHub Actions
echo "Retrieving deployment token..."
DEPLOYMENT_TOKEN=$(az staticwebapp secrets list \
  --name $STATIC_WEB_APP_NAME \
  --resource-group $RESOURCE_GROUP_NAME \
  --query "properties.apiKey" \
  --output tsv)

echo ""
echo "============================================"
echo "Deployment Summary:"
echo "============================================"
echo "Resource Group: $RESOURCE_GROUP_NAME"
echo "Static Web App Name: $STATIC_WEB_APP_NAME"
echo "URL: $STATIC_WEB_APP_URL"
echo ""
echo "Next steps:"
echo "1. Add the following secret to your GitHub repository:"
echo "   Name: AZURE_STATIC_WEB_APPS_API_TOKEN"
echo "   Value: $DEPLOYMENT_TOKEN"
echo "2. Update the repositoryUrl in parameters.json"
echo "3. Push your code to trigger the GitHub Actions workflow"
echo "============================================"