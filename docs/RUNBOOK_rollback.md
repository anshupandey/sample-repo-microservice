# Runbook: Rollback

1. Identify the last known good image tag in ACR (for example via `az acr repository show-tags`).
2. Re-run the `deploy-staging` workflow with `IMAGE_TAG` set to the desired tag using workflow dispatch inputs or environment override.
3. Validate `/healthz` and run targeted regression tests.
4. Document the rollback and lessons learned in the incident or change ticket.
