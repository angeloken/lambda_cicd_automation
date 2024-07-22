import pytest
from lambdas.hello_world import handler as hello_world_handler
from lambdas.process_data import handler as process_data_handler
import os

def test_hello_world(monkeypatch):
    monkeypatch.setenv('DB_HOST', 'test.db.host')
    monkeypatch.setenv('DB_USER', 'testuser')
    monkeypatch.setenv('DB_PASS', 'testpass')
    
    result = hello_world_handler({}, {})
    assert result['statusCode'] == 200
    assert 'Connected to DB at test.db.host with user testuser' in result['body']

def test_process_data(monkeypatch):
    monkeypatch.setenv('API_KEY', 'testapikey')
    monkeypatch.setenv('API_SECRET', 'testapisecret')
    
    result = process_data_handler({}, {})
    assert result['statusCode'] == 200
    assert 'Processing data with API key testapikey and secret testapisecret' in result['body']
