# Runbook: Deploy to Staging

1. Confirm `main` is green on build-test, codeql, and container-scan workflows.
2. Allow the `deploy-staging` workflow to run on merge (or trigger manually via workflow dispatch).
3. After deployment, retrieve the container FQDN from the workflow logs and run a smoke test:
   ```bash
   curl https://<fqdn>/healthz
   ```
4. Record validation evidence and the deployed image tag in the associated PR or change record.
