import os
import boto3
import psycopg2
import psycopg2.extras

ssm = boto3.client('ssm')


def get_ssm_param(name):
    response = ssm.get_parameter(Name=name, WithDecryption=True)
    return response['Parameter']['Value']


def handler(event, context):
    print("Received event:", event)

    if event.get('triggerSource') != 'PostConfirmation_ConfirmSignUp':
        print("Skipping event: not PostConfirmation_ConfirmSignUp")
        return event

    user_attributes = event['request']['userAttributes']
    user_id = user_attributes.get('sub')
    email = user_attributes.get('email')

    if not user_id or not email:
        raise ValueError("Missing required attributes: 'sub' or 'email'")

    db_host = os.environ['DB_HOST']
    db_name = os.environ['DB_NAME']
    db_user = get_ssm_param(os.environ['DB_USER_PARAM'])
    db_pass = get_ssm_param(os.environ['DB_PASS_PARAM'])

    try:
        conn = psycopg2.connect(
            host=db_host,
            dbname=db_name,
            user=db_user,
            password=db_pass
        )
        cursor = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)

        cursor.execute(
            """
            INSERT INTO users (id, email, is_active, created_at, updated_at)
            VALUES (%s, %s, TRUE, NOW(), NOW())
            ON CONFLICT (id) DO NOTHING
            """,
            (user_id, email)
        )

        conn.commit()
        cursor.close()
        conn.close()

        print(f"User {user_id} ({email}) inserted into RDS.")
        return event

    except Exception as e:
        print(f"Database error: {e}")
        raise
