# AI Leadership Infrastructure

This directory contains Infrastructure as Code (IaC) for deploying the AI Leadership website to Azure Static Web Apps.

## Prerequisites

- Azure CLI installed and configured
- Azure subscription
- GitHub repository (for CI/CD integration)

## Deployment Options

### Option 1: Using Bicep (Recommended)

1. Update the `parameters.json` file with your GitHub repository URL
2. Run the deployment script:
   ```bash
   chmod +x deploy.sh
   ./deploy.sh
   ```

### Option 2: Using Azure CLI directly

1. Update the repository URL in `deploy-static-web-app.sh`
2. Run the script:
   ```bash
   chmod +x deploy-static-web-app.sh
   ./deploy-static-web-app.sh
   ```

## Files

- `main.bicep` - Bicep template defining the Azure Static Web App resource
- `parameters.json` - Parameters file for Bicep deployment
- `deploy.sh` - Deployment script for Bicep template
- `deploy-static-web-app.sh` - Alternative deployment using Azure CLI commands

## Resource Naming Convention

- Resource Group: `rg-ai-leadership`
- Static Web App: `swa-ai-leadership`

## Post-Deployment Steps

1. Add the deployment token as a GitHub secret named `AZURE_STATIC_WEB_APPS_API_TOKEN`
2. Configure GitHub Actions workflow (see `.github/workflows/`)
3. Push code to trigger automatic deployment

## Customization

To deploy to a different environment or with different settings:
1. Modify `parameters.json` with your desired values
2. Update the resource group name and location in `deploy.sh`
3. Run the deployment script