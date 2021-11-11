export TOKEN_AUTHENTICATION="aaaa"
export AIRFLOW_CONN_AZURE_DATA_FACTORY_DEFAULT='azure-data-factory://client%20id:secret@?tenantId=tenant+id&subscriptionId=subscription+id&resourceGroup=group+name&factory=factory+name'
#!/bin/zsh

# Default Postgres parameters
export POSTGRES_DB_NAME="postgres"
export POSTGRES_USER="postgres"
export POSTGRES_DB_HOST="localhost"

# Configuration of  the needed environment variables
export AIRFLOW_HOME="******INPUT YOUR PATH HERE****"
export AIRFLOW__CORE__DAGS_FOLDER=$AIRFLOW_HOME/dags
export AIRFLOW__CORE__EXECUTOR=LocalExecutor
export AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgresql+psycopg2://$POSTGRES_USER@$POSTGRES_DB_HOST/$POSTGRES_DB_NAME
export AIRFLOW__CELERY__CELERY_RESULT_BACKEND=db+postgresql://$POSTGRES_USER@$POSTGRES_DB_HOST/$POSTGRES_DB_NAME
export AIRFLOW__LOGGING__BASE_LOG_FOLDER=$AIRFLOW_HOME/logs
export AIRFLOW__SCHEDULER__CHILD_PROCESS_LOG_DIRECTORY=$AIRFLOW_HOME/logs/scheduler
export AIRFLOW__SCHEDULER__DAG_DIR_LIST_INTERVAL=$AIRFLOW_HOME/logs/scheduler
export AIRFLOW__LOGGING__DAG_PROCESSOR_MANAGER_LOG_LOCATION=$AIRFLOW_HOME/logs/dag_processor_manager/dag_processor_manager.log
export AIRFLOW__CORE__PLUGINS_FOLDER=$AIRFLOW_HOME/plugins
export AIRFLOW__CORE__UNIT_TEST_MODE=True



