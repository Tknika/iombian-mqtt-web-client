# IoMBian MQTT Web Client

Custom image to deploy an MQTT web client very easily on IoMBian devices.


## Build the image

To build the docker image, from the cloned repository, execute the docker build command in the same level as the Dockerfile:

```
docker build -t ${IMAGE_NAME}:${IMAGE_VERSION} .
```

For example: ```docker build -t iombian-mqtt-web-client:latest .```


## Launch de container

After building the image, execute it with docker run:

```
docker run --name ${CONTAINER_NAME} --rm -d -p 1888:1888 -e DEFAULT_BROKER_HOST=broker.hivemq.com -e DEFAULT_BROKER_PORT=8000 iombian-mqtt-web-client:latest
```

- **--name** is used to define the name of the created container.
- **--rm** can be used to delete the container when it stops. This parameter is optional.
- **-d** is used to run the container detached. This way the container will run in the background. This parameter is optional.
- **-p** is used to map a port of the container on the host.
- **-e** can be used to define the environment variables:
  - LISTEN_PORT: the internal port where the server should listen to new connections. Default value is 1888.
  - DEFAULT_BROKER_HOST: the default MQTT broker that the client should connect to. Default value is iombian-mosquitto.
  - DEFAULT_BROKER_PORT: the default port to be used to establish the connection. Default value is 8000.
  - DEFAULT_SSL_CONNECTION: enable a SSL connection to the MQTT broker. Default value is false.

Otherwise, a ```docker-compose.yml``` file can also be used to launch the container:

```yaml
version: '3'

services:
  iombian-mqtt-web-client:
    image: iombian-mqtt-web-client:latest
    container_name: iombian-mqtt-web-client
    restart: unless-stopped
    ports:
      - "1888:1888"
    environment:
      - "LISTEN_PORT=1888"
      - "DEFAULT_BROKER_HOST=broker.hivemq.com"
      - "DEFAULT_BROKER_PORT=8884"
      - "DEFAULT_SSL_CONNECTION=true"
```

```
docker compose up -d
```

## Author

(c) 2024 [Aitor Iturrioz Rodríguez](https://github.com/bodiroga) ([Tknika](https://tknika.eus/))
