FROM java:alpine

MAINTAINER mkraemer Cathbad@t-online.de

ENV KARAF_VERSION=4.0.7

RUN wget http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir /opt/karaf; \
    tar --strip-components=1 -C /opt/karaf -xzf apache-karaf-${KARAF_VERSION}.tar.gz; \
    rm apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir /deploy; \
    sed -i 's/^\(felix\.fileinstall\.dir\s*=\s*\).*$/\1\/deploy/' /opt/karaf/etc/org.apache.felix.fileinstall-deploy.cfg

VOLUME ["/deploy"]

    #  SSH  ADMIN RMI
EXPOSE 8101 8181  1099

RUN chmod +x \
  /opt/karaf/bin/karaf \
  /opt/karaf/bin/status \
  /opt/karaf/bin/client

WORKDIR /opt/karaf

ENTRYPOINT ["/opt/karaf/bin/karaf", "server", "clean"]
