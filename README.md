## Overview

Fetch Data from Azure.

## PREREQUISITES

* Python 3.8+

* Docker and Docker compose(eg. version 20.10.6)

* Airflow 2.0.0+

* Azure's credentials and HTTP API token.

# Run the project locally:

0. Export the AIRFLWO_HOME_PATH
   
```python

export AIRFLOW_HOME=`pwd`

```
1. Set your environment Variables and load them by:

```
source env.sh

```


2. Install Apache-airflow 2.0.0 
```
pip install apache-airflow==2.0.0 --constraint https://gist.githubusercontent.com/marclamberti/742efaef5b2d94f44666b0aec020be7c/raw/5da51f9fe99266562723fdfb3e11d3b6ac727711/constraint.txt
```

3. Install `apache-airflow-providers-microsoft-azure`
```
   pip3 install apache-airflow-providers-microsoft-azure

   ```
4. Initialize the database and migrate

```
   airflow db init

   airflow db check-migrations

   airflow db upgrade
```
3. Run the scheduler and the webserver

```
   airflow scheduler

   airflow webserver
```

# Run the project with Docker:


1. Run the command :

 * Edit AIRFLOW_HOME path inside env.sh

```source env.sh```


``` docker-compose up ```

``` docker-compose down ```

2. Set all the needed connections in the Airflow webserver.

  