from app.app import app

def test_health_route():
    client = app.test_client()
    response = client.get("/health")   # or "/" depending on your route
    assert response.status_code == 200
    assert response.get_json() == {"status": "ok"}


