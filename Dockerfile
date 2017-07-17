FROM ubuntu:14.04

MAINTAINER Bruce <nicefish66@gmail.com>

# use the tshua source
COPY config/sources.list /etc/apt/sources.list

RUN    apt-get update -y \
    && apt-get install -y wget \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && apt-get install -y python \
    && python get-pip.py \
    && apt-get install -y --no-install-recommends\
               python-dev \
               libkrb5-dev \
               libsasl2-dev \
               libssl-dev \
               libffi-dev \
               build-essential \
               libblas-dev \
               liblapack-dev


ENV AIRFLOW_HOME /workspace/airflow

COPY config/airflow.cfg ${AIRFLOW_HOME}/airflow.cfg

COPY ./requirements.txt .

COPY script/entrypoint.sh /entrypoint.sh


#prepare env
RUN    mkdir -p /scheduler/log \
    && mkdir -p ${AIRFLOW_HOME}

RUN pip install -i 'http://mirrors.aliyun.com/pypi/simple/' -r ./requirements.txt --trusted-host mirrors.aliyun.com

WORKDIR ${AIRFLOW_HOME}
EXPOSE 8080 5555 8793

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]