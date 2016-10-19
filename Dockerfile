FROM java:alpine

MAINTAINER mkraemer Cathbad@t-online.de

ENV KARAF_VERSION=4.0.7

RUN adduser -S karaf karaf

USER karaf

RUN wget http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz ;\
    mkdir -p /opt ;\ 
    tar -C /opt -xzf apache-karaf-${KARAF_VERSION}.tar.gz ;\
    rm apache-karaf-${KARAF_VERSION}.tar.gz ;\
    ln -s /opt/apache-karaf-${KARAF_VERSION} /opt/karaf ;\
    mkdir /deploy

VOLUME ["/deploy"]

    #  SSH  ADMIN RMI
EXPOSE 8101 8181  1099

RUN chmod +x /opt/karaf/bin/karaf /opt/karaf/bin/status /opt/karaf/bin/client

WORKDIR /opt/karaf

ENTRYPOINT ["/opt/karaf/bin/karaf", "server", "clean"]
