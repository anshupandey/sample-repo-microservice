# Coding Standards

- Format Python code with Black and include type hints where practical.
- Keep FastAPI handlers small, validate inputs with Pydantic models, and expose a `/healthz` endpoint for readiness checks.
- Use pytest for unit tests and httpx/TestClient for integration tests.
- Follow principle of least privilege when interacting with Azure or GitHub resources; never embed secrets in code.
- Ensure pull requests document significant choices through ADRs and include rollback notes.
