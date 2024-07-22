import os


def handler(event, context):
    api_key = os.getenv('API_KEY')
    api_secret = os.getenv('API_SECRET')

    # Ensure the line length does not exceed 79 characters
    response_message = (
        f'Processing data with API key {api_key} and secret {api_secret}'
    )

    return {
        'statusCode': 200,
        'body': response_message
    }
