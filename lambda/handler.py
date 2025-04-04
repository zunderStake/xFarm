import json
import boto3

def lambda_handler(event, context):
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        print(f"Processing file from bucket: {bucket}, key: {key}")

        # Example: read content (for demo only)
        s3 = boto3.client('s3')
        response = s3.get_object(Bucket=bucket, Key=key)
        content = response['Body'].read().decode('utf-8')
        print(f"File content: {content[:100]}...")  # Print first 100 characters

    return {
        'statusCode': 200,
        'body': json.dumps('File processed successfully')
    }
