import json
import os
from airflow.utils.dates import days_ago

import requests

from airflow import DAG
from airflow.operators.python import PythonOperator


def get_token():
    return os.environ.get("TOKEN_AUTHENTICATION")


def _get_session():
    """Builds a requests Session for the API."""
    # Setup our requests session.
    session = requests.Session()
    base_url = "http://localhost/test"
    return session, base_url


def _post_http_request(session, url, params):
    """
    Fetches records using a POST request with given url/params, data
    taking pagination into account.
    """
    auth_token = get_token()
    headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "Token {0}".format(auth_token)
    }
    data = {"string": "string",
            "params": {"string1": "string", "string2": "string"}
            }
    response = session.post(
        url, data=json.dumps(data), headers=headers
    )
    response.raise_for_status()
    response_json = response.json()
    # response json will be pushed to x_com
    return response_json


with DAG(
    dag_id="request_http_post",
    description="Post data to the API",
    start_date=days_ago(1),
    schedule_interval="@daily",
) as dag:
    post_http_data = PythonOperator(
        task_id="post_http_request",
        python_callable=_post_http_request,
    )

    post_http_data

