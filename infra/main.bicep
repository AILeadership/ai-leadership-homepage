// AI Leadership Static Web App Infrastructure
// Bicep template for deploying Azure Static Web App

@description('The name of the Static Web App')
param staticWebAppName string = 'swa-ai-leadership'

@description('The location for the Static Web App')
@allowed([
  'centralus'
  'eastus2'
  'eastasia'
  'westeurope'
  'westus2'
])
param location string = 'westeurope'

@description('The SKU for the Static Web App')
@allowed([
  'Free'
  'Standard'
])
param sku string = 'Free'

@description('GitHub repository URL')
param repositoryUrl string = ''

@description('GitHub repository branch')
param branch string = 'main'

@description('Application location in repository')
param appLocation string = '/'

@description('API location in repository (leave empty if no API)')
param apiLocation string = ''

@description('Output location for built app')
param outputLocation string = 'dist'

@description('GitHub deployment token (optional for initial creation)')
@secure()
param repositoryToken string = ''

@description('Tags to apply to resources')
param tags object = {
  project: 'ai-leadership'
  environment: 'production'
  managedBy: 'bicep'
}

// Static Web App Resource
resource staticWebApp 'Microsoft.Web/staticSites@2023-01-01' = {
  name: staticWebAppName
  location: location
  tags: tags
  sku: {
    name: sku
    tier: sku
  }
  properties: {
    repositoryUrl: repositoryUrl
    branch: branch
    repositoryToken: repositoryToken
    buildProperties: {
      appLocation: appLocation
      apiLocation: apiLocation
      outputLocation: outputLocation
    }
  }
}

// Custom domain (optional - uncomment and configure if needed)
/*
resource customDomain 'Microsoft.Web/staticSites/customDomains@2023-01-01' = {
  parent: staticWebApp
  name: 'www.yourdomain.com'
  properties: {
    domainName: 'www.yourdomain.com'
  }
}
*/

// Outputs
output staticWebAppName string = staticWebApp.name
output staticWebAppUrl string = 'https://${staticWebApp.properties.defaultHostname}'
output staticWebAppId string = staticWebApp.id