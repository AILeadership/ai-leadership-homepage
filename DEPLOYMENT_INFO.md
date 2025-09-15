# AI Leadership - Deployment Information

## Azure Resources Provisioned

### Resource Group
- **Name**: rg-ai-leadership
- **Location**: West Europe
- **Created**: 2025-09-15

### Static Web App
- **Name**: swa-ai-leadership
- **URL**: https://mango-bush-02dfbaf03.1.azurestaticapps.net
- **Resource ID**: /subscriptions/ca0a7799-8e2e-4237-8616-8cc0e947ecd5/resourceGroups/rg-ai-leadership/providers/Microsoft.Web/staticSites/swa-ai-leadership
- **SKU**: Free

## GitHub Configuration

### Repository
- **Organization**: AILeadership
- **Repository**: ai-leadership-homepage
- **URL**: https://github.com/AILeadership/ai-leadership-homepage
- **Branch**: main

### GitHub Secrets
- ✅ `AZURE_STATIC_WEB_APPS_API_TOKEN` - Configured (2025-09-15)

## Deployment Status

### Infrastructure
- ✅ Resource Group created
- ✅ Static Web App provisioned
- ✅ Deployment token generated
- ✅ GitHub secret configured
- ✅ **Site deployed and live**: https://mango-bush-02dfbaf03.1.azurestaticapps.net

### Deployment Methods

#### Method 1: Direct CLI Deployment (Recommended)
```bash
npm run deploy:azure
```

#### Method 2: GitHub Actions (Being debugged)
- Automatic deployment on push to main branch
- Currently experiencing token authentication issues

### Next Steps
1. Site is already live at: https://mango-bush-02dfbaf03.1.azurestaticapps.net
2. For updates, use: `npm run deploy:azure`
3. Custom domain can be configured in Azure Portal

### Custom Domain (Optional)
To add a custom domain:
1. Go to Azure Portal > Static Web Apps > swa-ai-leadership
2. Navigate to "Custom domains"
3. Add your domain and follow DNS configuration instructions

## Management Commands

### View deployment status
```bash
az staticwebapp show --name swa-ai-leadership --resource-group rg-ai-leadership
```

### View deployment history
```bash
gh run list --repo AILeadership/ai-leadership-homepage
```

### Manual deployment
```bash
gh workflow run deploy-manual.yml --repo AILeadership/ai-leadership-homepage
```

### Delete resources (cleanup)
```bash
az group delete --name rg-ai-leadership --yes
```

## Support

For issues or questions:
- GitHub Issues: https://github.com/AILeadership/ai-leadership-homepage/issues
- Azure Portal: https://portal.azure.com