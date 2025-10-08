# Contributing

- Branch from `feature/<slug>` and keep pull requests focused.
- All pull requests must pass the **build-test**, **codeql**, and **container-scan** workflows.
- Follow the guidance in [docs/CODING_STANDARDS.md](docs/CODING_STANDARDS.md).
- Record notable architecture or process choices as an ADR under `ADRs/`.
- Target at least 70% test coverage for Python services and include integration tests for new endpoints.
- Never commit secrets; use Azure Key Vault or GitHub OIDC federation for credentials.
