#!/usr/bin/env bash

# if [ "$EXECUTOR" = "Local" ]; then
#   export AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgresql+psycopg2://airflow:airflow@postgres:5432/airflow
#   export AIRFLOW__CORE__EXECUTOR=LocalExecutor
# fi

echo $AIRFLOW__CORE__EXECUTOR

case "$1" in
  webserver)
    echo $AIRFLOW__CORE__EXECUTOR
    sleep 10
    airflow initdb
    if [ "$AIRFLOW__CORE__EXECUTOR" = "LocalExecutor" ]; then
      # With the Local executor it should all run in one container.
      echo "holi"
      airflow scheduler &
    fi
    
    
    python3 create_user.py
    airflow webserver
    ;;
  worker|scheduler)
    # To give the webserver time to run initdb.
    sleep 10
    #echo "holi"
    exec airflow "$@"
    ;;
  flower)
    sleep 10
    exec airflow "$@"
    ;;
  version)
    exec airflow "$@"
    ;;
  *)
    # The command is something like bash, not an airflow subcommand. Just run it in the right environment.
    exec "$@"
    ;;
esac
