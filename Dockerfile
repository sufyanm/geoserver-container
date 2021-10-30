FROM amazonlinux:2

ARG GEOSERVER_VERSION=2.20.0
ARG GEOSERVER_SHA1=e4499ab77d6f4668047ebbcf8f6ff036b92478f7

WORKDIR /tmp

RUN set -eux; \
    yum install -y unzip wget; \
    wget https://downloads.sourceforge.net/project/geoserver/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-war.zip; \
    sha1sum geoserver-${GEOSERVER_VERSION}-war.zip | grep $GEOSERVER_SHA1; \
    unzip geoserver-${GEOSERVER_VERSION}-war.zip

# Build final image
FROM tomcat:9-jdk11-corretto

COPY server.xml /usr/local/tomcat/conf/server.xml
COPY --from=0 /tmp/geoserver.war /usr/local/tomcat/webapps

RUN chown -R 91:91 /usr/local/tomcat

USER 91