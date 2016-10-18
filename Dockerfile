FROM java:alpine

MAINTAINER mkraemer Cathbad@t-online.de

ENV KARAF_VERSION=4.0.7

RUN wget http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz
RUN mkdir -p /opt/karaf 
RUN tar -C /opt/karaf -xzf apache-karaf-${KARAF_VERSION}.tar.gz
RUN rm apache-karaf-${KARAF_VERSION}.tar.gz
RUN mkdir /deploy

VOLUME ["/deploy"]

    #  SSH  ADMIN RMI
EXPOSE 8101 8181  1099

# RUN chmod +x /opt/karaf/bin/karaf /opt/karaf/bin/status /opt/karaf/bin/client

WORKDIR /opt/karaf

ENTRYPOINT ["/opt/karaf/bin/karaf", "server", "clean"]
