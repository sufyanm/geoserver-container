# GeoServer Container

Builds a Docker image of GeoServer deployed on Tomcat 9 (Corretto 11).

## Building

Build the GeoServer image:

```
docker build -t geoserver .
```

By default, this will build a GeoServer 2.20.0 image.

### Building a different version

A different version of the GeoServer image can be built by providing the `GEOSERVER_VERSION` and `GEOSERVER_SHA1` build-time variables.

A list of versions and file hashes can be found under the [GeoServer project on SourceForge](https://sourceforge.net/projects/geoserver/files/GeoServer/).

Example command to build a GeoServer 2.19.3 image:

```
docker build --build-arg GEOSERVER_VERSION=2.19.3 --build-arg GEOSERVER_SHA1=a1793fb57004341b7c94f4b4f09428b2493b9fa6 -t geoserver .
```

### Building a nightly build

An image of a GeoServer nightly build can be built by providing the `GEOSERVER_NIGHTLY` build-time variable.

Example command to build an image from the latest main nightly build:

```
docker build --build-arg GEOSERVER_NIGHTLY=main -t geoserver .
```

## Running

Run GeoServer:

```
docker run -it -p 8080:8080 geoserver
```

Once the container completes starting up, GeoServer can be accessed at [http://localhost:8080/geoserver](http://localhost:8080/geoserver).

### Data directory

An external data directory should be mounted and the environment variable `GEOSERVER_DATA_DIR` set.

### Disable web interface

The web interface can be disabled by setting the environment variable:

```
CATALINA_OPTS=-DGEOSERVER_CONSOLE_DISABLED=true
```