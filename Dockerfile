FROM duffqiu/dockerjdk7:latest
MAINTAINER duffqiu@gmail.com

RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7
RUN yum -y  update
RUN yum install -y wget tar

RUN wget --no-cookies --no-check-certificate http://ftp.riken.jp/net/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz

RUN tar zxf zookeeper-3.4.6.tar.gz
RUN mv zookeeper-3.4.6 zookeeper
RUN rm -rf zookeeper-3.4.6.tar.gz

ENV JAVA_HOME=/usr/java/jdk1.7.0_75 JRE_HOME=/usr/java/jdk1.7.0_75/jre PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin CLASSPATH=:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib

VOLUME /zookeeper/conf

VOLUME /zookeeper/data

WORKDIR zookeeper

ADD conf/log4j.properties conf/log4j.properties  
ADD conf/zoo.cfg conf/zoo.cfg

EXPOSE 2181 2888 3888

ENTRYPOINT [ "bin/zkServer.sh" ]

CMD ["start-foreground"]
