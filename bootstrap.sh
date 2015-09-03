#!/bin/bash

${SPARK_HOME}/sbin/start-master.sh -h $HOSTNAME
sleep 10
${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.worker.Worker spark://${HOSTNAME}:7077
