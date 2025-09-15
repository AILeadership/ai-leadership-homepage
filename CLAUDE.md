# Claude Code Project Guidelines

## Project Overview

**AI Leadership Homepage** - A modern, responsive landing page for AI Leadership services built with Astro and deployed on Azure Static Web Apps.

### Live Site
🌐 **URL**: https://mango-bush-02dfbaf03.1.azurestaticapps.net

### Technology Stack
- **Framework**: Astro 5.13.7 (Static Site Generator)
- **Language**: TypeScript
- **Styling**: Inline CSS (component-scoped)
- **Hosting**: Azure Static Web Apps (Free tier)
- **CI/CD**: GitHub Actions
- **Infrastructure**: Bicep (IaC)

## Project Structure

```
HomePage/
├── src/
│   ├── components/         # 7 Astro components
│   │   ├── Navigation.astro
│   │   ├── Hero.astro
│   │   ├── Features.astro
│   │   ├── Approach.astro
│   │   ├── CTASection.astro
│   │   └── Footer.astro
│   ├── layouts/
│   │   └── Layout.astro    # Base layout with global styles
│   └── pages/
│       ├── index.astro     # Main landing page
│       └── 404.astro       # Error page
├── infra/                  # Azure infrastructure (Bicep)
│   ├── main.bicep
│   ├── parameters.json
│   └── deploy.sh
├── scripts/                # Deployment scripts
│   └── deploy-azure.sh
├── .github/
│   └── workflows/          # GitHub Actions CI/CD
│       ├── azure-static-web-apps.yml
│       └── deploy-manual.yml
└── dist/                   # Build output (gitignored)

## Azure Resources

- **Resource Group**: `rg-ai-leadership` (West Europe)
- **Static Web App**: `swa-ai-leadership`
- **GitHub Repo**: [AILeadership/ai-leadership-homepage](https://github.com/AILeadership/ai-leadership-homepage)

## Development Workflow

### Local Development
```bash
npm run dev          # Start dev server at localhost:4321
npm run build        # Build for production
npm run preview      # Preview production build
```

### Code Quality
```bash
npm run lint         # Run ESLint
npm run format       # Format with Prettier
npm run typecheck    # TypeScript type checking
```

## Key Features

1. **Component-Based Architecture**: 7 reusable Astro components
2. **Responsive Design**: Mobile-first, fully responsive
3. **Performance Optimized**: Static generation, asset optimization
4. **SEO Ready**: Meta tags, semantic HTML
5. **Security Headers**: CSP, X-Frame-Options configured
6. **Error Handling**: Custom 404 page

## Content Sections

1. **Navigation**: Fixed header with smooth scroll
2. **Hero**: Eye-catching landing with CTA
3. **Features**: Services/capabilities grid
4. **Approach**: Process/methodology showcase
5. **CTA Section**: Call-to-action with contact info
6. **Footer**: Links and copyright

## Context Files

All project-specific guidelines and rules are stored in the `context/` folder. Please refer to these files for detailed information:

- **[context/markdown-lint-rules.md](context/markdown-lint-rules.md)** - Markdownlint rules to follow when creating or editing markdown files

## Important Guidelines

- Always follow the guidelines in the context folder when working on this project
- These guidelines help maintain code quality and consistency
- Check the context folder for any updates or additional rules
- Before provisioning anything on Azure, always create the solution in IaC (az cli or bicep) prior to executing. Use the infra folder for IaC related code. Organize files according to best practices
- When making changes, ensure responsive design is maintained
- Follow Astro best practices for component development
- Test locally before pushing to main branch

## Deployment Commands

```bash
# Automatic deployment (via GitHub Actions)
git add .
git commit -m "Your commit message"
git push origin main

# Manual deployment (via SWA CLI)
npm run build
npm run deploy:azure

# Monitor GitHub Actions deployment
gh run list --repo AILeadership/ai-leadership-homepage --limit 1
gh run watch --repo AILeadership/ai-leadership-homepage
```

## Key Project Files

- **Implementation_Plan.md** - Detailed project phases and execution status
- **RUNBOOK.md** - Step-by-step setup instructions from scratch
- **TEST_REPORT.md** - Comprehensive testing results and fixes
- **PROJECT_SUMMARY.md** - High-level project overview and status
- **DEPLOYMENT_INFO.md** - Azure resources and deployment configuration