FROM python:3.12-slim

ENV LISTEN_PORT=1888
ENV DEFAULT_BROKER_HOST=iombian-mosquitto
ENV DEFAULT_BROKER_PORT=8000
ENV DEFAULT_SSL_CONNECTION=false

COPY hivemq-mqtt-web-client/assets /app/assets
COPY hivemq-mqtt-web-client/css /app/css
COPY hivemq-mqtt-web-client/fancybox /app/fancybox
COPY hivemq-mqtt-web-client/js /app/js
COPY hivemq-mqtt-web-client/.htaccess /app
COPY hivemq-mqtt-web-client/config.js /app
COPY hivemq-mqtt-web-client/HEADER /app
COPY hivemq-mqtt-web-client/index.html /app
#COPY hivemq-mqtt-web-client/LICENSE /app

COPY env-vars-entrypoint.sh /env-vars-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/bin/bash", "/env-vars-entrypoint.sh"]

CMD ["sh", "-c", "python -m http.server ${LISTEN_PORT}"]