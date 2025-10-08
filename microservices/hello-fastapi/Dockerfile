# syntax=docker/dockerfile:1.7
FROM python:3.11-slim AS base

WORKDIR /app

COPY pyproject.toml ./
RUN pip install --upgrade pip \
    && pip install --no-cache-dir fastapi uvicorn httpx pytest pytest-cov

COPY app app
COPY tests tests

EXPOSE 8080

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
