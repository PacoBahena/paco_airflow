## Readme for airflow

Docker compose executes two containers, the official postgres image,
and a custom airflow one via the repo DockerFile.

The airflow conf file is on conf folder,
as well as python script determining user and password.

The entrypoint makes the final configurations to run both scheduler
and webserver.

The volume for dags is mapped in docker compose, use at convenience. 

