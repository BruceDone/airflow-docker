FROM python:2.7.12

MAINTAINER Bruce <nicefish66@gmail.com>

ENV WorkingDir /workspace/airflow
ENV AIRFLOW_HOME /workspace/airflow
ENV TZ Asia/Shanghai

# set time zone to China
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p ${WorkingDir}

COPY ./requirements.txt .

RUN pip install -i 'http://mirrors.aliyun.com/pypi/simple/' -U -r ./requirements.txt --trusted-host mirrors.aliyun.com

EXPOSE 8080 

COPY ./config/airflow.cfg ${WorkingDir}

WORKDIR ${WorkingDir}

COPY run.sh ${WorkingDir}/

