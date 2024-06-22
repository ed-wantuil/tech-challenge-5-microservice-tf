import boto3
import os

cognito_client = boto3.client('cognito-idp')

USER_POOL_ID = os.environ['USER_POOL_ID']
CLIENT_ID = os.environ['CLIENT_ID']

def lambda_handler(event, context):
    cpf = event['cpf']


    username = cpf
    password = cpf

    auth_parameters = {
        'USERNAME': username,
        'PASSWORD': password
    }

    try:
        cognito_client.admin_set_user_password(
            UserPoolId=USER_POOL_ID,
            Username=username,
            Password=password,
            Permanent=True
        )

        auth_response = cognito_client.admin_initiate_auth(
            UserPoolId=USER_POOL_ID,
            ClientId=CLIENT_ID,
            AuthFlow='ADMIN_USER_PASSWORD_AUTH',
            AuthParameters=auth_parameters
        )

        return {
            'statusCode': 200,
            'body': auth_response['AuthenticationResult']
        }
    except cognito_client.exceptions.NotAuthorizedException:
        return {
            'statusCode': 401,
            'body': {
                'message': 'Authentication failed'
            }
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': {
                'message': 'Internal server error',
                'error': str(e)
            }
        }