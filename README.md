# CSED+Ops Starter Repository

This starter repo seeds the Cross Domain Dev Productivity (CSED+Ops) capstone. It includes:

- A sample FastAPI microservice with unit and integration tests.
- GitHub Actions for build/test, CodeQL analysis, container scanning, and deployment to Azure Container Instances (ACI).
- Infrastructure-as-code samples using both Bicep and Terraform for Azure Container Registry (ACR) and ACI.
- Documentation for contributing, architectural decisions, coding standards, and operational runbooks.

Use this repository to exercise the Change → Scan → Evaluate → Deploy workflow with clear traceability.

## Quick start

1. **Run locally**
   ```bash
   cd microservices/hello-fastapi
   pip install fastapi uvicorn
   uvicorn app.main:app --reload --port 8080
   ```
   Visit http://localhost:8080/healthz to verify the service.

2. **Run tests**
   ```bash
   pytest
   ```

3. **Build a container**
   ```bash
   docker build -t hello-fastapi:dev microservices/hello-fastapi
   ```

## CI/CD Overview

- Pull requests trigger build/test and security scans.
- Merges to `main` (or manual dispatch) run the staging deployment workflow.
- Deployment publishes the image to ACR and runs the container in ACI.

## Azure Setup

Provide the following repository secrets/variables before running `deploy-staging`:

| Type      | Name                     | Description |
|-----------|--------------------------|-------------|
| Secret    | `AZURE_SUBSCRIPTION_ID`  | Target subscription |
| Secret    | `AZURE_TENANT_ID`        | Azure AD tenant |
| Secret    | `AZURE_CLIENT_ID`        | Federated GitHub OIDC app |
| Variable  | `AZ_RESOURCE_GROUP`      | Resource group name |
| Variable  | `AZ_REGION`              | Azure region (e.g., eastus) |
| Variable  | `AZ_ACR_NAME`            | Azure Container Registry name |
| Variable  | `AZ_ACI_NAME`            | Azure Container Instance name |

## Repository Structure

```
.
├── .github
│   ├── CODEOWNERS
│   ├── ISSUE_TEMPLATE
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── workflows
├── ADRs
├── docs
├── infra
│   ├── bicep
│   └── terraform
└── microservices
    └── hello-fastapi
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for workflow expectations, code style, and testing requirements.
