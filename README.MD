# Airflow 
* https://airflow.incubator.apache.org/
* https://github.com/apache/incubator-airflow


# Prepare
* install Docker 
* install docker-compose 

# Docker Airflow 
* use the docker to deploy the airflow 
* docker-compose.local.yml ,use the local machine 
* docker-compose.celery.yml , you can deploy on mutimachine worker


## Local Mode 
* just run `docker-compose -f docker-compose.local.yml up -d`

# Muti Mode 
* just run `docker-compose -f docker-compose.celery.yml up -d`
