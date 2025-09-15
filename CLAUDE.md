# Claude Code Project Guidelines

## Context Files

All project-specific guidelines and rules are stored in the `context/` folder. Please refer to these files for detailed information:

- **[context/markdown-lint-rules.md](context/markdown-lint-rules.md)** - Markdownlint rules to follow when creating or editing markdown files

## Important Notes

- Always follow the guidelines in the context folder when working on this project
- These guidelines help maintain code quality and consistency
- Check the context folder for any updates or additional rules
- Before provisioning anything on Azure, always create the solution in IaC (az cli or bicep) prior to executing. Use the infra folder for IaC related code. Organize files according to best practices