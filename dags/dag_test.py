# -*- coding: utf-8 -*-
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2017, 5, 6),
    'email': ['airflow@airflow.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    # 'queue': 'bash_queue',
    # 'pool': 'backfill',
    # 'priority_weight': 10,
    # 'end_date': datetime(2016, 1, 1),
}

dag = DAG('run_hello_world', default_args=default_args, schedule_interval='*/5 * * * *')

t1 = BashOperator(
    task_id='print_date',
    bash_command='echo hellow world',
    dag=dag)

t2 = BashOperator(
    task_id='templated',
    bash_command='echo i now here ',
    dag=dag)

t1 >> t2  # t2.set_upstream(t1)
