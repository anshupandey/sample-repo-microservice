# Runbook: Incident Response (Staging)

1. **Triage** – Capture symptoms, timeframe, and recent deployments. Reference GitHub Actions runs and Azure metrics.
2. **Mitigate** – Scale the container instance (`az container restart` or adjust CPU/memory) or execute the rollback runbook.
3. **Gather evidence** – Collect logs, metrics, and workflow links. Attach artifacts to the incident ticket or PR.
4. **Post-incident** – Create follow-up issues for remediation and update ADRs/runbooks if process changes were made.
