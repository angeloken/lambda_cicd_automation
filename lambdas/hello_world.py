import os

def handler(event, context):
    db_host = os.getenv('DB_HOST')
    db_user = os.getenv('DB_USER')
    db_pass = os.getenv('DB_PASS')
    
    return {
        'statusCode': 200,
        'body': f'Connected to DB at {db_host} with user {db_user}'
    }