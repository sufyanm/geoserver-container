# GeoServer Container

Builds a Docker image of GeoServer 2.20.0 deployed on Tomcat 9 (Amazon Corretto 11).

## Data Directory

An external data directory should be mounted and the environment variable `GEOSERVER_DATA_DIR=/var/geoserver` set.

## Web Interface

The web interface can be disabled by setting the environment variable:

`CATALINA_OPTS="$CATALINA_OPTS -DGEOSERVER_CONSOLE_DISABLED=true"`

## Building

Build the GeoServer image:

`docker build -t geoserver:2.20.0 .`

## Running

Start GeoServer:

`docker run -it -e GEOSERVER_DATA_DIR=/var/geoserver -p 8080:8080 geoserver:2.20.0`

Once the container completes starting up, GeoServer can be accessed at http://localhost:8080.