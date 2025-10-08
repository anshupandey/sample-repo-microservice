# hello-fastapi

Simple FastAPI service for the CSED+Ops starter repository.

## Endpoints
- `GET /` – service metadata
- `GET /healthz` – readiness probe
- `POST /echo` – echoes `message`

## Local development
```bash
pip install fastapi uvicorn
uvicorn app.main:app --reload --port 8080
```

## Tests
```bash
pytest
```
