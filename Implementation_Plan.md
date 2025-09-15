# AI Leadership Home Page - Implementation Plan

## Progress Status
- **Phase 0: Infrastructure as Code** ✅ Complete
- **Phase 1: Project Setup** ✅ Complete
- **Phase 2: Content Migration** ✅ Complete
- **Phase 3: Azure Configuration** ✅ Complete
- **Phase 4: Testing & Documentation** ⏳ Pending (Partially Complete)

## Project Overview

Implementation of AI Leadership landing page using Astro as CMS, hosted on Azure Static Web Apps with GitHub Actions deployment.

## Based on Specification

- Main landing page: ai-leadership-theme1.html
- Hosting: Azure Static Web App
- CMS: Astro
- Deployment: GitHub Actions

## Implementation Phases

### Phase 0: Infrastructure as Code (IaC) Setup ✅ COMPLETED

#### Created Azure Infrastructure Templates ✅

- ✅ Created `/infra` directory for IaC code
- ✅ Implemented Bicep template (`main.bicep`) for Azure Static Web App resource
- ✅ Created `parameters.json` for Bicep deployment configuration
- ✅ Created `deploy.sh` script for Bicep deployment automation
- ✅ Created `deploy-static-web-app.sh` as alternative Azure CLI deployment
- ✅ Created infrastructure README with deployment instructions
- ✅ Made all scripts executable
- ✅ Followed Azure resource naming conventions (rg-ai-leadership, swa-ai-leadership)

### Phase 1: Project Setup ✅ COMPLETED

#### 1. Set up Astro project structure ✅

- ✅ Created the foundational Astro project with proper directory organization
- ✅ Directory structure created:

  ```text
  /src
    /components
    /layouts
    /pages
    /styles
  /public
    /assets
  ```

#### 2. Initialize npm project and install Astro dependencies ✅

- ✅ Initialized package.json
- ✅ Installed core dependencies:
  - `astro` (v5.13.7)
  - Development tools:
    - `prettier` and `prettier-plugin-astro`
    - `eslint` with TypeScript and Astro plugins
    - `@typescript-eslint/parser` and `@typescript-eslint/eslint-plugin`
    - `eslint-plugin-astro`
- ✅ Configured scripts for build, dev, preview, lint, and format
- ✅ Created `.prettierrc` configuration
- ✅ Created `.eslintrc.json` configuration
- ✅ Verified successful build

### Phase 2: Content Migration ✅ COMPLETED

#### 3. Copy and convert ai-leadership-theme1.html to Astro component ✅

- ✅ Transformed HTML template to Astro component architecture
- ✅ Preserved all existing styles and functionality
- ✅ Split into reusable components:
  - `Navigation.astro` - Header/Navigation
  - `Hero.astro` - Hero section with customizable props
  - `Features.astro` - Features/Services section
  - `Approach.astro` - Approach/Process section
  - `CTASection.astro` - Call-to-action section
  - `Footer.astro` - Footer with dynamic year
- ✅ Migrated inline styles to component-scoped styles
- ✅ Created `Layout.astro` with global styles

#### 4. Configure Astro for static site generation ✅

- ✅ Set up `astro.config.mjs`:
  - Output: 'static'
  - Build configuration for Azure Static Web Apps
  - Site URL: 'https://swa-ai-leadership.azurestaticapps.net'
  - Asset optimization with hash naming
  - HTML compression enabled
- ✅ Configured Vite rollup options for optimized builds
- ✅ Verified successful build and preview

### Phase 3: Azure Configuration ✅ COMPLETED

#### 5. Create Azure Static Web App configuration ✅

- ✅ Created `staticwebapp.config.json`:
  - Routing rules for assets and pages
  - Custom cache-control headers for optimized performance
  - 404 error page handling with custom page
  - Navigation fallback for SPA routing
  - Security headers (X-Frame-Options, CSP, XSS Protection)
- ✅ Created custom 404.astro error page
- ✅ Configured MIME types for all asset types
- ✅ Created `.env.example` for environment variables

#### 6. Set up GitHub Actions workflow for Azure deployment ✅

- ✅ Created `.github/workflows/azure-static-web-apps.yml`
- ✅ Created `.github/workflows/deploy-manual.yml` for manual deployments
- ✅ Workflow configuration includes:
  - Trigger on main branch push and PR events
  - Node.js 18 setup with npm caching
  - Separate build and deploy steps
  - Support for PR preview environments
  - Manual deployment option with environment selection
- ✅ Created `scripts/deploy-local.sh` for testing deployment locally
- ✅ Added deployment npm scripts to package.json

### Phase 4: Testing & Documentation (Partially Complete)

#### 7. Test local build and preview ✅

- ✅ Run local development server (http://localhost:4321/)
- ✅ Verify build output (successful build in 337ms)
- ⏳ Test all features and responsive design
- ⏳ Check for:
  - Broken links
  - Missing assets
  - Console errors
  - Performance metrics (Lighthouse)

#### 8. Create deployment documentation

- Document deployment process
- List required environment variables
- Maintenance procedures
- Troubleshooting guide
- Update instructions

## Technical Requirements

### Prerequisites

- Node.js 18+
- npm or yarn
- Azure account with Static Web Apps resource
- GitHub repository
- Azure Static Web Apps deployment token

### Environment Variables

```env
# .env.example
AZURE_STATIC_WEB_APPS_API_TOKEN=<deployment-token>
```

### Build Commands

```bash
# Development
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

### Deployment Flow

1. Developer pushes to main branch
2. GitHub Actions workflow triggers
3. Astro site builds
4. Static files deploy to Azure
5. Azure CDN distributes globally

## Timeline Estimate

- Phase 1 (Project Setup): 1-2 hours
- Phase 2 (Content Migration): 2-3 hours
- Phase 3 (Azure Configuration): 1-2 hours
- Phase 4 (Testing & Documentation): 1 hour

Total estimated time: **5-8 hours**

## Success Criteria

- [x] Astro project builds without errors
- [x] All content from ai-leadership-theme1.html is migrated
- [ ] Site deploys automatically on git push
- [ ] Site is accessible via Azure Static Web Apps URL
- [ ] Performance score > 90 on Lighthouse
- [ ] Mobile responsive design works correctly
- [ ] All assets load properly from CDN

## Potential Challenges & Solutions

1. **Asset optimization**: Use Astro's built-in image optimization
2. **CORS issues**: Configure headers in staticwebapp.config.json
3. **Build size**: Implement code splitting and lazy loading
4. **SEO**: Add proper meta tags and sitemap generation

## Next Steps After Implementation

1. Set up custom domain
2. Configure SSL certificate
3. Implement analytics
4. Set up monitoring and alerts
5. Create content update workflow
