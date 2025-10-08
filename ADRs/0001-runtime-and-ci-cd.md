# ADR 0001: Runtime and CI/CD

- **Status**: Accepted
- **Context**: The capstone requires a minimal, Azure-native deployment path with automated scanning and testing.
- **Decision**: Standardize on FastAPI for the sample service, deploy to Azure Container Instances via Azure Container Registry, and orchestrate build/test/scans/deploy with GitHub Actions.
- **Consequences**: Provides a simple, idempotent workflow and clear traceability for the assistant. Future enhancements can evolve the deployment target to AKS or App Service without major workflow changes.
