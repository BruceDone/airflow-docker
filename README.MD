# Airflow 
* https://airflow.incubator.apache.org/
* https://github.com/apache/incubator-airflow


# Prepare
* install Docker 
* install docker-compose 

# Docker Airflow 
* use the docker to deploy the airflow 
* docker-compose.local.yml ,use the local machine 
* docker-compose.yml , you can deploy on muti machine worker


## Local Mode 
* just run `docker-compose -f docker-compose.local.yml up -d`

# Muti Mode 
* just run `docker-compose up -d`

# TODO 
* [x] - Using the ubuntu image base.
* [ ] - Using jinjia template engine to adjust the airflow.cfg value. 