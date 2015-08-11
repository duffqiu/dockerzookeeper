FROM duffqiu/zookeeper:latest
MAINTAINER duffqiu@gmail.com


ADD conf/zoo.cfg conf/zoo.cfg
ADD conf/jaas.conf conf/jaas.conf
ADD conf/java.env conf/java.env

ADD keystore/keystore.jks conf/keystore.jks
ADD keystore/cert.cer  conf/cert.cer
ADD keystore/truststore.jks conf/truststore.jks

VOLUME /zookeeper/conf

VOLUME /zookeeper/data

ENTRYPOINT ["/bin/bash", "-c"]
CMD [ "/usr/bin/tail -f /dev/null" ]
