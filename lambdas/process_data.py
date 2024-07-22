import os

def handler(event, context):
    api_key = os.getenv('API_KEY')
    api_secret = os.getenv('API_SECRET')
    
    return {
        'statusCode': 200,
        'body': f'Processing data with API key {api_key} and secret {api_secret}'
    }
