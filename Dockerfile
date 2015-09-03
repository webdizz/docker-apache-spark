FROM webdizz/baseimage-java8:8u45

MAINTAINER Izzet Mustafayev

ENV SPARK_VERSION 1.2.1
ENV HADOOP_VERSION 2.4
ENV SPARK_HOME /opt/spark

RUN curl -s http://d3kbcqa49mib13.cloudfront.net/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz | tar -xz -C /opt
RUN ln -s /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} ${SPARK_HOME} \
    && chmod +x ${SPARK_HOME}/bin/*.sh \
    && chmod +x ${SPARK_HOME}/sbin/*.sh

RUN rm -rf /etc/service/sshd/down && /etc/my_init.d/00_regen_ssh_host_keys.sh

ADD bootstrap.sh /etc/bootstrap.sh
RUN chmod +x /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]

EXPOSE 7077 8080
