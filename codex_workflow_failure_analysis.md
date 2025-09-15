Here’s what failed and how to fix it.

Why it failed

- Root cause: The Azure/static-web-apps-deploy@v1 step did not receive a deployment token. Logs show “deployment_token was not provided,” which means the workflow
couldn’t read secrets.AZURE_STATIC_WEB_APPS_API_TOKEN at runtime.
- Evidence: Multiple runs (push and manual) failed with the same error; YAML inputs look correct; repo secret existed but wasn’t available to the job.
- Most likely causes:
    - Secret scope mismatch: Secret stored at org or environment level, but the job isn’t bound to that environment, so the job can’t access it.
    - Secret content issue: Secret value saved with quotes/newlines or copied incorrectly (empty/whitespace).
    - Org policy/permissions: Organization restricts secrets to specific workflows or environments; job not configured accordingly.

What to change

- Ensure the token secret exists and is clean:
    - Get token: TOKEN=$(az staticwebapp secrets list --name swa-ai-leadership --resource-group rg-ai-leadership --query "properties.apiKey" --output tsv)
    - Set secret cleanly: gh secret set AZURE_STATIC_WEB_APPS_API_TOKEN --repo AILeadership/ai-leadership-homepage --body "$TOKEN"
    - Verify: gh secret list --repo AILeadership/ai-leadership-homepage
- Bind the job to an environment if your org uses environment-scoped secrets:
    - In GitHub → Settings → Environments → “production”, add secret AZURE_STATIC_WEB_APPS_API_TOKEN.
    - Add environment: production to the deploy job so the secret is accessible.
- Pass the token via both input and env (robust against input mapping issues):
    - Keep with: azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
    - Also set step env: AZURE_STATIC_WEB_APPS_API_TOKEN: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}

Exact edits (apply to both .github/workflows/azure-static-web-apps.yml and deploy-manual.yml)

- Under the deploy job:
    - Add environment binding:
    - `environment: production`
- Optionally set minimal permissions (not strictly required for secrets, but good hygiene):
    - `permissions: { contents: read }`
- In the deploy step:
    - Add env to ensure the token is present in the environment:
    - `env: { AZURE_STATIC_WEB_APPS_API_TOKEN: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }} }`
- Keep existing with.azure_static_web_apps_api_token.

Snippet: azure-static-web-apps.yml

- Add to job:
    - environment: production
    - permissions:
    - `contents: read`
- Modify deploy step:
    - env:
    - `AZURE_STATIC_WEB_APPS_API_TOKEN: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}`
- with:
    - `azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}`
    - keep the rest as-is

Validation

- Recreate secret cleanly (no quotes/newlines), then rerun:
    - Push a trivial change or use “Re-run all jobs” on the failed run.
    - Expect the step to proceed past token validation; if token is wrong you’d get 401/Forbidden instead of “not provided”.
- If the repo is in an org with environment protection, ensure you created the secret under the “production” environment and that the job declares environment:
production. If approvals are required, approve the run.

Notes

- The workflows already point to the root and correctly set output_location: "dist" with skip_app_build: true, so no path/build fix is needed.
- If PR builds from forks are enabled, ensure the deploy step doesn’t run on forked PRs (secrets are not exposed). Your if conditions already avoid deploy on
closed PRs; you can further guard deploy to only run on push and workflow_dispatch.