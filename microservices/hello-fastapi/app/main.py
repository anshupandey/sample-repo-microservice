from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="hello-fastapi", version="1.0.0")


class Echo(BaseModel):
    message: str


@app.get("/healthz")
def healthz():
    return {"status": "ok"}


@app.post("/echo")
def echo(payload: Echo):
    return {"echo": payload.message}


@app.get("/")
def root():
    return {"service": "hello-fastapi", "version": "1.0.0"}
