from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def test_echo_roundtrip():
    response = client.post("/echo", json={"message": "hi"})
    assert response.status_code == 200
    assert response.json()["echo"] == "hi"
